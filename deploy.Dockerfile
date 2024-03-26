FROM node:21-alpine3.19
WORKDIR /src
COPY package*.json .
RUN npm install --only=production
COPY distrib/ ./
EXPOSE 3000
ENTRYPOINT [ "node", "./app.js" ]