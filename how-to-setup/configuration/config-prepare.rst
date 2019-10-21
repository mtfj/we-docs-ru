
.. _config-prepare:

Подготовка конфигурационных файлов
=====================================

В конфигурации ноды используются следующие файлы:

* ``accounts.conf`` - конфигурационный файл для генерации аккаунтов.
* ``api-key-hash.conf`` - конфигурационный файл для генерации значений полей ``api-key-hash`` и ``privacy-api-key-hash`` при выборе авторизации по хешу ключевой строки ``api-key``.
* ``nodename.conf`` - основной конфигурационный файл ноды, определяющий ее принципы работы и набор опций.

.. _create-account-config:

Конфигурационный файл для создания аккаунтов ``accounts.conf``
------------------------------------------------------------------

При указании пути в параметрах файла ``accounts.conf`` необходимо использовать символ "прямого слэша" - ``/`` как разделитель уровней иерархии директорий. Пример конфигурационного файла приведен для ОС Windows. При работе в ОС Linux значение ``wallet`` должно соответствовать структуре каталогов операционной системы, например, ``/home/contract/we/keystore.dat``. При настройке ноды не допускается использование кириллических символов при указании путей до рабочей директории, хранилища ключей и т.д.

::

    // accounts.conf listing

    accounts-generator {
      waves-crypto = yes
      chain-id = V
      amount = 1
      wallet = "c:/nodes/testnet-pos.wenodes.com/keystore.dat"
      wallet-password = "some string as password"
      reload-node-wallet {
        enabled = false
        url = "http://localhost:6862/utils/reload-wallet"
      }
    }

Описание параметров конфигурационного файла представлено ниже.

  - ``waves-crypto`` – выбор криптографического алгоритма ("yes" - использовать криптографию :ref:`Waves <crypto-waves>`, "no" - использовать :ref:`ГОСТ-криптографию <crypto-gost>`);
  - ``chain-id`` – идентифицирующий байт сети, значение потребуется дальше для внесения в параметр ``address-scheme-character`` в конфигурационный файл ноды;
  - ``amount`` – количество генерируемых ключевых пар;
  - ``wallet`` – путь до каталога хранения ключей на ноде, значение потребуется дальше для внесения в параметр ``wallet > file`` в конфигурационный файл ноды. Для криптографии Waves указывается путь до файла ``keystore.dat`` (пример, ``${user.home}/we/keystore.dat``), для ГОСТ-криптографии - путь до директории (``${user.home}/we/keystore/``);
  - ``wallet-password`` – пароль для доступа к закрытым ключам ноды, значение потребуется дальше для внесения в параметр ``wallet > password`` в конфигурационный файл ноды;
  - ``reload-node-wallet`` - опция для обновления keyStore ноды без перезапуска приложения, по умолчанию установлено в значение "Выключено" (``false``). В параметре ``url`` указывается путь до метода ``/utils/reload-wallet`` REST API ноды.

.. _rest-api-access:

Конфигурационный файл ``api-key-hash.conf``
------------------------------------------------

Конфигурационный файл ``api-key-hash.conf`` нужен только для генерации значений полей ``api-key-hash`` и ``privacy-api-key-hash`` при выборе авторизации по хешу ключевой строки ``api-key``.

  ::

    // api-key-hash.conf listing

    apikeyhash-generator {
      waves-crypto = no
      api-key = "some string for api-key"
    }

  **Описание параметров:**

    - waves-crypto – выбор криптографического алгоритма ("yes" - использовать криптографию :ref:`Waves <crypto-waves>`, "no" - использовать :ref:`ГОСТ-криптографию <crypto-gost>`);
    - api-key – ключ, который необходимо придумать. Значение данного ключа потребуется указать в запросах к REST API ноды (подробнее на странице :ref:`REST API ноды <rest-api-node>`).

.. _create-node-config:

Конфигурационный файл ноды ``nodeName.conf``
-------------------------------------------------

Если планируется подключение к существующей сети, то для упрощения подключения запросите готовый конфигурационный файл ноды у одного из участников сетевого взаимодействия или у администратора вашей сети. При создании сети с нуля или подключении к сети "Waves Enterprise Mainnet" пример конфигурационного файла ноды можно взять на странице проекта на `GitHub <https://github.com/waves-enterprise/WE-releases/tree/master/configs>`_.

.. warning:: Для нод версии 1.0.3 и выше в конфигурационном файле ноды в корневой секции ``node`` необходимо наличие следующего параметра:

    ::
   
      "features": {
      "supported": [100]
      }

Данная опция становится активной после достижения суммарного количества блоков из параметров ``feature-check-blocks-period = 15000`` и ``blocks-for-feature-activation = 10000`` (25000 блоков), которые находятся в секции ``blockchain``. При подключении к Mainnet или Partnernet данные параметры не могут быть изменены. Ноды без активации данной опции не смогут подключиться к сети.

Пример конфигурационного файла ноды представлен ниже. В данном примере отключены опции :ref:`анкоринга <anchoring-settings>`, :ref:`Docker <docker-configuration>` смарт-контрактов и :ref:`групп <privacy-config>` доступа к приватным данным. Также установлена :ref:`авторизация <authorization-config>` по хешу ключевой строки ``api-key`` и криптография Waves.

.. note:: Если вы планируете использовать дополнительные опции, установите поле ``enable`` выбранной опции в значение ``yes`` или ``true`` и настройте секцию опции в соответствии с описанием её настройки.

