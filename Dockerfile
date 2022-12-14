FROM node:16-alpine as builder

WORKDIR '/user/node/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /user/node/app/build /usr/share/nginx/html
