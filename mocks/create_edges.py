import json
import requests
import psycopg2
from psycopg2.extras import RealDictCursor

API_URL = 'http://{localip}:5000/route/v1/driving/' # {lng},{lat};{lng},{lat}
  

conn = psycopg2.connect(
  "dbname='cleanflow-db' user='dbuser' host='localhost' password='password'",
  cursor_factory=RealDictCursor
)

cur = conn.cursor()

cur.execute("""
  SELECT
    id,
    ST_X(location::geometry) AS longitude,
    ST_Y(location::geometry) AS latitude
  FROM containers;
""")
containers = cur.fetchall()

def get_edge(point_one, point_two):
  response = requests.get(f"{API_URL}{point_one['longitude']},{point_one['latitude']};{point_two['longitude']},{point_two['latitude']}")
  return response.json()

def open_json(path):
  return open(path, 'w')
  
file = open_json('./data/edges.json')

data = []
for i in range(len(containers)):
  for j in range(len(containers)):
    edge = get_edge(containers[i], containers[j])
    data.append({
      "id_start": containers[i]["id"],
      "id_end": containers[j]["id"],
      "geometry": edge["routes"][0]["geometry"],
      "duration": edge["routes"][0]["duration"]
    })

file.write(json.dumps(data, indent=2, ensure_ascii=False))
