# Dynamic Management Views (DMV)

## Зачем

## Плюсы минусы

- минусы
  - показывают общую статистику, а не за период
  - При перезагрузке СУБД очищается

## Паттерны

- Locks
  - The blocked process report
    - sys.dm_exec_sessions, sys.dm_exec_requests, sys.dm_exec_input_buffer
