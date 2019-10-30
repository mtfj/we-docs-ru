
.. _authorization-config:

Настройка типа авторизации для доступа к REST API ноды
===========================================================

Блокчейн-платформа Waves Enterprise поддерживает следующие два типа авторизации для доступа к REST API ноды:

* авторизация по хешу ключевой строки ``api-key``;
* авторизация через сервис авторизации.

Тип авторизации указывается в секции настройки REST API ``rest-api`` конфигурационного файла ноды. Авторизация по хешу ключевой строки ``api-key`` является простым средством управления доступом к ноде с низким уровнем безопасности. В случае попадения хеша ключевой строки ``api-key`` к злоумышленнику, тот получает полный доступ к ноде. Применение авторизации с использованием отдельного сервиса авторизации, где доступ к ноде предоставляется по специальному токену, повышает безопасность блокчейн сети до высокого уровня. Подробнее о сервисе авторизации можно почитать в разделе :ref:`Сервис авторизации <authorization-service>`.

.. _configuration-rest-api:

Секция ``rest-api`` конфигурационного файла ноды
------------------------------------------------------

Секция ``rest-api`` позволяет привязать сетевой адрес ноды к REST API, выбрать и настроить тип авторизации, а также указать ограничения для некоторых методов REST API.

::

    # Node's REST API settings
    rest-api {
    # Enable/disable REST API
    enable = yes

    # Network address to bind to
    bind-address = "127.0.0.1"

    # Port to listen to REST API requests
    port = 6862

    # Authorization strategy should be either 'oauth2' or 'api-key', default is 'api-key'
    auth {
      type = "api-key"

      # Hash of API key string
      api-key-hash = "H6nsiifwYKYEx6YzYD7woP1XCn72RVvx6tC1zjjLXqsu"

      # Hash of API key string for PrivacyApi routes
      privacy-api-key-hash = "H6nsiifwYKYEx6YzYD7woP1XCn72RVvx6tC1zjjLXqsu"
    }
    # For OAuth2:
    # auth {
    #   type: "oauth2"

    #   # OAuth2 service public key to verify auth tokens
    #   public-key: "AuthorizationServicePublicKeyInBase64"

    #   # OAuth2 settings for initial sync
    #   service-url: "auth.service.url"
    #   service-token: "auth-token"
    # }

    # Enable/disable CORS support
    cors = yes

    # Enable/disable X-API-Key from different host
    api-key-different-host = no

    # Max number of transactions
    # returned by /transactions/address/{address}/limit/{limit}
    transactions-by-address-limit = 10000
    distribution-address-limit = 1000
    }

**Описание параметров**

* ``enable`` - активация опции REST API на ноде.
* ``bind-address`` - сетевой адрес ноды для привязки REST API.
* ``port`` - порт прослушивания REST API запросов.
* ``cors`` - поддержка кросс-доменных запросов к REST API.
* ``transactions-by-address-limit`` - максимальное количество транзакций, возвращаемых методом ``/transactions/address/{address}/limit/{limit}``.
* ``distribution-address-limit`` - максимальное количество адресов, указываемых в поле ``limit`` и возвращаемых методом ``GET ​/assets​/{assetId}​/distribution​/{height}​/limit​/{limit}``.

Секция ``auth``

* ``auth-type`` - тип авторизации. ``oauth2`` - авторизация по токену, ``api-key`` - авторизация по хешу ключевой строки.
* ``api-key-hash``- хеш от ключевой строки доступа к REST API.
* ``privacy-api-key-hash`` - хеш от ключевой строки доступа к методам ``privacy``.
* ``oauth-public-key`` - публичный ключ сервиса авторизации.
* ``service-url`` - 
* ``service-token`` - 

.. _auth-api-key-setup:

Использование авторизации по хешу ключевой строки
-------------------------------------------------------

В параметре ``auth-type`` установите значение ``api-key``. Используя утилиту `generators-x.x.x.jar <https://github.com/waves-enterprise/WE-releases/releases>`_, создайте ``api-key-hash`` для доступа к REST API ноды. Для запуска утилиты требуется в качестве одного из параметров указать :ref:`файл api-key-hash.conf <rest-api-access>`, в котором определяются параметры создания ``api-key-hash``. Команда для запуска утилиты:

  ::

    java -jar generators-x.x.x.jar ApiKeyHash api-key-hash.conf

Полученное в результате исполнения утилиты значение укажите в параметре ``api-key-hash`` конфигурационного файла ноды.

.. _privacy-api-access:

Для доступа к методам :ref:`privacy <privacy-api>` создайте ``privacy-api-key-hash`` аналогичным методом, как и ``api-key-hash``, описанным выше. Полученное значение укажите в параметре ``privacy-api-key-hash`` конфигурационного файла ноды.

.. _auth-token-setup:

Использование авторизации по токену
-------------------------------------

В параметре ``auth-type`` установите значение ``api-key``, в параметре ``oauth-public-key`` укажите публичный ключ сервиса авторизации.








