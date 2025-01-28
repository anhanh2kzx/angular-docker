# Use the official Node.js 18 image as the base image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) to the working directory
COPY package*.json ./

# Install Nx CLI globally (optional, but useful for running Nx commands)
RUN npm install -g nx

# Install project dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the Angular application using Nx
RUN nx build my-nx-angular --configuration=production

# Expose the port the app runs on (default Angular port is 4200)
EXPOSE 4200

# Command to run the application using Nx
CMD ["nx", "serve", "my-nx-angular", "--host", "0.0.0.0", "--disable-host-check"]
