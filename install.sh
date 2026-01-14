#!/bin/bash

# DevPulse Commands Installer for Claude Code
# Логи сохраняются в .devpulse/ в корне каждого проекта

echo "🚀 Installing DevPulse Commands..."

# Создаём директорию для команд
mkdir -p ~/.claude/commands

# devpulse-log
cat > ~/.claude/commands/devpulse-log.md << 'EOF'
Собери итоги текущей сессии. Создай файл:

**Путь:** `./.devpulse/sessions/{PROJECT}_{DATE}_{TIME}_{topic}.md`

(в корне текущего проекта)

**Формат:**

```markdown
## ПРОЕКТ: [название]

### БЫЛО
[проблема]

### ПРИЧИНА
[почему]

### СДЕЛАНО
- `[файл]` — [изменение]

### РЕЗУЛЬТАТ
[было X → стало Y, цифры]

### ОСТАЛОСЬ
[блокеры]

### ЗАДАЧИ ДРУГИМ
[если нужно]
```

Правила: без воды, только факты и цифры. Создай директорию если не существует.
EOF

# devpulse-daily
cat > ~/.claude/commands/devpulse-daily.md << 'EOF'
Собери дневной отчёт из `./.devpulse/sessions/` за сегодня.
Создай `./.devpulse/reports/daily/{DATE}.md`

Формат: статистика, по проектам (что сделано, блокеры), задачи на команду.
EOF

# devpulse-recap
cat > ~/.claude/commands/devpulse-recap.md << 'EOF'
Покажи что делал. Читай `./.devpulse/sessions/`
Аргументы: вчера, неделя, FINANCE, дата
Формат: одна строка на сессию с результатом.
EOF

echo ""
echo "✅ DevPulse Commands installed!"
echo ""
echo "Commands:"
echo "  /devpulse-log    — сохранить итоги сессии"
echo "  /devpulse-daily  — дневной отчёт"
echo "  /devpulse-recap  — что делал за период"
echo ""
echo "Логи сохраняются в .devpulse/ в корне проекта"
