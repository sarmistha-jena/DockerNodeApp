FROM node:21.0
WORKDIR /src
COPY package*.json ./
RUN npm install
COPY . ./
RUN npm run lint && npm run build