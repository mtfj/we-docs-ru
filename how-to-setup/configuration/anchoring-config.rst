
.. _anchoring-settings:

Настройка анкоринга
=======================

Если используете опцию :ref:`анкоринга <anchoring>`, необходимо настроить блок ``anchoring``. ``targetnet`` в данном случае блокчейн-сеть, в которую нода из сайдчейна будет выполнять анкоринг-транзакции.

    ::

      anchoring {
      enable = yes
      height-range = 5
      height-above = 6
      threshold = 1

      targetnet-authorization {
      type = "oauth2" # "api-key" or "oauth2"
      authorization-token = "PawC6b86r2pNRTR5e88wvcL3gfkG87w2Lqkvk4Jph2PUG3zPLedCTjnjh2ZTw3Rf"
      authorization-service-url = "https://washington.testnet.com/authServiceAddress/v1/auth/token"
      token-update-interval = "60s"
      # api-key-hash = "5M7C14rf3TAaWHvU6Kqo97iscd8fJFpvFwyQ3Q6vfztS"
      # privacy-api-key-hash = "5M7C14rf3TAaWHvU6Kqo97iscd8fJFpvFwyQ3Q6vfztS"
      }

      targetnet-scheme-byte = "K"
      targetnet-node-address = "http://node.washington"
      targetnet-node-port = 6862
      targetnet-node-recipient-address = "3JWveBpXS1EcDpxcoAwVNAjFfUMrxaALgZt"
      targetnet-private-key-password = ""

       wallet {
       file = "node-1_mainnet-wallet.dat"
       password = "small"
        }

      targetnet-fee = 500000
      sidechain-fee = 500000
     }
      
**Параметры анкоринга**

* ``height-range`` - число блоков, через которое нода приватного блокчейна отправляет в Targetnet транзакции для анкоринга.
* ``height-above`` - число блоков в Targetnet, через которое нода приватного блокчейна создаёт подтверждающую анкоринг транзакцию с данными первой транзакции. Рекомендуется устанавливать значение, близкое к максимальной величине отката в Targetnet ``max-rollback``.
* ``threshold`` - число блоков, которое отнимается от текущей высоты приватного блокчейна. В транзакцию для анкоринга, отправляемую в Targetnet, попадёт информация из блока на высоте ``current-height - threshold``. Если устанавливается значение 0, то берётся информация из текущего блока. Рекомендуется устанавливать значение, близкое к максимальной величине отката в приватном блокчейне ``max-rollback``.

**Параметры авторизации при использовании анкоринга**

* ``type`` - тип авторизации при использовании анкоринга. ``api-key`` - авторизация по ``api-key-hash``, ``auth-service`` - авторизация по специальному токену.

В случае выбора авторизации по ``api-key-hash`` достаточно указать значение ключа в параметре ``api-key`` ниже. Если вы выбираете авторизацию по токену, необходимо указать ``type = "auth-service"``, раскомментировать параметры ниже и установить для них значения:

* ``authorization-token`` - постоянный авторизационный токен.
* ``authorization-service-url`` - URL-адрес сервиса авторизации.
* ``token-update-interval`` - интервал обновления авторизационного токена.

**Параметры для доступа Targetnet**

Для ноды, которая будет отправлять транзакции анкоринга в Targetnet, генерируется отдельный файл ``keystore.dat`` с ключевой парой для доступа в Targetnet.

* ``targetnet-scheme-byte`` - байт сети Targetnet.
* ``targetnet-node-address`` - сетевой адрес ноды в сети Targetnet, на который будут отправляться транзакции для анкоринга.
* ``targetnet-node-port`` - номер порта ноды в сети Targetnet, на который будут отправляться транзакции для анкоринга.
* ``targetnet-node-recipient-address`` - адрес ноды в сети Targetnet, на который будут записываться транзакции для анкоринга, подписанные ключевой парой данного адреса.
* ``targetnet-private-key-password`` - пароль от приватного ключа ноды для подписи анкоринг-транзакций.

Сетевой адрес и порт для анкоринга в сеть Targetnet/Partnernet можно получить у сотрудников технической поддержки Waves Enterprise. Если используется несколько приватных блокчейнов с взаимным анкорингом, то необходимо использовать соответствующие сетевые настройки частных сетей.

**Параметры файла с ключевой парой для подписания транзакций анкоринга в Targetnet, секция wallet**

* ``file`` - имя файла и путь до каталога хранения файла с ключевой парой для подписания транзакций анкоринга в сети Targetnet. Файл находится на ноде приватной сети.
* ``password`` - пароль от файла с ключевой парой.

**Параметры комиссий**

* ``targetnet-fee`` - плата за выпуск транзакции для анкоринга в сети Targetnet.
* ``sidechain-fee`` - плата за выпуск транзакции в приватном блокчейне.






