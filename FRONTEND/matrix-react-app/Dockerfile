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

# Stage 2: Production
FROM node:22-alpine

# Set working directory inside the container
WORKDIR /app

# Copy the build output from the previous stage to the current stage
COPY --from=build /app .

# Expose the port that the Node.js server will run on
EXPOSE 3000

# Start the server
CMD ["npm", "start"]
