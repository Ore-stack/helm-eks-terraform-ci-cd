# Use a lightweight Node.js base image (Node.js v18 on Alpine Linux)
FROM node:18-alpine

# Set the working directory inside the container to /app
WORKDIR /app

# Copy package.json and package-lock.json files to the working directory
COPY package*.json ./

# Install Node.js dependencies declared in package.json
RUN npm install

# Copy the rest of the application source code into the container
COPY . .

# Specify the command to run your app when the container starts
CMD ["node", "index.js"]

# Expose port 5000 to allow communication to/from the container
EXPOSE 5000