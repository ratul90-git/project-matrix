# Stage 1: Build the React application
FROM node:22-alpine AS build

# Set working directory inside the container
WORKDIR /app

# Copy only package.json and package-lock.json first (for caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your application code
COPY . .

# Build the React application
RUN npm run build

# Stage 2: Serve the React application using a lightweight web server
FROM nginx:stable-alpine3.20

# Copy the build output from the previous stage to the nginx html directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose the port that nginx will run on
EXPOSE 80

# Start the server
CMD ["nginx", "-g", "daemon off;"]
