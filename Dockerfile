FROM node:14-slim

WORKDIR /app
COPY . .

RUN npm i && npm run build && npm prune --production

CMD npm run start:prod