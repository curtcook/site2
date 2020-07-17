FROM node:10 AS builder
COPY ./ /app
WORKDIR /app
RUN yarn install && yarn run build

FROM nginx
RUN mkdir /app
COPY --from=builder /app/dist /app
COPY nginx.conf /etc/nginx/nginx.conf