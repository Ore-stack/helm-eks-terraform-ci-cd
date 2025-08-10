# Use the official Node.js 18 Alpine Linux base image (small and efficient)
FROM node:18-alpine

# Set the working directory inside the container to /app
WORKDIR /app

# Copy package.json and package-lock.json (if present) to the working directory
COPY package*.json ./

# Install all Node.js dependencies defined in package.json
RUN npm install

# Copy the rest of the application source code into the container
COPY . .

# Expose port 3000 (default port for many React apps)
EXPOSE 3000

# Start the application using npm start when the container launches
CMD ["npm", "start"]