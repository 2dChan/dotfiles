---
description: Commit
agent: commit
subtask: false
model: github-copilot/grok-code-fast-1
---

Выполни этот commit workflow в текущем репозитории.

## Workflow

1. До любых тестов сохрани baseline untracked: `git ls-files --others --exclude-standard`.
2. Проверь состояние: `git status` (staged, unstaged, untracked).
3. Определи команды тестов и сборки по фактическому стеку проекта и запусти только базовые проверки (`tests` и `build`), без дополнительных категорий (`lint`, `vuln`, `frontend`) если это не запрошено явно.
4. После проверок сравни untracked с baseline и удали только новые временные артефакты (coverage/prof/tmp/test binaries и подобные), никогда не удаляй tracked файлы.
5. Если тесты или сборка упали, не останавливай commit workflow: продолжай коммит, но обязательно добавь явное предупреждение в финальный отчет с упавшими командами и краткой причиной.
   - Если команда недоступна в окружении (`command not found`), пометь соответствующую проверку как `not_found`, но не добавляй это в `Warnings`.
   - Не запускай команды из нерелевантного стека (пример: `pnpm lint` в Go-only проекте без фронтенда).
6. Определи стиль истории по `git log --oneline -10`; если определить стиль не удалось, используй Conventional Commits: https://www.conventionalcommits.org/en/v1.0.0/.
7. Если staged уже есть, оформи single commit. Иначе проанализируй `git diff` и сам сгруппируй изменения логично, без запроса пользователю.
8. Для каждого коммита:
   - перед `git add` повторно очисти только новые временные артефакты агента;
   - добавь изменения в staging;
   - проверь staged diff;
   - сгенерируй сообщение коммита;
   - выполни `git commit` без запроса подтверждения.
9. Перед финальным `git status` еще раз очисти только новые временные артефакты агента.
10. Верни финальный отчет в строго формализованном виде (см. формат ниже).

Формат финального отчета (всегда):

- `Commits:`
  - `- <hash> <message>` для каждого созданного коммита, либо `- none`
- `Checks:`
  - `tests: <passed|failed|not_found|not_run>`
  - `build: <passed|failed|not_found|not_run>`

Блок `Warnings:` добавляй только если есть предупреждения (non-empty).
Для каждого предупреждения укажи:

- `command: <executed command>`
- `exit_code: <numeric code or unknown>`
- `reason: <short cause>`

Если коммитить нечего, сообщи это в финальном отчете и заверши выполнение.
