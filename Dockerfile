FROM node:latest as BUILD_IMAGE

RUN set -xe \
    && apt-get update -y \
    && apt install xsel
WORKDIR /usr/src/app
ADD public/ public
ADD src/ src 
COPY package.json ./
COPY tsconfig.json ./
COPY webpack.config.js ./
RUN npm install
RUN npm run build

FROM node:latest

RUN set -xe \
    && apt-get update -y \
    && apt install xsel
WORKDIR /usr/src/app
COPY --from=BUILD_IMAGE /usr/src/app/dist ./
RUN npm install -g serve

EXPOSE 3000
CMD ["serve", "-s", "."]

