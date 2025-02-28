# Step 1: Use the official Node.js image as a base
FROM node:18-alpine as build

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy the package.json and package-lock.json files
COPY package*.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the rest of the application code
COPY . .

# Step 6: Build the React app for production
RUN npm run build

# Step 7: Use a smaller image to serve the app (Nginx in this case)
FROM nginx:alpine

# Step 8: Copy the build directory from the build stage
COPY --from=build /app/build /usr/share/nginx/html

# Step 9: Expose the default port for the Nginx container
EXPOSE 80

# Step 10: Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
