FROM node:18

WORKDIR /app1

COPY . /app1

RUN npm install

EXPOSE 3000

CMD [ "npm", "start" ]