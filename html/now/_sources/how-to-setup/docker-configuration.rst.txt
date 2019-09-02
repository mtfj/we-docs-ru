.. _docker-configuration:

Запуск docker-контрактов
=============================

Установка и исполнение docker-контрактов задается объектом ``docker-engine`` в конфигурационном файле ноды.

::

  docker-engine {
    enable = yes
    integration-tests-mode-enable = no
    execution-limits {
      timeout = 10s
      memory = 512
    }
    stop-container-after-execution = no
    remove-container-after-execution = no
    allow-net-access = yes
    remove-containers-on-shutdown = yes
    remote-registries = [
       {
         domain = "myregistry.com:5000"
         username = "user"
         password = "password"
       }
     ]
    check-registry-auth-on-startup = no
    check-image-hash = no
  }

**Параметры:**

- ``enable`` - включение обработки транзакций для docker-контрактов (yes/no);
- ``integration-tests-mode-enable`` - режим тестирования docker-контрактов (yes/no);
- ``timeout`` - таймаут на выполнение контракта (в секундах);
- ``memory`` - ограничение по памяти для контейнера контракта (в Мб);
- ``stop-container-after-execution`` - обязательность остановки контейнера после исполнения (yes/no);
- ``remove-container-after-execution`` - обязательность удаления контейнера после исполнения (yes/no);
- ``allow-net-access`` - доступ к сети (yes/no);
- ``remove-containers-on-shutdown`` - обязательность удаления всех контейнеров контрактов при остановке ноды (yes/no);
- ``remote-registries`` - адреса удаленных репозиториев и доступов к ним;
- ``check-registry-auth-on-startup`` - обязательность проверки авторизации к репозиториям при запуске ноды (yes/no);
- ``check-image-hash`` - обязательность проверки hash-суммы контракта перед его запуском. Проверка ведется по hash-сумме из CreateContract транзакции (yes/no).