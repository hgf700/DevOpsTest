FROM node:20-alpine

# Dodaj użytkownika i grupę
RUN addgroup app && adduser -S -G app app

WORKDIR /app

# Skopiuj tylko package.json
COPY package*.json ./

# Zmień właściciela folderu /app na użytkownika app
USER root
RUN chown -R app:app /app

USER app

# Instalacja zależności
RUN npm install -y

# Kopiowanie reszty aplikacji
COPY . .

EXPOSE 5173

CMD npm run dev