import os
from flask import Flask, render_template, request, redirect, url_for, flash, send_from_directory
import pymssql
from dotenv import load_dotenv
import bcrypt
from flask import Flask, session
from flask_session import Session

# Load environment variables from .env file
load_dotenv()

# Initialize the flask app
app = Flask(__name__)
app.secret_key = os.getenv("SECRET")

app.config['SESSION_TYPE'] = 'filesystem'
app.config['SECRET_KEY'] = 'xIc1m98'

# ------------------------ BEGIN FUNCTIONS ------------------------ #
# Function to retrieve DB connection
def get_db_connection():
    conn = pymssql.connect(
        server=os.getenv("DB_HOST"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        database=os.getenv("DB_DATABASE"),
    )
    return conn

#get all orbital systems
def get_orbsys_view():
    conn = get_db_connection()
    cursor = conn.cursor()

    query = "SELECT OSystemID, CelBodyID, CelBodyName as 'Primary Body', BodyCount, OrbSysName FROM OrbMemCount ORDER BY OrbSysName"
    cursor.execute(query)
    result = cursor.fetchall()
    conn.close()
    return result

#Get members of a system based on systemID
def get_system_view(systemid):
    conn = get_db_connection()
    cursor = conn.cursor()

    query = "SELECT CBID, CelBodyName, Mass, Radius, CelBodyTypeName, HabName, Colonizable, OrbSysName FROM OrbSysView WHERE OrbSysID=%s" 
    cursor.execute(query,(systemid))
    result = cursor.fetchall()
    conn.close()
    return result

def get_search_results(search):
    conn = get_db_connection()
    cursor = conn.cursor()
    query = "SELECT CelBodyName, CelBodyID, DIFFERENCE(CelBodyName, %s) FROM CELESTIALBODY where DIFFERENCE(CelBodyName, %s) > 2"
    cursor.execute(query, (search, search))
    result = cursor.fetchall()
    conn.close()
    return result

def get_all_planets():
    conn = get_db_connection()
    cursor = conn.cursor()
    query = "SELECT * FROM CelBodyVeiw"
    result = cursor.fetchall()
    conn.close()
    return result

def get_saved_planets(uid):
    conn = get_db_connection()
    cursor = conn.cursor()
    query = "SELECT CelBodyID, OrbSysID, CelBodyName, OrbSysName, CelBodyTypeName, HabName, Colonizable FROM UserSavedView WHERE UID=%s"
    cursor.execute(query,(uid))
    result = cursor.fetchall()
    conn.close()
    return result

def get_faction_planets(faction):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT CelBodyID, OrbSysID, CelBodyName, OrbSysName, CelBodyTypeName, FactionName FROM FacConView WHERE FacID=%d;", (faction))
    result = []
    result.append(cursor.fetchall())
    cursor.execute("SELECT FactionName FROM FACTION WHERE FacID=%d;", (faction))
    result.append(cursor.fetchall())
    conn.close()
    return result

#get current user
def get_curr_user():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM DBUSER WHERE UID=%s;", (session['userID'],))
    result = cursor.fetchall()
    conn.close()
    return result

#get current user faction
def get_curr_user_fac(user):
    conn = get_db_connection()
    cursor = conn.cursor()
    FacID = user[5]
    if FacID == None:
        FacID = 0
    cursor.execute("SELECT FactionName FROM FACTION WHERE FacID=%s;", (FacID,))
    result = cursor.fetchall()
    conn.close()
    return result

def validate_password(username, currPass):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT PasswordHash FROM DBUSER WHERE Username = %s;", (username,))
    result = cursor.fetchone()
    if result:
        hashedPassword = result[0].encode('utf-8')
        passwordBytes = currPass.encode('utf-8')
        if bcrypt.checkpw(passwordBytes, hashedPassword):
            return True
        else:
            return False
    conn.close()
    
    
def update_password(username, newPass):
    conn = get_db_connection()
    cursor = conn.cursor()
    salt = bcrypt.gensalt()
    password_bytes = newPass.encode('utf-8')
    passwordhash = bcrypt.hashpw(password_bytes, salt)
    cursor.execute("UPDATE DBUSER SET PasswordHash=%s WHERE Username=%s;", (passwordhash, username))
    conn.commit()
    conn.close()

def update_email(username, newEmail):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("UPDATE DBUSER SET Email=%s WHERE Username=%s;", (newEmail, username))
    conn.commit()
    conn.close()

def cel_body_view(celbodyid):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT CelBodyID, OrbSysID, CelBodyName, OrbSysName, Mass, Radius, OrbitalDistance, OrbSysName, CelBodyTypeName, HabName, Colonizable FROM CelBodyView WHERE CelBodyID=%s;", (celbodyid,))
    result = cursor.fetchall()
    if len(session) != 0:
        cursor.execute ("SELECT * FROM SAVED WHERE UID = %s AND CelBodyID = %s", (session['userID'], celbodyid))
        data = cursor.fetchall()
        if not data:
            result.append( False )
        else:
            result.append( True )
    else:
        result.append( False )
    cursor.execute ("SELECT CelBodyID, FacID, FactionName FROM FacConView WHERE CelBodyID = %s", (celbodyid))
    result.append( cursor.fetchall()  )
    conn.close()
    return result

def register_user(username, password, email):
    if password and email and username:
        salt = bcrypt.gensalt()
        password_bytes = password.encode('utf-8')
        passwordhash = bcrypt.hashpw(password_bytes, salt)
        clearance = 1
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("INSERT INTO DBUSER (Username, PasswordHash, Email, Clearance) VALUES (%s, %s, %s, %s)", (username, passwordhash, email, clearance))
        cursor.execute("SELECT Username, UID, Clearance FROM DBUSER WHERE Username = %s;", (username,))
        result = cursor.fetchone()
        create_session(result[0], result[1], result[2])
        conn.commit()
        conn.close()
        result = 1
        return result
    else:
        return 0

def login_user(username, password):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT PasswordHash FROM DBUSER WHERE Username = %s;", (username,))
    result = cursor.fetchone()
    if result:
        hashedPassword = result[0].encode('utf-8')
        passwordBytes = password.encode('utf-8')
        if bcrypt.checkpw(passwordBytes, hashedPassword):
            cursor.execute("SELECT Username, UID, Clearance FROM DBUSER WHERE Username = %s;", (username,))
            result = cursor.fetchone()
            create_session(result[0], result[1], result[2])
            conn.close()
            return True
        conn.close()
    return False

def create_session(username, userID, clearance):
    session['username'] = username
    session['userID'] = userID
    session['clearance'] = clearance
    return "success"

def get_session_username():
    username = session.get('username')
    return username

def get_session_userID():
    userID = session.get('userID')
    return userID

def get_session_clearance():
    clearance = session.get('clearance')
    return clearance

def end_session():
    session.clear()
    return "success"
  
def all_body_view():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT CelBodyID, OrbSysID, CelBodyName, OrbSysName, CelBodyTypeName FROM CelBodyView;")
    result = cursor.fetchall()
    conn.close()
    return result

def save_planet(UID, CelBodyID):
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("INSERT INTO SAVED (UID, CelBodyID) VALUES (%s, %s)", (UID, CelBodyID))
        conn.commit()
        conn.close()
        return 1
    except Exception as e:
        print(e)
        return 0

def unsave_planet(UID, CelBodyID):
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("DELETE FROM SAVED WHERE UID = %s AND CelBodyID = %s", (UID, CelBodyID))
        conn.commit()
        conn.close()
        return 1
    except Exception as e:
        print(e)
        return 0

def join_faction(UID, FacID):
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("UPDATE DBUSER SET FacID = %s WHERE UID = %s", (FacID, UID))
        conn.commit()
        conn.close()
        return 1
    except Exception as e:
        print(e)
        return 0

def get_all_factions():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT FacID, FactionName FROM FACTION")
    result = cursor.fetchall()
    conn.close()
    return result

# ------------------------ END FUNCTIONS ------------------------ #


# ------------------------ BEGIN ROUTES ------------------------ #
# EXAMPLE OF GET REQUEST

@app.route("/joinFaction/<facID>", methods=["GET"])
def joinFaction(facID):
    if(session['userID'] == None):
        return redirect(url_for("getlogin"))
    UID = session['userID']
    join_faction(UID, facID)
    return redirect(url_for("userprofile"))

@app.route("/save/<celbodyid>", methods=["GET"])
def saveplanet(celbodyid):
    if(session['userID'] == None):
        return redirect(url_for("getlogin"))
    UID = session['userID']
    if celbodyid != 0 and save_planet(UID, celbodyid):
        return redirect(url_for("celbodyview", celbodyid=celbodyid))
    else:
        return redirect(url_for("home"))

@app.route("/unsave/<celbodyid>", methods=["GET"])
def unsaveplanet(celbodyid):
    if(session['userID'] == None):
        return redirect(url_for("getlogin"))
    UID = session['userID']
    if unsave_planet(UID, celbodyid):
        return redirect(url_for("celbodyview", celbodyid=celbodyid))
    else:
        return redirect(url_for("home"))

@app.route("/celbody/<celbodyid>", methods=["GET"])
def celbodyview(celbodyid):
    data = cel_body_view(celbodyid)
    #print(data[-1])
    return render_template("celbodyview.html", item = data[0], saved = data[1], factions=enumerate(data[2]), FacLen=len(data[2]))

#show all planets
@app.route("/", methods=["GET"])
def home():
    #I recommend making a function like the ones above to get all planets
    data = all_body_view()
    return render_template("home.html", data=data)

@app.route("/user", methods=["GET"])
def userprofile():
    if len(session) == 0:
        return redirect(url_for("getlogin"))
    user = get_curr_user()[0] # Call defined function to get all items
    #print(user)
    
    #print(user[5])
    userFac = get_curr_user_fac(user)
    #print(userFac)
    return render_template("user.html", user=user, userFac = userFac[0], factions = get_all_factions()) # Return the page to be rendered

#shows a user's saved planets
@app.route("/saved", methods=["GET"])
def usersaved():
    if len(session) == 0:
        return redirect(url_for("getlogin"))
    user = get_curr_user()
    UID = session['userID']
    data = get_saved_planets(UID)
    return render_template("userplanets.html", items=data)

#shows a faction's planets
@app.route("/faction/<facid>") # //4/faciont
def factionplanet(facid):
    facinfo = get_faction_planets(facid)
    return render_template("factionplanets.html", factionInfo=facinfo[0], facName=facinfo[1][0][0])

#displays All orbital systems
@app.route("/orbsys", methods=["GET"])
def obsys():
    items = get_orbsys_view() # Call defined function to get all items
    return render_template("orbsysview.html", items=items) # Return the page to be rendered

#displays Members of an Orbital system
@app.route("/systemview/<systemid>", methods=["GET"])
def systemview(systemid):
    items = get_system_view(systemid)
    return render_template("systemview.html", items=items)

#login page access
@app.route("/loggering", methods=["POST"])
def loginview():
    data = request.form
    username = data["username"]
    password = data["password"]
    if login_user(username, password):
        return redirect(url_for("usersaved"))
    else:
        flash("Incorrect Login", "error")
        return redirect(url_for("getlogin"))
    
@app.route("/logout", methods=["GET"])
def logout():
    end_session()
    return redirect(url_for("home"))

@app.route("/registering", methods=["POST"])
def registeruser():
    data = request.form
    username = data["username"]
    password = data["password"]
    email = data["email"]
    if register_user(username, password, email):
        return redirect(url_for("home"))
    else:
        return redirect(url_for("getregister"))

@app.route("/register", methods=["GET"])
def getregister():
    return render_template("register.html")

@app.route("/login", methods=["GET"])
def getlogin():
    return render_template("login.html")

# EXAMPLE OF POST REQUEST
@app.route("/update-password", methods=["POST"])
def change_password():
    try:
        # Get items from the form
        data = request.form
        curr_pass = data["currPass"] # This is defined in the input element of the HTML form on index.html
        new_pass = data["newPass"] # This is defined in the input element of the HTML form on index.html
        assert curr_pass != "", "Current password cannot be empty" # Check if the current password is empty
        assert new_pass != "", "New password cannot be empty" # Check if the new password is empty
        
        username = session['username']
        if validate_password(username, curr_pass) != True:
            flash("Current password was incorrect", "error")
            return redirect(url_for("userprofile"))
        else :
            update_password(username, new_pass)
            flash("Password changed successfully", "success")
            return redirect(url_for("userprofile"))
        
    # If an error occurs, this code block will be called
    except Exception as e:
        flash(f"An error occurred: {str(e)}", "error") # Send the error message to the web page
        return redirect(url_for("userprofile")) # Redirect to home
    
@app.route("/update-email", methods=["POST"])
def change_email():
    try:
        # Get items from the form
        data = request.form
        new_email = data["newEmail"] # This is defined in the input element of the HTML form on index.html
        assert new_email != "", "New email cannot be empty" # Check if the new email is empty
        username = session['username']
        update_email(username, new_email)
        flash("Email changed successfully", "success")
        return redirect(url_for("userprofile"))
        
    # If an error occurs, this code block will be called
    except Exception as e:
        flash(f"An error occurred: {str(e)}", "error") # Send the error message to the web page
        return redirect(url_for("userprofile")) # Redirect to home

@app.route("/search", methods=["Post"])
def search():
    data = request.form
    search = data.get("search")
    items = get_search_results(search)
    return render_template("searchresults.html", items=items)


@app.route('/favicon.ico')
def favicon():
    return send_from_directory(os.path.join(app.root_path, 'static'),
        'favicon.ico',mimetype='image/vnd-microsoft.icon')
# ------------------------ END ROUTES ------------------------ #


# listen on port 8080
if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080, debug=False) # TODO: Students PLEASE remove debug=True when you deploy this for production!!!!!
