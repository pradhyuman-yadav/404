# Stage 1: Build the React app
FROM node:20 AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . ./

RUN npm run build

# Stage 2: Serve the app with Nginx
FROM nginx:alpine

# Update the Nginx configuration to listen on port 3404
RUN sed -i 's/listen  80;/listen 3404;/' /etc/nginx/conf.d/default.conf

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 3404

CMD ["nginx", "-g", "daemon off;"]
