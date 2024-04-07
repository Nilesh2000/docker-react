# Build Phase
FROM node:16-alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build is the output of the build process

# Run Phase
FROM nginx
# Anything inside /usr/share/nginx/html will be served by nginx
COPY --from=builder /app/build /usr/share/nginx/html