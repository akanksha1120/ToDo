# Use the official Node.js 18 image (multi-arch for flexibility)
FROM node:18-alpine AS build

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json (if applicable)
COPY package*.json ./

# Install dependencies, considering package-lock.json if present
RUN npm install || npm ci

# Copy the rest of the application code
COPY . .

# Build the React app
RUN npm run build

# Use a multi-arch Nginx image for broader compatibility
FROM nginx:latest

# Grant write permissions to the nginx user
RUN chown -R nginx:nginx /usr/share/nginx

# Create directory for HTML files
RUN mkdir /usr/share/nginx/html

# Copy the built app from the build stage to the Nginx HTML directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx server in the foreground (better for development)
CMD ["nginx", "-g", "daemon off;"]
