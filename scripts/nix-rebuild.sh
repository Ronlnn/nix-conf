#!/usr/bin/env bash

set -e  # Выход при любой ошибке

CONFIG_DIR="$HOME/nix-conf"

# Функция для вывода ошибок
error_exit() {
    echo "Ошибка: $1" >&2
    exit 1
}

# Переходим в директорию
cd "$CONFIG_DIR" || error_exit "Не могу перейти в $CONFIG_DIR"

# Проверяем статус git
echo "Проверяем изменения..."
if [ -z "$(git status --porcelain)" ]; then
    echo "Нет изменений для коммита."
    exit 0
fi

echo "Найдены изменения:"
git status --short

# Добавляем все файлы
echo "Добавляем файлы..."
git add . || error_exit "Не удалось добавить файлы"

# Запрашиваем сообщение коммита
while true; do
    read -p "Введите сообщение коммита: " commit_message
    if [ -n "$commit_message" ]; then
        break
    fi
    echo "Сообщение не может быть пустым, попробуйте еще раз."
done

# Создаем коммит
echo "Создаем коммит..."
git commit -m "$commit_message" || error_exit "Не удалось создать коммит"

# Пушим изменения
echo "Отправляем изменения на сервер..."
git push || echo "Предупреждение: не удалось отправить изменения"

# Обновляем систему
echo "Обновляем NixOS..."
sudo nixos-rebuild switch --flake .#omen || error_exit "Не удалось обновить NixOS"

echo "Обновляем Home Manager..."
home-manager switch --flake .#roninn -b backup || error_exit "Не удалось обновить Home Manager"

echo "✅ Все операции завершены успешно!"