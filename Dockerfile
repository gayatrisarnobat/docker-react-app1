FROM node:18

WORKDIR /app1

COPY package.json .

RUN npm install

COPY . /app1

EXPOSE 3000

CMD [ "npm", "start" ]