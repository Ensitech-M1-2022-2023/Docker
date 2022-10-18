# syntax=docker/dockerfile:1
FROM node:16

COPY ./static-website-example ./
RUN npm install http-server -g

EXPOSE 8080

ENTRYPOINT ["http-server", "."]