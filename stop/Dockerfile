FROM node:14

WORKDIR /usr/src/project

COPY ./package*.json ./
RUN npm install

COPY . ./

CMD ["node", "index.js"]
