#!/bin/bash

# Определение переменных
REPO_URL="https://github.com/nik0801/shvirtd-example-python.git"
INSTALL_DIR="/opt/project"
IP_ADDRESS="158.160.6.223"
PORT="8090"

# Обновляем пакеты и устанавливаем git
sudo apt-get update
sudo apt-get install -y git

# Клонируем репозиторий в /opt
sudo mkdir -p $INSTALL_DIR
sudo chown -R $USER:$USER $INSTALL_DIR
git clone $REPO_URL $INSTALL_DIR

# Переходим в каталог проекта
cd $INSTALL_DIR || exit

# Запускаем проект с помощью Docker Compose
docker compose up -d

# Ждём несколько секунд, чтобы контейнеры успели подняться
sleep 10

# Проверяем доступность сервиса через внешний IP
echo "Проверка доступности сервиса:"
echo "Откройте следующую ссылку в браузере, чтобы проверить HTTP-подключение:"
echo "$CHECK_URL/?host=$IP_ADDRESS:$PORT"

# Показываем инструкцию для проверки вручную
echo ""
echo "Для ручной проверки используйте команду:"
echo "curl -L http://$IP_ADDRESS:$PORT"

# Пауза для визуализации вывода
read -rp "Нажмите любую клавишу для продолжения..."

# Очищаем терминал
clear

# Показываем текущие контейнеры Docker
echo "Текущие контейнеры Docker:"
docker ps