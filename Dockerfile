#production dockerfile
FROM node:20.11.0

WORKDIR /app

COPY --chown=node:node . .

ENV NODE_ENV=production

RUN npm i -g @nestjs/cli
RUN npm install --frozen-lockfile --production
RUN npm run build

EXPOSE 3000

USER node

CMD ["node", "dist/main"]