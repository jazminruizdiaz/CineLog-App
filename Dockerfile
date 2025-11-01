#Stage1: Build
FROM node:22-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

#Test stage
FROM build AS test
WORKDIR /app
RUN npm run test

#Stage2: Prod environment
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
COPY config/nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD [ "nginx", "-g", "daemon off;" ]
