# Use the official Node.js image as a parent image
FROM node:20-slim AS builder

# Set the working directory in the container
# WORKDIR /app/frontend
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) to the container
COPY package.json package-lock.json ./

# Install dependencies
# RUN npm install
# npm run build && \
# npm cache cleam --force && \
# rm -rf /root/.npm && \
# rm -rf node_modules

RUN npm ci

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build

# FROM nginx:alpine AS runner
# COPY --from=builder /app/dist /usr/share/nginx/html
#Add custom nginx config if needed
# COPY nginx.conf /etc/nginx/conf.d/default.conf
# Expose the port the app runs on
# EXPOSE 80
# Start Nginx server
# CMD ["nginx", "-g", "daemon off;"]

FROM busybox:1.37.0 AS runner
WORKDIR /app
COPY --from=builder /app/dist .
CMD ["busybox", "httpd", "-f", "-v", "-p", "3000"]


# CMD [ "npm", "run","preview" ]
