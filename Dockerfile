FROM node:16 as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build 
RUN ls -la
FROM ngnix:alpine
COPY  --from=build /app/build/ usr/share/ngnix/html
EXPOSE 80
CMD ["ngnix","-g","daemon off"]