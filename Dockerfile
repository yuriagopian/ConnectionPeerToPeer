FROM node:slim AS builder
WORKDIR /home/node
COPY package*.json ./
RUN npm --loglevel=error install --development
COPY tsconfig*.json nest-cli.json ./
COPY src/ src/
RUN npm run build

FROM node:alpine
WORKDIR /home/node
COPY --from=builder --chown=node:node /home/node/dist dist/
COPY --chown=node:node static static/
COPY package*.json ./
EXPOSE 3000
RUN npm --loglevel=error install --production
CMD node dist/main
