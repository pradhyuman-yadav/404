# Stage 1: Build the React app
FROM node:20 AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . ./

RUN npm run build

# Stage 2: Serve the app with a simple node server
FROM node:20-alpine

WORKDIR /app

# Install 'serve' to run a static file server
RUN npm install -g serve

# Copy built assets from the build stage
COPY --from=build /app/dist .

EXPOSE 3404

# Run the server on port 3404 and serve the contents of the current folder
# The '-s' flag is important for single-page apps
CMD ["serve", "-s", ".", "-l", "3404"]
