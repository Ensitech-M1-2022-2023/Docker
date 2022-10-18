# Docker

## Build and test (7 points)

Nous avons dans un premier temps créé le Dockerfile pour "simple_api".

Nous avons ajouté une image de base (python:2.7-stretch)

Nous avons ajouté un Maintainer (même si le paramètre est deprecated)

Nous avons ajouté le source code (python + json). Nous avons eu une erreur car le script python aller chercher le json dans le dossier /data/. C'est pourquoi nous avons copié le json à cette destination.

Nous avons installé les dépendences.

Nous avons fait un volume contenant le JSON

Et finallement nous avons lancé le script python.

Pour tester l'api individuellement, vous pouvez faire `docker build . -t simple_api` et lancer l'image simple_api en mappant le port 5000. En allant sur http://localhost:5000/pozos/api/v1.0/get_student_ages et en entrant le : 
login: toto
password: python  
vous aurez le résultat de cette api.

## Infrastructure As Code (5 points)

Nous avons par la suite automatisé le lancement de notre image et d'un server faisant office de front-end en utilisant Docker Compose.

Nous avons modifié le fichier docker-compose.yml pour build & lancer notre api sur le port 5000

Nous avons également utilisé l'image php:apache et notre dossier `./website` pour créer un front-end qui communique avec l'api. Ce front-end prend en variable d'environnement le login/password requis pour faire une requête sur l'api. Ce front-end est disponible sur le port 8080

Après avoir lu le code du front-end (PHP), nous avons vu que la requête http ne menait pas au bon endroit. Nous l'avons modifié en simple_api:5000.

Pour tester le fonctionnement de ce projet, vous pouvez executer la cmd : `docker compose up -d` et aller sur localhost:8080.

## Docker Registry (4 points)
Nous avons téléchargé 2 images. La registery version 2 et joxit/docker-registry-ui. La première est là pour créer une registery comme docker hub et le second est là pour créer une interface web.

Les commandes : 
docker run -d -p 9000:5000 --name registry registry:2
docker pull joxit/docker-registry-ui

Pour facilité l'utilisation, vous avons ajouter une docker compose qui lance l'ui et la docker registery en même temps. Il se trouve dans le dossier docker-registery.

Pour tester la docker registery `docker compose up -d` depuis son dossier. En allant sur http://localhost:9001, vous aurez l'ui.

Pour ajouter une image sur cette docker registery: `docker push localhost:9000/image_name`. En rafraichissant la page (localhost:9001), vous devriez voir une image apparaitre.

Delivery (4 points)

Well...