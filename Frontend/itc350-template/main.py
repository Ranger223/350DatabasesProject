import os
from flask import Flask, render_template, request, redirect, url_for, flash
import pymssql
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

# Initialize the flask app
app = Flask(__name__)
app.secret_key = os.getenv("SECRET")


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

    query = "SELECT CelBodyName as 'Primary Body', BodyCount, OrbSysName, OSystemID FROM OrbMemCount ORDER BY OrbSysName"
    cursor.execute(query)
    result = cursor.fetchall()
    conn.close()
    return result

def get_curr_user():
    # Create a new database connection for each request
    conn = get_db_connection()  # Create a new database connection
    cursor = conn.cursor() # Creates a cursor for the connection, you need this to do queries
    # Query the db
    #query = ("SELECT * FROM DBUSER WHERE Username=?;", "captainshark")

    cursor.execute("SELECT * FROM DBUSER WHERE Username=%s;", ("captainshark",))
    # Get result and close
    result = cursor.fetchall() # Gets result from query
    conn.close() # Close the db connection (NOTE: You should do this after each query, otherwise your database may become locked)
    return result

#Get members of a system based on systemID
def get_system_view(systemid):
    conn = get_db_connection()
    cursor = conn.cursor()

    query = "SELECT CelBodyName, Mass, Radius, CelBodyTypeName, HabName, Colonizable, FactionName, OrbSysName FROM OrbSysView WHERE OrbSysID=%s" 
    cursor.execute(query,(systemid))
    result = cursor.fetchall()
    print(systemid)
    print(result)
    conn.close()
    return result

def get_search_results(search):
    conn = get_db_connection()
    cursor = conn.cursor()
    query = "SELECT CelBodyName, DIFFERENCE(CelBodyName, %s) FROM CelBodyView where DIFFERENCE(CelBodyName, %s) > 2"
    cursor.execute(query, (search, search))
    result = cursor.fetchall()
    #print(result)
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
    query = "SELECT CelBodyID, OrbSysID, CelBodyName, OrbSysName, CelBodyTypeName, HabName, Colonizable, FactionName FROM UserSavedView WHERE UID=%s"
    cursor.execute(query,(uid))
    result = cursor.fetchall()
    print(uid)
    print(result)
    conn.close()
    return result

def get_faction_planets(faction):
    conn = get_db_connection()
    cursor = conn.cursor()
    query = "SELECT * FROM FacConVeiw WHERE FactionName = %s"
    cursor.execute(query,(faction))
    result = cursor.fetchall()
    conn.close()
    return result

#get current user
def get_curr_user():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM DBUSER WHERE Username=%s;", ("funkyspacesattellite",))
    result = cursor.fetchall()
    conn.close()
    return result

#get current user faction
def get_curr_user_fac(user):
    conn = get_db_connection()
    cursor = conn.cursor()
    FacID = user[5]
    cursor.execute("SELECT FactionName FROM FACTION WHERE FacID=%d;", (FacID,))
    result = cursor.fetchall()
    conn.close()
    return result

def validate_password(username, currPass):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT PasswordHash FROM DBUSER WHERE Username=%s;", (username,))
    result = cursor.fetchall()
    conn.close()
    if result[0][0] == currPass:
        return True
    else:
        return False
    
def update_password(username, newPass):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("UPDATE DBUSER SET PasswordHash=%s WHERE Username=%s;", (newPass, username))
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
    conn.close()
    return result

# ------------------------ END FUNCTIONS ------------------------ #


# ------------------------ BEGIN ROUTES ------------------------ #
# EXAMPLE OF GET REQUEST

@app.route("/celbody/<celbodyid>", methods=["GET"])
def celbodyview(celbodyid):
    data = cel_body_view(celbodyid)
    return render_template("celbodyview.html", item = data[0])

#show all planets
@app.route("/", methods=["GET"])
def home():
    #I reccommend making a function like the ones above to get all planets
    return render_template("home.html")

@app.route("/user", methods=["GET"])
def userprofile():
    user = get_curr_user() # Call defined function to get all items
    userFac = get_curr_user_fac(user[0])
    return render_template("user.html", user=user[0], userFac = userFac[0]) # Return the page to be rendered

#shows a user's saved planets
@app.route("/saved", methods=["GET"])
def usersaved():
    user = get_curr_user()
    UID = 1
#    UID = user[0][0]
    data = get_saved_planets(UID)
    return render_template("userplanets.html", items=data)

#shows a faction's planets
@app.route("/faction/<facid>") # //4/faciont
def factionplanet(facid):
    get_faction_planets(facid)
    return render_template("factionplanets.html")

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

# EXAMPLE OF POST REQUEST
@app.route("/update-password", methods=["POST"])
def change_password():
    try:
        # Get items from the form
        data = request.form
        curr_pass = data["currPass"] # This is defined in the input element of the HTML form on index.html
        new_pass = data["newPass"] # This is defined in the input element of the HTML form on index.html

        user = get_curr_user()
        if validate_password(user[0][1], curr_pass) != True:
            flash("Current password was incorrect", "error")
            return redirect(url_for("userprofile"))
        else :
            update_password(user[0][1], new_pass)
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
        user = get_curr_user()
        update_email(user[0][1], new_email)
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
# ------------------------ END ROUTES ------------------------ #


# listen on port 8080
if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080, debug=True) # TODO: Students PLEASE remove debug=True when you deploy this for production!!!!!
