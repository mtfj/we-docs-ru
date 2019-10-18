
.. _docker-configuration:

Настройка Docker
====================

Установка и исполнение docker-контрактов задается секцией ``docker-engine`` в :ref:`конфигурационном файле ноды <create-node-config>`.

::

    # Docker smart contracts settings
    docker-engine {
    # Docker smart contracts enabled flag
    enable = no
    # Basic auth credentials for docker host
     docker-auth {
       username = "some user"
       password = "some password"
     }
    # Optional connection string to docker host
    # docker-host = "unix:///var/run/docker.sock"
    # Optional string to node REST API if we use remote docker host
    # node-rest-api = "https://clinton.wavesenterprise.com/node-0"
    # Run for integration tests
    integration-tests-mode-enable = no
    # Execution settings
    execution-limits {
      # Contract execution timeout
      timeout = 60s
      # Memory limit in Megabytes
      memory = 512
      # Memory swap value in Megabytes (see https://docs.docker.com/config/containers/resource_constraints/)
      memory-swap = 0
    }
    # Reuse once created container on subsequent executions
    reuse-containers = yes
    # Remove container with contract after specified duration passed
    remove-container-after = 10m
    # Allows net access for all contracts
    allow-net-access = no
    # Remote registries auth information
    remote-registries = []
    # Check registry auth on node startup
    check-registry-auth-on-startup = yes
    # Contract execution messages cache settings
    contract-execution-messages-cache {
      # Time to expire for messages in cache
      expire-after = 60m
      # Max number of messages in buffer. When the limit is reached, the node processes all messages in batch
      max-buffer-size = 10
      # Max time for buffer. When time is out, the node processes all messages in batch
      max-buffer-time = 100ms
    }
  }


**Параметры:**


* ``enable`` - включение обработки транзакций для docker-контрактов (yes/no).
* ``docker-auth`` - секция базовой авторизации по логину и паролю.
* ``docker-host`` - URL-адрес Docker-хоста.
* ``node-rest-api`` - URL-адрес к REST API ноды при использовании Docker-хоста.
* ``integration-tests-mode-enable`` - режим тестирования Docker-контрактов (yes/no).
* ``execution-limits`` - секция ограничений на выполнение Docker-контрактов:

   * ``timeout`` - таймаут на выполнение контракта (в секундах);
   * ``memory`` - ограничение по памяти для контейнера контракта (в Мб);
   * ``memory-swap`` - файл подкачки памяти для контракта (в Мб).

* ``reuse-containers`` - повторное использование существующего Docker-контракта.
* ``remove-container-after`` - обязательность удаления контейнера после исполнения (yes/no).
* ``allow-net-access`` - доступ к сети (yes/no).
* ``remote-registries`` - адреса удаленных репозиториев и доступов к ним.
* ``check-registry-auth-on-startup`` - обязательность проверки авторизации к репозиториям при запуске ноды (yes/no).
* ``contract-execution-messages-cache`` - секция настройки кеш-памяти Docker-контракта. При достижении лимита буфера нода обработает все сообщения в пакетном режиме:

   * ``expire-after`` - время жизни сообщений в кеш-памяти в минутах;
   * ``max-buffer-size`` - максимальное количество сообщений в буфере;
   * ``max-buffer-time`` - максимальное время для буфера в миллисекундах.










