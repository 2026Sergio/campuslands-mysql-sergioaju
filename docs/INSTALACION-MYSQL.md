# Instalacion local de MySQL

## Docker recomendado

```bash
cp .env.example .env
docker compose up -d
```

Conectar:

```bash
mysql -h 127.0.0.1 -P 3307 -u campus -pcampus123 campuslands_mysql
```

phpMyAdmin: http://localhost:8085

## Windows

Instala MySQL Community Server desde el instalador oficial, agrega MySQL al PATH y usa MySQL Workbench o terminal.

## macOS

```bash
brew install mysql
brew services start mysql
```

## Linux Ubuntu/Debian

```bash
sudo apt update
sudo apt install mysql-server mysql-client
```
