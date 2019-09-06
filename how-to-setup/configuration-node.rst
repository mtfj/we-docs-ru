.. _configuration:

Конфигурация ноды
====================
Для полноценной конфигурации ноды выполните следующие шаги:

1. Перед запуском генератора :ref:`создайте <create-account-config>` для него отдельный конфигурационный файл ``accounts.conf``.
2. :ref:`Сгенерируйте <generate-keys-pair>` ключевую пару для каждого будущего участника сети при помощи генератора. Ключевых пар нужно создать столько, сколько нод планируется подключать к сети с самого старта блокчейна. Транзакции обо всех начальных участниках сети войдут в генезис-блок.
3. :ref:`Создайте <create-node-config>` конфигурационный файл ноды в соответствии с требуемыми условиями.
4. :ref:`Обеспечьте <rest-api-access>` доступ к REST API ноды.
5. :ref:`Подпишите <sign-genesis-block>` genesis блок.
6. :ref:`Запустите <node-start>` ноду.

.. _create-account-config:

Создание конфигурационного файла ``accounts.conf``
------------------------------------------------------

При указании пути необходимо использовать символ "прямого слэша" - ``/`` как разделитель уровней иерархии директорий. Пример конфигурационного файла приведен для ОС Windows. При работе в ОС Linux значение ``wallet`` должно соответствовать структуре каталогов операционной системы, например ``/home/contract/vostok/keystore.dat``. При настройке ноды не допускается использование кириллических символов при указании путей до рабочей директории, хранилища ключей и т.д.

::

    // accounts.conf listing

    accounts-generator {
      waves-crypto = yes
      chain-id = V
      amount = 1
      wallet = "c:/nodes/testnet-pos.vostoknodes.com/keystore.dat"
      wallet-password = "some string as password"
      reload-node-wallet {
        enabled = false
        url = "http://localhost:6869/utils/reload-wallet"
      }
    }

Описание параметров конфигурационного файла представлено ниже.

  - waves-crypto – выбор криптографического алгоритма ("yes" - использовать криптографию :ref:`Waves <crypto-waves>`, "no" - использовать :ref:`ГОСТ-криптографию <crypto-gost>`);
  - chain-id – идентифицирующий байт сети, значение потребуется дальше для внесения в параметр ``address-scheme-character`` в конфигурационный файл ноды;
  - amount – количество генерируемых ключевых пар;
  - wallet – путь до каталога хранения ключей на ноде, значение потребуется дальше для внесения в параметр ``wallet > file`` в конфигурационный файл ноды. Для криптографии Waves указывается путь до файла ``keystore.dat`` (пример, ``${user.home}/vostok/keystore.dat``), для ГОСТ-криптографии - путь до директории (``${user.home}/vostok/keystore/``);
  - wallet-password – пароль для доступа к закрытым ключам ноды, значение потребуется дальше для внесения в параметр ``wallet > password`` в конфигурационный файл ноды;
  - reload-node-wallet - опция для обновления keyStore ноды без перезапуска приложения, по умолчанию установлено в значение "Выключено" (``false``). В параметре ``url`` указывается путь до метода ``/utils/reload-wallet`` REST API ноды.

.. _generate-keys-pair:

Генерирование ключевых пар
---------------------------

Публичный и приватный ключи будущих участников сети создаются при помощи утилиты генератора. Получить последнюю версию генератора можно на странице проекта на `GitHub <https://github.com/waves-enterprise/WE-releases>`_. Для запуска утилиты необходимо в качестве одного из параметров указать файл ``accounts.conf``, в котором определяются параметры генерации ключей. При создании ключевой пары придумайте и введите пароль, сохраните его для последующей конфигурации. Данный пароль будет использоваться при создании глобальной переменной ``VOSTOK_NODE_OWNER_PASSWORD`` далее. Если не хотите устанавливать пароль от ключевой пары ноды, нажмите ``enter``. Команда для запуска генератора:

``java -jar generators-x.x.x.jar AccountsGeneratorApp accounts.conf``

.. _var-env:

Глобальные переменные
------------------------

Для обеспечения дополнительной безопасности рекомендуется использовать пароль для ключевой пары ноды. Платформа Waves Enterprise поддерживает два способа использования пароля:

#. Ввод пароля в ручном режиме при каждом старте ноды.
#. Создание глобальных переменных в операционной системе.

