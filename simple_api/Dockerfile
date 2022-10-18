# syntax=docker/dockerfile:1
FROM python:2.7-stretch
MAINTAINER nathangasc17@gmail.com

COPY ./student_age.py ./
COPY ./student_age.json /data/student_age.json
RUN apt-get update -y 
RUN apt-get install python-dev python3-dev libsasl2-dev python-dev libldap2-dev libssl-dev -y
RUN pip install flask==1.1.2 flask_httpauth==4.1.0 flask_simpleldap python-dotenv==0.14.0

EXPOSE 5000

CMD [ "python", "./student_age.py" ]