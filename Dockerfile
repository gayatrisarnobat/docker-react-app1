# FROM node:18 AS build

FROM node:18

WORKDIR /app1

COPY package.json .

RUN npm install

COPY . .

EXPOSE 80

CMD ["npm", "start"]

# RUN npm run build

# FROM nginx:alpine

# COPY --from=build /app1/build /usr/share/nginx/html

# EXPOSE 80

# CMD ["nginx", "-g", "daemon off;"]