При использовании ручного ввода пароля создавать глобальные переменные необязательно. Если вы планируете разворачивать ноду в контейнерах или подобных сервисах, то удобнее будет задать в ОС следующие глобальные переменные:

#. ``VOSTOK_NODE_OWNER_PASSWORD`` - пароль от ключевой пары ноды, который вводится на этапе создания этой ключевой пары.
#. ``VOSTOK_NODE_OWNER_PASSWORD_EMPTY`` - ``true`` или ``false``, установите значение ``true``, если не хотите устанавливать пароль на ключевую пару ноды, в таком случае создавать переменную ``VOSTOK_NODE_OWNER_PASSWORD`` необходимости нет. Если вы используете пароль, установите значение ``false`` и пропишите в переменную ``VOSTOK_NODE_OWNER_PASSWORD`` пароль от ключевой пары ноды.

.. _create-node-config:

Создание конфигурационного файла из шаблона
-------------------------------------------------

Если планируется подключение к существующей сети, то для упрощения подключения запросите готовый конфигурационный файл генератора у одного из участников сетевого взаимодействия или у администратора вашей сети. При создании сети с нуля или подключении к сети "Waves Enterprise Mainnet" пример конфигурационного файла ноды можно взять на странице проекта на `GitHub <https://github.com/waves-enterprise/WE-releases/tree/master/configs>`_.

.. note:: Часть параметров конфигурационного файла описывают параметры блокчейн-сети, к которой осуществляется подключение, и не должны изменяться.

Отредактируйте шаблон конфигурационного файла в соответствии со следующими рекомендациями:

1. Укажите тип используемой криптографии (см. раздел :ref:`Криптография <cryptography>`):

    ::

      waves-crypto = yes
  
  .. note:: При использовании :ref:`криптографии Waves <crypto-waves>` пользователь может быть создан автоматически при запуске ноды, и предыдущий шаг можно пропустить. Для :ref:`ГОСТ-криптографии <crypto-gost>` необходимо использовать биологический датчик случайных чисел, автоматическое создание пары ключей невозможно.

  При использовании :ref:`ГОСТ-криптографии <crypto-gost>` после запуска команды создания участников на экран будет выведено окно КриптоПро инициализации биологического датчика случайных чисел.

     .. image:: img/bio_rng.png
        :height: 250
 
  После выполнения утилиты в папке, определенной параметром ``wallet``, будут сохранены закрытые ключи участников, а на экране отобразятся адреса и открытые ключи в виде строк:
  ``[main] accounts-generator - Address: 3PCKG8vUUQhbqyQnKuokEXmje5FByPHWiBt; public key: 6GffUw1XkAnpM7upBu7RPkWfBZSGfDKpPDUY5TygvrL6``

2. Укажите адреса домашней директории и директории для хранения данных блокчейна в соответствующих полях:

    ::

      directory = ${user.home}"/vostok"
      data-directory = ${vostok.directory}"/data"
  
  .. important:: Если нода ранее работала с другой сетью блокчейна Waves Enterprise, то удалить данные из папки, указанной в параметре ``data-directory`` (по умолчанию, для ОС Ubuntu используется путь ``${user.home}/vostok``, для ОС Windows используется путь ``C:\Users\<username>\vostok``).

3. Укажите байт сети, с которым генерировались адреса участников сети (параметр ``chain-id`` в accounts.conf). Байт сети для "Waves Enterprise Mainnet" - ``V``, для "Waves Enterprise Partnernet" - ``P``.
  
    ::

      address-scheme-character: "V"

