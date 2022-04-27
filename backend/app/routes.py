from flask import (
  Flask,
  request
)

from datetime import datetime

from app.database import user
from app.database import vehicle


app = Flask(__name__)
VERSION = "1.0.0"


@app.route("/version")
def get_version():
  out = {
    "server_time": datetime.now().strftime("%F %H:%M:%S"),
    "version": VERSION
  }
  return out

@app.route("/users/")
def get_all_users():
  user_list = user.scan()
  resp = {
    "status": "ok",
    "message": "success",
    "users": user_list
  }
  return resp

@app.route("/users/<int:pk>/")
def get_user_by_id(pk):
  target_user = user.select_by_id(pk)
  resp = {
    "status": "ok",         
    "message": "success",
  }
  if target_user:           # if 'target_user" is not empty
    resp["user"] = target_user
    return resp
  else:
    resp["status"] = "error"
    resp["message"] = "User not found"
    return resp, 404

@app.route("/users/")
def create_user():
  user_data = request.json      # request is a Flask context object
  user.insert(user_data)
  return "", 204            # No content; successful but no content

@app.route("/users/<int:pk>/")
def update_user(pk):
  user_data = request.json
  user.update(pk, user_data)
  return "", 204
  

@app.route("/users/<int:pk>/")
def deactivate_user(pk):
# user+data = request.json  # needed or not..?..
  user.deactivate(pk)       # Soft Delete
  return "", 204

# ------ Mini Challenge 2 -------------

@app.route("/vehicles/")
def get_all_vehicles():
  vehicle_list = vehicle.scan()
  resp = {
    "status": "ok",
    "message": "success",
    "users": vehicle_list
  }
  return resp

@app.route("/vehicles/")
def create_vehicles():
  vehicle_data = request.json
  vehicle.insert(vehicle_data)
  return "", 204

@app.route("/vehicles/<int:pk>")
def get_vehicle_by_id(pk):
  target_vehicle = vehicle.select_by_id(pk)
  resp = {
    "status": "ok",
    "message": "success"
  }

  if target_vehicle:
    resp["user"] = target_vehicle
    return resp
  else:
    resp["status"] = "error"
    resp["message"] = "User not found"
    return resp, 404

@app.route("/vehicles/<int:pk>/")
def update_vehicle(pk):
  vehicle_data = request.json
  vehicle.update(pk, vehicle_data)
  return "", 204

@app.route("/vehicles/<int:pk>/")
def deactivate_vehicle(pk):
  vehicle.deactivate(pk)
  return "", 204