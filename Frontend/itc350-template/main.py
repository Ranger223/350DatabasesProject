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

def get_all_planets():
    conn = get_db_connection()
    cursor = conn.cursor()
    query = "SELECT * FROM CelBodyVeiw"
    result = cursor.fetchall()
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

# ------------------------ END FUNCTIONS ------------------------ #


# ------------------------ BEGIN ROUTES ------------------------ #
# EXAMPLE OF GET REQUEST

#show all planets
@app.route("/", methods=["GET"])
def home():
    #I reccommend making a function like the ones above to get all planets
    return render_template("home.html")

#shows a user's saved planets
@app.route("/<userid>/saved", methods=["GET"])
def usersaved(userid):

    return render_template("userplanets.html")

#shows a faction's planets
@app.route("/<facid>/faction") # //4/faciont
def factionplanet(facid):
    get_faction_planets(facid)
    return render_template("factionplanets.html")

#displays All orbital systems
@app.route("/orbsys", methods=["GET"])
def obsys():
    items = get_orbsys_view() # Call defined function to get all items
    return render_template("orbsysview.html", items=items) # Return the page to be rendered

#displays Members of an Orbital system
@app.route("/<systemid>/systemview", methods=["GET"])
def systemview(systemid):
    items = get_system_view(systemid)
    return render_template("systemview.html", items=items)

# EXAMPLE OF POST REQUEST
@app.route("/new-item", methods=["POST"])
def add_item():
    try:
        # Get items from the form
        data = request.form
        item_name = data["name"] # This is defined in the input element of the HTML form on index.html
        item_quantity = data["quantity"] # This is defined in the input element of the HTML form on index.html

        # TODO: Insert this data into the database
        
        # Send message to page. There is code in index.html that checks for these messages
        flash("Item added successfully", "success")
        # Redirect to home. This works because the home route is named home in this file
        return redirect(url_for("home"))

    # If an error occurs, this code block will be called
    except Exception as e:
        flash(f"An error occurred: {str(e)}", "error") # Send the error message to the web page
        return redirect(url_for("home")) # Redirect to home
    
@app.route("/search", methods=["Post"])
def search():
    data = request.form
    return
# ------------------------ END ROUTES ------------------------ #


# listen on port 8080
if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080, debug=True) # TODO: Students PLEASE remove debug=True when you deploy this for production!!!!!