4. Укажите в блоке ``genesis`` общий баланс активов сети:
  
    ::

      genesis {
        initial-balance: 100000000000
  
.. important:: Необходимо проверить значения полей ``timestamp`` и ``block-timestamp`` блока ``genesis``. Время указывается в миллисекундах, значение должно состоять из 13 цифр. Если вы берёте стандартное значение ``timpstamp``, состоящее из 10 цифр, то в конце необходимо добавить три любые цифры.

5. Укажите :ref:`адреса участников <address-creation>` – владельцев начального баланса сети:

    ::
   
      transactions = [
      {recipient: "3P9nhmAEec4bDKsmLEZy2raimNJTVqedu43", amount: 100000000000} ]

6. Укажите :ref:`публичные ключи участников сети <address-creation>` в блоке ``network-participants`` в том же порядке, как были указаны адреса участников:

    ::

      network-participants = [ 
        {  public-key: "HaL7GYu5hKwkc64PGcByi2Hoe2VH2Uf2ueoD75rsf7SF", roles: [permissioner, connection_manager] },
        {  public-key: "HaL7GYu5hKwkc64PGcByi2Hoe2VH2Uf2ueoD75rsf7SF", roles: [miner]  },
        {  public-key: "HaL7GYu5hKwkc64PGcByi2Hoe2VH2Uf2ueoD75rsf7SF", roles: [miner, contract_developer] }
      ]

7. Укажите владельца ноды в параметре ``owner-address``:

    ::
      
      owner-address = "3P9nhmAEec4bDKsmLEZy2raimNJTVqedu43"

  Владелец ноды должен иметь положительный баланс и набор ролей.

.. _configuration-network:

8. Укажите сетевые параметры настраиваемой ноды:

    ::

      network {
        # Network address
        bind-address = "0.0.0.0"
        # Port number
        port = 6864

9. Укажите сетевые адреса (hostname) нод, которые будут подключены к сети:
  
    ::

      known-peers = [
        "privatenet-1.example.net:6864",
        "privatenet-2.exemple.net:6864" ]
  
  | В случае, если адреса дополнительных узлов сети не определены, допустимо указать пустое значение ``known-peers = [ ]``

10. Укажите путь и пароль от keystore - места хранения закрытых ключей участников сети, созданных на ноде (параметры ``wallet``, ``wallet-password`` в accounts.conf). Для криптографии Waves указывается путь до файла ``keystore.dat`` (пример, ``${user.home}/vostok/keystore.dat``), для ГОСТ-криптографии - путь до директории (``${user.home}/vostok/keystore/``):

    ::

      wallet {
        file = "c:/nodes/testnet-pos.vostoknodes.com/keystore.dat"
        password = "some string as password"
      }

.. _configuration-rest-api:

11. Укажите доступ к :ref:`интерфейсу REST API <rest-api-node>` ноды, а также хеш для доступа к методам :ref:`privacy <privacy-api>`: ``POST /privacy/sendData``, ``GET /privacy/getData/{policy-item-hash}`` и ``GET /privacy/getInfo/{policy-item-hash}``:

    ::
 
      rest-api {
        enable = yes
        bind-address = "0.0.0.0"
        port = 6862
        api-key-hash = "5M7C...fztS"
        privacy-api-key-hash = "H6ns...Xqsu"
        transactions-by-address-limit = 10000
      }

.. warning:: Для повышения безопасности рекомендуется генерировать различные значения ``api-key-hash`` и ``privacy-api-key-hash`` для доступа к REST API и для использования методов :ref:`privacy <privacy-api-access>`.

12. При использовании методов :ref:`privacy <privacy-api>` активируйте функциональность и заполните блок ``privacy`` параметрами настройки БД для хранения конфиденциальных данных:

    ::

      privacy {
        enable = true
        url = "" # insert DB connection string here, example "jdbc:postgresql://db_hostname:5432/_____?user=_____________&password=____"
        driver = "org.postgresql.Driver"
        profile = "slick.jdbc.PostgresProfile$"
        connectionPool = HikariCP
        connectionTimeout = 5000
        connectionTestQuery = "SELECT 1"
        queueSize = 10000
        numThreads = 10
        schema = "public"
        migration-dir = "db/migration"
      }

.. _anchoring-settings:

Настройка анкоринга
-------------------------

Если используете опцию :ref:`анкоринга <anchoring>`, необходимо настроить блок ``anchoring``.

    ::

      anchoring {
      enable = yes
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
      
**Параметры анкоринга**

* ``height-range`` - диапазон блоков, через который нода приватного блокчейна отправляет в Mainnet транзакции для анкоринга.
* ``height-above`` - диапазон блоков в Mainnet, через который нода приватного блокчейна создаёт подтверждающую анкоринг транзакцию с данными первой транзакции. Рекомендуется устанавливать значение, близкое к максимальной величине отката в Mainnet ``max-rollback-depth``.
* ``threshold`` - число блоков, которое отнимается от текущей высоты приватного блокчейна. В транзакцию для анкоринга, отправляемую в Mainnet, попадёт информация из блока на высоте ``current-height - threshold``. Если устанавливается значение 0, то берётся информация из текущего блока. Рекомендуется устанавливать значение, близкое к максимальной величине отката в приватном блокчейне ``max-rollback-depth``.

**Параметры авторизации при использовании анкоринга**

* ``type`` - тип авторизации при использовании анкоринга. ``api-key`` - авторизация по ``api-key-hash``, ``auth-service`` - авторизация по специальному токену.

В случае выбора авторизации по ``api-key-hash`` достаточно указать значение ключа в параметре ``api-key`` ниже. Если вы выбираете авторизацию по токену, необходимо указать ``type = "auth-service"``, раскомментировать параметры ниже и установить для них значения:

* ``authorization-token`` - постоянный авторизационный токен
* ``authorization-service-url`` - 
* ``token-update-interval`` - интервал обновления авторизационного токена.

**Параметры для доступа Mainnet**

* ``mainnet-scheme-byte`` - байт сети Mainnet.
* ``mainnet-node-address`` - сетевой адрес ноды в сети Mainnet, от которого будут отправляться транзакции для анкоринга.
* ``mainnet-node-port`` - номер порта ноды в сети Mainnet, от которого будут отправляться транзакции для анкоринга.
* ``mainnet-node-recipient-address`` - адрес ноды в сети Mainnet, от которого будут отправляться транзакции для анкоринга.

**Параметры авторизации на Mainnet, секция wallet**

* ``file`` - путь до каталога хранения ключей на ноде.
* ``password`` - пароль от keystore ноды.

**Параметры комиссий**

* ``mainnet-fee`` - плата за выпуск транзакции для анкоринга в сети Mainnet.
* ``sidechain-fee`` - плата за выпуск транзакции в приватном блокчейне.

.. _rest-api-access:

Доступ к REST API
--------------------

Используя утилиту `generators-x.x.x.jar <https://github.com/waves-enterprise/WE-releases/releases>`_, создайте ``api-key-hash`` для доступа к REST API ноды. Для запуска утилиты требуется в качестве одного из параметров указать файл ``api-key-hash.conf``, в котором определяются параметры создания ``api-key-hash``. Команда для запуска утилиты:

  ::

    java -jar generators-x.x.x.jar ApiKeyHash api-key-hash.conf

Полученное в результате исполнения утилиты значение указать в параметре ``api-key-hash`` конфигурационного файла ноды.

  ::

    // api-key-hash.conf listing

    apikeyhash-generator {
      waves-crypto = no
      api-key = "some string"
    }

  **Описание параметров:**

    - waves-crypto – выбор криптографического алгоритма ("yes" - использовать криптографию :ref:`Waves <crypto-waves>`, "no" - использовать :ref:`ГОСТ-криптографию <crypto-gost>`);
    - api-key – ключ, который необходимо придумать. Значение данного ключа потребуется указать в запросах к REST API ноды (подробнее на странице :ref:`REST API ноды <rest-api-node>`).

.. _privacy-api-access:

Доступ к методам privacy
----------------------------

Используя утилиту `generators-x.x.x.jar <https://github.com/waves-enterprise/WE-releases/releases>`_, создайте ``privacy-api-key-hash`` для доступа к методам :ref:`privacy <privacy-api>` REST API ноды. Для запуска утилиты требуется в качестве одного из параметров указать файл ``api-key-hash.conf``, в котором определяются параметры создания ``privacy-api-key-hash``. Команда для запуска утилиты:

  ::

    java -jar generators-x.x.x.jar ApiKeyHash api-key-hash.conf

Полученное в результате исполнения утилиты значение указать в параметре ``privacy-api-key-hash`` конфигурационного файла ноды.

.. _sign-genesis-block:

Подписание genesis-блока
------------------------------

Подпишите genesis-блок утилитой `generators-x.x.x.jar <https://github.com/waves-enterprise/WE-releases/releases>`_. Команда для подписания: ``java -jar generators-x.x.x.jar GenesisBlockGenerator node-config.conf``, где ``node-config.conf`` это отредактированный в этом :ref:`пункте <create-node-config>` конфигурационный файл ноды. После подписания поля ``genesis-public-key-base-58`` и ``signature`` конфигурационного файла будут заполнены значениями открытого ключа и подписи genesis-блока. 

  | Пример:

  ::

    genesis-public-key-base-58: "4ozcAj...penxrm"
    signature: "5QNVGF...7Bj4Pc"

.. _node-start:

Запуск ноды
----------------

Выполните указанную команду для запуска ноды:

::

  java -jar node-x.x.x.jar node-name.conf




