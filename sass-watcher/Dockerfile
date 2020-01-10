FROM node:lts-alpine

RUN mkdir /app

COPY package.json /app/package.json

WORKDIR /app
RUN npm install

RUN mkdir /app/css
RUN mkdir /app/sass

CMD npm start
