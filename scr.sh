#!/bin/bash

# Проверка на наличие прав суперпользователя
if [ "$EUID" -ne 0 ]; then
  echo "Пожалуйста, запустите скрипт с правами суперпользователя."
  exit
fi

# Запрос нового зеркала у пользователя
read -p "Введите URL нового зеркала: " mirror_url

# Проверка, что URL не пустой
if [ -z "$mirror_url" ]; then
  echo "URL не может быть пустым."
  exit 1
fi

# Добавление нового зеркала в sources.list
echo "deb $mirror_url $(lsb_release -cs) main" >> /etc/apt/sources.list

# Обновление списка пакетов
apt update

echo "Зеркало добавлено и список пакетов обновлен."
