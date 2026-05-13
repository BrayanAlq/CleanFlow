import requests
import json
import dotenv
import os

dotenv.load_dotenv(dotenv_path='.env')

API_URL = os.getenv('API_URL')

admin = {
  'username': 'admin1',
  'password': 'password',
}

containers = [
  {
    'name': 'Contenedor 1',
    'address_name': 'Av. Palermo, Los Corales',
    'image_path': './images/container/container-1.jpg',
    'latitude': -12.075672631655728,
    'longitude': -77.02297441823148
  },
  {
    'name': 'Contenedor 2',
    'address_name': 'Av. de las Américas, Los Corales',
    'image_path': './images/container/container-2.jpg',
    'latitude': -12.0778052320788,
    'longitude': -77.02323344838479
  },
  {
    'name': 'Contenedor 3',
    'address_name': 'Jr. Los Diamantes, Los Corales',
    'image_path': './images/container/container-3.jpg',
    'latitude': -12.079300493516689,
    'longitude': -77.02258169507195
  },
  {
    'name': 'Contenedor 4',
    'address_name': 'Jr. Los Diamantes, Manuel Toribio Ureta',
    'image_path': './images/container/container-4.jpg',
    'latitude': -12.078088835925922,
    'longitude':  -77.0204716537991
  },
  {
    'name': 'Contenedor 5',
    'address_name': 'Av. México, Juan Castro',
    'image_path': './images/container/container-5.avif',
    'latitude': -12.074683345214586,
    'longitude': -77.02250097760238
  },
  {
    'name': 'Contenedor 6',
    'address_name': 'Juan Castro, Benito Pardo Figueroa',
    'image_path': './images/container/container-6.avif',
    'latitude': -12.075404192281026,
    'longitude': -77.02035303573943
  },
  {
    'name': 'Contenedor 7',
    'address_name': 'Av. de las Américas, Juan Castro',
    'image_path': './images/container/container-7.avif',
    'latitude': -12.07606740446841, 
    'longitude': -77.0188864448201
  },
  {
    'name': 'Contenedor 8',
    'address_name': 'Av. de las Américas, Av. Parinacochas',
    'image_path': './images/container/container-8.jpg',
    'latitude': -12.075850296149477,
    'longitude': -77.01685968948418
  },
  {
    'name': 'Contenedor 9',
    'address_name': 'Av. Palermo, Av. Canadá',
    'image_path': './images/container/container-9.jpg',
    'latitude': -12.081636976208367,
    'longitude': -77.02317320057335
  },
  {
    'name': 'Contenedor 10',
    'address_name': 'Av. Paseo de la República, Av. Canadá',
    'image_path': './images/container/container-10.jpg',
    'latitude': -12.082452720929574,
    'longitude':  -77.02620427104006
  },
  {
    'name': 'Contenedor 11',
    'address_name': 'Av. Nicolás Arriola, Av. Canadá',
    'image_path': './images/container/container-11.webp',
    'latitude': -12.08334558391621,
    'longitude': -77.01417244588795
  },
  {
    'name': 'Contenedor 12',
    'address_name': 'Av. Santa Catalina, Av. San Eugenio',
    'image_path': './images/container/container-12.jpg',
    'latitude': -12.084765585020095,
    'longitude': -77.01847453055971
  },
  {
    'name': 'Contenedor 13',
    'address_name': 'Av. Carlos Villarán, Av. Nicolás Arriola',
    'image_path': './images/container/container-13.jpg',
    'latitude': -12.08831874715031,
    'longitude':  -77.01675026118558
  },
  {
    'name': 'Contenedor 14',
    'address_name': 'Av. Canadá, Jr. Victor Alzamora',
    'image_path': './images/container/container-14.jpg',
    'latitude': -12.08398830336631,
    'longitude': -77.01233135349702
  }
]

def load_container(container, token):
  with open(container['image_path'], 'rb') as image:
    r = requests.post(
      f'{API_URL}/container',
      files={
        'container': (None, json.dumps(container), 'application/json'),
        'image': image
      },
      headers={'Authorization': f'Bearer {token}'}
    )
  return r.json()

def login_admin(admin):
  r = requests.post(f'{API_URL}/auth/login', json=admin)
  return r.json()

if __name__ == '__main__':
  response = login_admin(admin)
  print(json.dumps(response, indent=2, ensure_ascii=False))
  token = response['token']

  containers_with_id = []

  for container in containers:
    response = load_container(container, token)
    containers_with_id.append(response)
    print(json.dumps(response, indent=2, ensure_ascii=False))
