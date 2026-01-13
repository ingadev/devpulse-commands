# DevPulse Commands для Claude Code

Slash-команды для автоматического логирования работы.

## Установка

```bash
# 1. Создай директории
mkdir -p ~/.claude/commands
mkdir -p ~/.devpulse/sessions
mkdir -p ~/.devpulse/reports/daily

# 2. Скопируй команды
cp devpulse-log.md ~/.claude/commands/
cp devpulse-daily.md ~/.claude/commands/
cp devpulse-recap.md ~/.claude/commands/
```

Или одной командой:
```bash
mkdir -p ~/.claude/commands ~/.devpulse/{sessions,reports/daily} && cp devpulse-*.md ~/.claude/commands/
```

## Команды

| Команда | Что делает |
|---------|------------|
| `/devpulse-log` | Сохраняет итоги текущей сессии в `~/.devpulse/sessions/` |
| `/devpulse-daily` | Собирает дневной отчёт из всех сессий |
| `/devpulse-recap` | Показывает что делал (сегодня/вчера/неделя/проект) |

## Использование

```bash
# После завершения задачи — залогировать
/devpulse-log

# В конце рабочего дня — собрать отчёт
/devpulse-daily

# Посмотреть историю
/devpulse-recap
/devpulse-recap вчера
/devpulse-recap неделя
/devpulse-recap FINANCE
```

## Структура файлов

```
~/.devpulse/
├── sessions/                    # Логи сессий
│   ├── FINANCE_2026-01-13_14-30_dpo-fix.md
│   ├── B2C_2026-01-13_16-00_chat-refactoring.md
│   └── ...
└── reports/
    └── daily/                   # Ежедневные отчёты
        ├── 2026-01-13.md
        └── ...
```

## Формат лога сессии

```markdown
## ПРОЕКТ: FINANCE

### БЫЛО
DPO показывает 526 дней вместо ожидаемых ~60

### ПРИЧИНА
Trade Payables берёт all-time ($133M), COGS только за год ($92M)

### СДЕЛАНО
- `balance_sheet_repository.py` — добавил period filter
- `BalanceSheetPage.tsx` — selector периода

### РЕЗУЛЬТАТ
526 дней → 321 день (всё ещё высокий из-за dirty data)

### ОСТАЛОСЬ
- 38K записей с пустым dmc_status

### ЗАДАЧИ ДРУГИМ
- @ops: проверить статусы services 2023-2025
```

---

Made for DevPulse · Activity Intelligence for Tech Leads
