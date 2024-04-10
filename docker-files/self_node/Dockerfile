FROM node:latest
COPY . /www
WORKDIR /www
RUN npm install --registry=https://registry.npm.taobao.org
EXPOSE 17801
CMD node index.js





