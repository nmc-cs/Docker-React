#BUILD PHASE
FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

#RUN PHASE
FROM nginx

#does nothing in Dockerfile
EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html

#nginx automatilly runs by default
