# Use the official Windows-based Node.js 14 image
FROM mcr.microsoft.com/windows/servercore:ltsc2019 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the React app
RUN npm run build

# Use a Windows-based Nginx image for serving static content
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Create directory for the HTML files
RUN mkdir C:\nginx\html

# Copy the built app from the previous stage to the Nginx HTML directory
COPY --from=build /app/build /nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
