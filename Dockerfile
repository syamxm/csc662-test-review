FROM node:lts-alpine AS client
WORKDIR /app/client
COPY client/package*.json ./
RUN npm install
COPY client/ ./
RUN npm run build

FROM node:lts-alpine AS server
WORKDIR /app/server
RUN apk add --no-cache --virtual .build python3 make g++
COPY server/package*.json ./
RUN npm install --omit=dev && apk del .build
COPY server/ ./

FROM node:lts-alpine
WORKDIR /app
ENV NODE_ENV=production
COPY --from=server /app/server ./server
COPY --from=client /app/client/dist ./client/dist
EXPOSE 8662
CMD ["node", "server/index.js"]
