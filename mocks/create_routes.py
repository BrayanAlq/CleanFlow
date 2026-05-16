import json
import requests
import dotenv
import random
import os

dotenv.load_dotenv(dotenv_path='.env')

API_URL = os.getenv('API_URL')

drivers = [
  {
    "username": "driver1",
    "password": "password"
  },
  {
    "username": "driver2",
    "password": "password"
  },
  {
    "username": "driver3",
    "password": "password"
  },
  {
    "username": "driver4",
    "password": "password"
  },
  {
    "username": "driver5",
    "password": "password"
  },
  {
    "username": "driver6",
    "password": "password"
  },
  {
    "username": "driver7",
    "password": "password"
  },
  {
    "username": "driver8",
    "password": "password"
  },
  {
    "username": "driver9",
    "password": "password"
  },
  {
    "username": "driver10",
    "password": "password"
  },
  {
    "username": "driver11",
    "password": "password"
  },
  {
    "username": "driver12",
    "password": "password"
  },
  {
    "username": "driver13",
    "password": "password"
  },
  {
    "username": "driver14",
    "password": "password"
  },
  {
    "username": "driver15",
    "password": "password"
  }
]

def login(username, password):
  r = requests.post(
    f'{API_URL}/auth/login',
    json={
      'username': username,
      'password': password
    }
  )
  return r.json()

# start route
def create_route(token):
  r = requests.post(
    f'{API_URL}/route',
    headers={'Authorization': f'Bearer {token}'}
  )
  return r.json()

# finish route
def finish_route(token, route_id):
  r = requests.patch(
    f'{API_URL}/route/{route_id}',
    headers={'Authorization': f'Bearer {token}'}
  )

if __name__ == '__main__':
  for driver in drivers:
    response = login(driver['username'], driver['password'])
    print(json.dumps(response, indent=2, ensure_ascii=False))
    token = response['token']

    routes = random.randint(5, 9)

    for _ in range(routes):
      route_response = create_route(token)
      print(json.dumps(route_response, indent=2, ensure_ascii=False))
      finish_route(token, route_response['id'])
