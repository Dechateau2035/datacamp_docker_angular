# ### STAGE 1: Build ###
# 1. Utilisez une image de base Node.js légère
FROM node:12.7-alpine AS build

# 2. Définissez le répertoire de travail
WORKDIR /usr/src/app

# 3. Copiez les fichiers package.json et package-lock.json dans le répertoire de travail
COPY package.json package-lock.json .

# 4. Installez les dépendances
RUN npm install

# 5. Copiez tout le contenu du projet Angular dans le conteneur
COPY . .

# 6. Construisez le projet Angular pour la production
RUN npm run build

# ### STAGE 2: Serve ###
# 7. Utilisez une image de base pour le serveur web (Nginx)
FROM nginx:1.17.1-alpine AS production

COPY nginx.conf /etc/nginx/nginx.conf

# 8. Copiez les fichiers de build Angular (dans le répertoire dist) vers le serveur Nginx
COPY --from=build /usr/src/app/dist/aston-villa-app /usr/share/nginx/html