::

    node {
  # Type of cryptography
  waves-crypto = yes

  # Node owner address
  owner-address = ""

  # Node "home" and data directories to store the state
   directory = ${user.home}"/node"
   data-directory = ${node.directory}"/data"

  # Blockchain settings
  blockchain {
    type = CUSTOM
    consensus.type = pos

    custom {
      address-scheme-character = "A"
      functionality {
        feature-check-blocks-period = 100
        blocks-for-feature-activation = 70
        pre-activated-features = {
          1 = 0
          2 = 0
          3 = 0
          4 = 0
          5 = 0
          6 = 0
          7 = 0
          8 = 0
          9 = 0
          10 = 0
        }
      }

      # Genesis settings
      genesis {
        average-block-delay: 60s
        initial-base-target: 153722867
        timestamp: 1552467772740
        block-timestamp: 1552467772740
        initial-balance: 1625000000000000
        genesis-public-key-base-58: ""
        signature: ""
        transactions = [
          {recipient: "3LKb6s4o72PX3ZHHYQt5EsBcZgVdw54qQhu", amount: 1610000000000000}
        ]
        network-participants = [
          {public-key: "5PKmvx6hAxiFffKXNTLKhqfEmMJU5vkhk47nBXYXBoYnXsvYhnuznEqV2KkgH2W1znDjFycZe1ByvsSLmu8kz65k", roles: [permissioner, miner, connection_manager]},
        ]
      }
    }
  }

  # Application logging level. Could be DEBUG | INFO | WARN | ERROR. Default value is INFO.
  logging-level = INFO

  features {
    supported = [100] #this option is a must have for 1.0.3 versions and later
  }

  # P2P Network settings
  network {
    # Network address
    bind-address = "0.0.0.0"
    # Port number
    port = 6864

    # Peers network addresses and ports
    #   Example: known-peers = ["mainnet-node-0.nodenodes.com:6864", "mainnet-node-1.nodenodes.com:6864"]
    known-peers = [ ]

    # Node name to send during handshake. Comment this string out to set random node name.
    # node-name = "default-node-name"

    # String with IP address and port to send as external address during handshake. Could be set automatically if uPnP is enabled.
    declared-address = "0.0.0.0:6864"
  }

  wallet {
    # Path to keystore. In case of GOST cryptography keys stored in a './keystore/' folder. In case of Waves-cryptography keys stored in a 'keystore.dat' file.
    file = ${user.home}"/keystore.dat"
    # Access password
    password = "some string as a password"
  }

  # Node's REST API settings
    rest-api {
    # Enable/disable REST API
    enable = yes

    # Network address to bind to
    bind-address = "127.0.0.1"

    # Port to listen to REST API requests
    port = 6862

    # Authorization strategy should be either 'oauth2' or 'api-key', default is 'api-key'
    auth-type = "api-key"

    # Hash of API key string
    api-key-hash = "H6nsiifwYKYEx6YzYD7woP1XCn72RVvx6tC1zjjLXqsu"

    # Hash of API key string for PrivacyApi routes
    privacy-api-key-hash = "H6nsiifwYKYEx6YzYD7woP1XCn72RVvx6tC1zjjLXqsu"

    # OAuth2 service public key to verify auth tokens
    oauth-public-key = ""

    # Enable/disable CORS support
    cors = yes

    # Enable/disable X-API-Key from different host
    api-key-different-host = no

    # Max number of transactions
    # returned by /transactions/address/{address}/limit/{limit}
    transactions-by-address-limit = 10000
    distribution-address-limit = 1000
    }

  # New blocks generator settings
  miner {
    enable = yes
    quorum = 0
    interval-after-last-block-then-generation-is-allowed = 35d
    micro-block-interval = 5s
    min-micro-block-age = 3s
    max-transactions-in-micro-block = 500
    minimal-block-generation-offset = 200ms
  }

  # Anchoring settings
  anchoring {
      enable = no
      height-range = 5
      height-above = 6
      threshold = 1

      mainnet-authorization {
      type = "api-key" # "api-key" or "auth-service"
      api-key = "vostok"

      //      type = "auth-service"
      //      authorization-token = "xxxx"
      //      authorization-service-url = "http://localhost:3000"
      //      token-update-interval = "7 minutes"
      }

      mainnet-scheme-byte = "K"
      mainnet-node-address = "http://node-1"
      mainnet-node-port = 6862
      mainnet-node-recipient-address = "3JWveBpXS1EcDpxcoAwVNAjFfUMrxaALgZt"

       wallet {
       file = "node-1_mainnet-wallet.dat"
       password = "small"
        }

      mainnet-fee = 500000
      sidechain-fee = 500000
     }

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


   #Settings for Privacy Data Exchange
    privacy {
      storage {
        enabled = false
        url = "jdbc:postgresql://"${POSTGRES_ADDRESS}":"${POSTGRES_PORT}"/"${POSTGRES_DB}
        driver = "org.postgresql.Driver"
        profile = "slick.jdbc.PostgresProfile$"
  
        user = ${POSTGRES_USER}
        password = ${POSTGRES_PASSWORD}
        connectionPool = HikariCP
        connectionTimeout = 5000
        connectionTestQuery = "SELECT 1"
        queueSize = 10000
        numThreads = 20
        schema = "public"
        migration-dir = "db/migration"
      }
    }
  }












