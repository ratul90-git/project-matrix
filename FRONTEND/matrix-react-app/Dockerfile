# Use the latest safe Node.js LTS base image
FROM node:22-alpine

# Set working directory inside the container
WORKDIR /app

# Copy only package.json and package-lock.json first (for caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your application code
COPY . .

# Expose the port that the React app runs on
EXPOSE 3000

# Start the server
CMD ["npm", "start"]
