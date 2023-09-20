# Untuk membuat Docker image

# menggunakan base image node js versi 14
FROM node:14-alpine

# membuat direktori baru bernama app dlm containre dan dijakan working directory
WORKDIR /app

# copy source code lokal ke container (workdir /app)
COPY . .

# agar aplikasi running di production mode dan menggunakan container item-db
ENV NODE_ENV=production DB_HOST=item-db

# install dependencies for production && build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# ekspos port aplikasi
EXPOSE 8080

# menjalankan server saat container diluncurkan
CMD ["npm", "start"]