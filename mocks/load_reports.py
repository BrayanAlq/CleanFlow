import requests
import json
import dotenv
import os
import random

dotenv.load_dotenv(dotenv_path='.env')

API_URL = os.getenv('API_URL')

admin = {
  'username': 'admin1',
  'password': 'password',
}

comentarios = [
    "El contenedor siempre está limpio y lo vacían a tiempo.",
    "A veces se llena demasiado rápido los fines de semana.",
    "La app me avisó correctamente cuándo pasó el camión.",
    "Sería bueno que tuviera una tapa más resistente.",
    "Muy útil que esté cerca de mi casa.",
    "El sensor parece funcionar bien porque casi nunca está saturado.",
    "En las noches suele haber mal olor alrededor.",
    "Me gusta que ahora haya más control del reciclaje.",
    "El chofer pasó más temprano de lo habitual hoy.",
    "El contenedor estuvo lleno durante dos días seguidos.",
    "La ubicación en el mapa es bastante precisa.",
    "Sería ideal agregar separación para plástico y vidrio.",
    "El sistema de notificaciones funciona excelente.",
    "A veces dejan basura fuera del contenedor aunque haya espacio.",
    "El mantenimiento ha mejorado bastante comparado al mes pasado.",
    "El contenedor de mi zona casi nunca tiene problemas.",
    "La tapa estaba rota pero la repararon rápido.",
    "Me gustaría ver el nivel de llenado en tiempo real.",
    "La recolección fue puntual esta semana.",
    "El olor disminuyó bastante desde que cambiaron el horario.",
    "El área alrededor del contenedor está más limpia ahora.",
    "El sensor marcaba lleno aunque todavía había espacio.",
    "La idea del monitoreo inteligente me parece muy buena.",
    "Algunas personas siguen dejando bolsas fuera del contenedor.",
    "El camión tardó demasiado en llegar hoy.",
    "Me sorprendió lo rápido que respondieron al reporte.",
    "Los contenedores nuevos se ven mucho más modernos.",
    "A veces el GPS del chofer se queda congelado.",
    "El servicio ha mejorado bastante desde que implementaron la app.",
    "Sería útil recibir alertas antes de que el contenedor se llene.",
    "El contenedor cercano al parque siempre está limpio.",
    "Hubo basura acumulada después del feriado.",
    "La app muestra correctamente la ruta del chofer.",
    "El sistema ayuda bastante a evitar desbordes.",
    "El contenedor estaba completamente lleno esta mañana.",
    "La recolección nocturna funciona mejor para mi zona.",
    "Noté menos basura en las calles desde que pusieron estos contenedores.",
    "Sería bueno agregar cámaras de seguridad cerca.",
    "El sensor dejó de actualizarse por unas horas.",
    "La experiencia general con el servicio ha sido positiva."
]
container_ids = [ i for i in range(1, 15) ]
images = [
  './images/report/report-1.jpg',
  './images/report/report-2.jpg',
  './images/report/report-3.jpg',
]

def login_admin(admin):
  r = requests.post(f'{API_URL}/auth/login', json=admin)
  return r.json()

def load_images(images, token):
  files = []
  for path in images:
    files.append(('images', open(path, 'rb')))

  r = requests.post(
    f'{API_URL}/report-image',
    files=files,
    headers={'Authorization': f'Bearer {token}'}
  )

  for _, file in files:
    file.close()

  return r.json() # [ { 'id', 'path' }, ...]

def load_report(container_id, content, image_ids, token):
  r = requests.post(
    f'{API_URL}/report',
    json={
      'container_id': container_id,
      'content': content,
      'image_ids': image_ids
    },
    headers={'Authorization': f'Bearer {token}'}
  )
  return r.json()

if __name__ == '__main__':
  response = login_admin(admin)
  print(json.dumps(response, indent=2, ensure_ascii=False))
  token = response['token']

  for container_id in container_ids:
    quantity_coments = random.randint(1, 10)
    for _ in range(quantity_coments):
      content = random.choice(comentarios)

      selected_images = (
        random.sample(images, k=random.choice([ 1, 2 ]))
        if random.choice([ True, False ])
        else None
      )

      image_ids = []
      if selected_images:
        images_response = load_images(selected_images, token)
        image_ids = [ image['id'] for image in images_response ]

      report_response = load_report(container_id, content, image_ids, token)
      print(json.dumps(report_response, indent=2, ensure_ascii=False))

