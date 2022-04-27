# Mini challenge 2 

## First part:
1. Define a flask route so that new vehicles can be registered.
2. Define a flask route so that all vehicles can be read (scan).
3. Define a flask route so that single vehicles can be read by their id (read one).
4. Define a flask route so that vehicles can be updated.
5. Define a flask route so that vehicles can be deactivated.

## Second part:
1. Create a new database module to handle vehicle operations.
2. Create a function in vehicle.py that allows us to insert new vehicle records. 
3. Create a function in vehicle.py that allows us to scan all vehicles (display all tabel contests).
4. Create a function in vehicle.py that allows us to select a single vehicle by its ID. 
5. Create a function in vehicle.py that allows us to update a single vehicle by its ID. 
6. Create a function in vehicle.py that allows us todeactivate a single vehicle by its ID. 

## Bonus:
1. Create scripts in utils that allows you to manually test all endpoints and confirm or validate that they work.


## frontend/routes.py
from flask import Flask, render_template
import requests

app = Flask(__name__)

BACKEND_URL = "http://127.0.0.1:5000"

@app.get("/")
def desplay_users():
  url = "%s/%s/" % (BACKEND_URL, "users")
  if response.status_code ==200:
    user_data = response.json().get("users")
    return render_template("index.html", users=user_data)
  else  
    return render_remplate("no_users_error.html")

## frontend/templates/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Users</title>
</head>
<body>
  <ul>
    {% for user in users %}
    <li>
      <h1>
        {{ user ["first_name"] }} {{ user["last_name"] }}
      </h1>
      <p>Hobbies: {{ user["hobbies"] }}</p>
    {% endfor %}
    </li>
  </ul>
</body>
</html>

        <th>Vehicle Type</th>
        <th>Color</th>
        <th>License Plate</th>

          <td>{{ vehicle["v_type"] }}</td>
          <td>{{ vehicle["color"] }}</td>
          <td>{{ vehicle["license_plate"] }}</td>

        {% for vehicle in vehicles %}
      {% for user in users %} 
         <tr>
          <td>{{ vehicle ["v_type"] }}</td>
          <td>{{ vehicle ["color"] }}</td>
          <td>{{ vehicle ["license_plate"] }}</td>
          <td>{{ user ["first_name"] }}</td>
          <td>{{ user ["last_name"] }}</td>
        </tr>
      {% endfor %}
      {% endfor %}        
    
    user["first_name"] }}
