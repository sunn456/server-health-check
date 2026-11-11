#!/bin/bash
# Server Health Check - перевірка стану системи

echo "===== Health Check ====="
echo "Дата:       $(date)"
echo "Користувач: $(whoami)"
echo "Комп'ютер:  $(hostname)"
echo ""

echo "--- Час роботи і навантаження ---"
uptime
echo ""

echo "--- Місце на диску ---"
df -h /
echo ""

# Пам'ять: на Linux і Mac команди різні
if [ "$(uname)" = "Linux" ]; then
  echo "--- Пам'ять ---"
  free -h
else
  echo "--- Пам'ять ---"
  echo "(команда free є тільки в Linux)"
fi
echo ""
echo "--- Перевірка диска ---"
USAGE=$(df / | tail -1 | awk '{print $5}' | tr -d '%')

if [ "$USAGE" -gt 80 ]; then
  echo "⚠️ УВАГА: диск заповнений на $USAGE%!"
else
  echo "✅ Диск в порядку: заповнено $USAGE%"
fi