# Configuration Docker

Ce projet utilise Docker pour exécuter un environnement de développement avec **PHP 8.3, Apache, MySQL, Composer et Node.js 23**.

---

## 📁 Structure du Projet

```
mon-projet/
│── projects/
│   ├── backend/     
│   ├── frontend/    
│── docker-compose.yaml
│── Dockerfile        
│── README.md         
```

---

## 🐳 Services Docker

### 1️⃣ **Service Web (PHP + Apache + Composer + Node.js)**

- Défini dans `docker-compose.yml` sous le service `web`
- Construit avec le `Dockerfile`
- Monte les fichiers du projet dans les volumes suivants :
    - `./projects/backend/` ➝ `/var/www/html` (serveur Apache)
    - `./projects/frontend/` ➝ `/root/workspace` (dossier de travail Node.js)
- Ports exposés :
    - `5173:5173` (Frontend)
    - `8000:80` (Backend)

### 2️⃣ **Service Base de Données (MySQL 8.0)**

- Défini dans `docker-compose.yml` sous le service `db`
- Stocke les données dans un volume persistant (`db-data`)
- Ports exposés :
    - `3306:3306` (MySQL)
  
🔐 Pour définir le mot de passe de la base de données :
- Créez un fichier .env à la racine de votre projet si ce n'est pas déjà fait.
- Ajoutez la ligne suivante dans le fichier .env :
```sh
MYSQL_ROOT_PASSWORD="votremotdepasse"
```

### 3️⃣ **Réseau Docker**

Tous les services communiquent via un réseau privé Docker appelé `app-network`.

---

## 📌 Installation et Démarrage

1️⃣ **Assurez-vous d'avoir Docker installés.**

2️⃣ **Lancer les services**

```sh
docker compose up -d --build
```

3️⃣ **Accéder aux services**

- **Backend (PHP + Apache)** : [http://localhost:8000](http://localhost:8000)
- **Frontend** : [http://localhost:5173](http://localhost:5173)
- **Base de données (MySQL)** : `localhost:3306`

4️⃣ **Se connecter au conteneur web** (pour exécuter des commandes PHP ou Node.js)

```sh
docker exec -it php-web bash
```



