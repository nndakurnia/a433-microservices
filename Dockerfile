# mengunduh base image versi alpine karna ukurannya lebih kecil
FROM node:14-alpine

# work directory untuk container
WORKDIR /src

# copy source code lokal ke container (workdir /src)
COPY . .

# install dependecies
# ci (continuous integration): disarankan untuk digunakan dalam lingkungan CI/CD 
# atau dalam situasi di mana konsistensi dependensi sangat penting
RUN npm ci

# ekspos port aplikasi
# use enviroment variable dari file .env
EXPOSE $PORT

# menjalankan server saat container diluncurkan
CMD ["node", "index.js"]