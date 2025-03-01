# Use the latest safe Node.js LTS base image
FROM node:22-alpine AS build

# Set working directory inside the container
WORKDIR /app

# Copy only package.json and package-lock.json first (for caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your application code
COPY . .

# Stage 2: Production
FROM node:22-alpine

# Set working directory inside the container
WORKDIR /app

# Copy only the necessary files from the build stage
COPY --from=build /app .

# Expose the port that the Node server runs on
EXPOSE 5000

# Start the server
CMD ["npm", "start"]
