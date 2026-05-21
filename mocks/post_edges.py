import json
import requests

token = ''

def open_file(path):
  return open(path, 'r')

def create_edge(edge):
  response = requests.post(
    'http://localhost:8080/edge',
    json=edge,
    headers={'Authorization': f'Bearer {token}'}
  )

file = open_file('./data/edges.json')
data = json.load(file)

for edge in data:
  if edge["id_start"] != edge["id_end"]:
    new_edge = {
      "id_first_container": edge["id_start"],
      "id_second_container": edge["id_end"],
      "polyline": edge["geometry"],
      "duration": edge["duration"]
    }
    create_edge(new_edge)
    print(json.dumps(new_edge, indent=2, ensure_ascii=False))