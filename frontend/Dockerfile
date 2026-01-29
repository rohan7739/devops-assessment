FROM node:20-alpine AS builder

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine

RUN addgroup -S custgroup && adduser -S appuser -G custgroup

COPY --from=builder /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

# ✅ Give permissions required by nginx
RUN mkdir -p /var/cache/nginx /var/run /var/log/nginx \
    && chown -R appuser:custgroup /usr/share/nginx/html /var/cache/nginx /var/run /var/log/nginx

USER appuser

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
