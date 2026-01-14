# DevPulse Commands для Claude Code

Slash-команды для автоматического логирования работы.

## Установка

```bash
curl -fsSL https://raw.githubusercontent.com/ingadev/devpulse-commands/main/install.sh | bash
```

## Команды

| Команда | Что делает |
|---------|------------|
| `/devpulse-log` | Сохраняет итоги сессии в `.devpulse/sessions/` |
| `/devpulse-daily` | Собирает дневной отчёт из всех сессий |
| `/devpulse-recap` | Показывает что делал (сегодня/вчера/неделя/проект) |

## Использование

```bash
# После завершения задачи
/devpulse-log

# В конце рабочего дня
/devpulse-daily

# Посмотреть историю
/devpulse-recap
/devpulse-recap вчера
/devpulse-recap неделя
```

## Структура

Логи сохраняются **в корне проекта** где запущен Claude Code:

```
~/my-project/                        # Твой проект
├── .devpulse/                       # Логи этого проекта
│   ├── sessions/
│   │   ├── FINANCE_2026-01-13_14-30_dpo-fix.md
│   │   └── B2C_2026-01-13_16-00_chat-refactoring.md
│   └── reports/
│       └── daily/
│           └── 2026-01-13.md
├── CLAUDE.md
└── src/...
```

## Формат лога

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
526 дней → 321 день

### ОСТАЛОСЬ
- 38K записей с пустым dmc_status
```

## Добавить в .gitignore

```
.devpulse/
```

---

Made for DevPulse · Activity Intelligence for Tech Leads
