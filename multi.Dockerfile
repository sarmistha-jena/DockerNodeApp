#For base
FROM node:21.0 AS base
WORKDIR /usr/src
COPY package*.json .
RUN npm install

#For linter
FROM base AS linter
WORKDIR /usr/src
RUN npm run lint

#For builder
FROM linter AS builder
WORKDIR /usr/src
RUN npm run build

#For deployment
FROM node:21-alpine3.19
WORKDIR /opt
COPY package*.json .
RUN npm install --only=production
COPY --from=builder /usr/src/dist ./
EXPOSE 3000
ENTRYPOINT [ "node", "./app.js" ]