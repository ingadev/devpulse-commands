#!/bin/bash

# DevPulse Commands Installer for Claude Code

echo "🚀 Installing DevPulse Commands..."

# Создаём директории
mkdir -p ~/.claude/commands
mkdir -p ~/.devpulse/sessions
mkdir -p ~/.devpulse/reports/daily

# devpulse-log
cat > ~/.claude/commands/devpulse-log.md << 'EOF'
Собери итоги текущей сессии. Проанализируй что мы делали и создай файл:

**Путь:** `~/.devpulse/sessions/{PROJECT}_{DATE}_{TIME}_{topic}.md`

Где:
- PROJECT: FINANCE, B2C, CRM, ALTAI, ETL, INFRA (определи по контексту)
- DATE: YYYY-MM-DD
- TIME: HH-MM
- topic: краткое описание через дефис (например: dpo-fix, chat-refactoring)

**Формат файла:**

```markdown
## ПРОЕКТ: [название]

### БЫЛО
[конкретная проблема — что было сломано/не работало]

### ПРИЧИНА
[почему — баг в коде, проблема данных, неверная логика]

### СДЕЛАНО
- `[файл]` — [что изменил, строка/функция если важно]
- `[файл]` — [изменение]

### РЕЗУЛЬТАТ
[было X → стало Y]
[конкретные цифры если есть: "$133M вместо $92M", "38K записей"]

### ОСТАЛОСЬ
[только реальные блокеры, не wishlist]

### ЗАДАЧИ ДРУГИМ
[только если нужно действие от команды]
```

**Правила:**
- Никакой воды: "успешно реализовано", "эффективно" — удалить
- Баги конкретно: `user.id → user.user_id`, строка 47
- Данные с цифрами
- Если ничего не осталось — не пиши секцию
- Если нет задач другим — не пиши секцию

Создай директорию если не существует. После создания покажи путь к файлу.
EOF

# devpulse-daily
cat > ~/.claude/commands/devpulse-daily.md << 'EOF'
Собери дневной отчёт из всех session-логов за сегодня.

1. Прочитай все файлы из `~/.devpulse/sessions/` за сегодняшнюю дату
2. Сгруппируй по проектам
3. Создай summary в `~/.devpulse/reports/daily/{DATE}.md`

**Формат:**

```markdown
# Отчёт за {DATE}

## Статистика
- Сессий: X
- Проектов: X  
- Файлов изменено: ~X

## По проектам

### FINANCE
**Что сделано:**
- [краткое описание результата 1]
- [краткое описание результата 2]

**Ключевые находки:**
- [важное если есть]

**Блокеры:**
- [если есть]

### B2C
...

## Задачи на команду
- [ ] [задача] — @кому
```

**Правила:**
- Executive summary: что зашипили, не как
- Цифры и результаты, не процесс
- Блокеры только реальные
EOF

# devpulse-recap
cat > ~/.claude/commands/devpulse-recap.md << 'EOF'
Покажи что я делал. Прочитай session-логи из `~/.devpulse/sessions/`.

По умолчанию — за сегодня. Если указан период ($ARGUMENTS), используй его:
- "вчера" — вчерашняя дата
- "неделя" — последние 7 дней
- "FINANCE" — только проект FINANCE
- дата "2026-01-12" — конкретный день

**Формат вывода (кратко):**

```
## {DATE}

**FINANCE** (2 сессии)
- DPO fix: было 526 дней → стало 321 день
- Balance sheet: добавил детализацию метрик

**B2C** (1 сессия)  
- Chat refactoring: новые компоненты ChatSheet, MessageBubble
```

Только результаты, не процесс. Одна строка на сессию.
EOF

echo "✅ DevPulse Commands installed!"
echo ""
echo "Commands available:"
echo "  /devpulse-log    — save session summary"
echo "  /devpulse-daily  — generate daily report"
echo "  /devpulse-recap  — view activity history"
echo ""
echo "Logs: ~/.devpulse/sessions/"
echo "Reports: ~/.devpulse/reports/daily/"
