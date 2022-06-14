FROM node:14-alpine

WORKDIR /app

ARG NPM_TOKEN

RUN echo "//registry.npmjs.org/:_authToken=${NPM_TOKEN}" >> ./.npmrc

COPY package*.json ./

RUN npm install

RUN rm -f ./.npmrc

COPY . ./

EXPOSE 3001

CMD ["npm", "start"]