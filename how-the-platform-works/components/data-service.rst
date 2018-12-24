Сервис подготовки данных
========================================

Агрегирует данные из блокчейна в реляционную БД для удобства работы. API сервиса предоставляет следующие возможности:

GET /transactions
~~~~~~~~~~~~~~~~~~

Возвращает список транзакций соответствующий условиям поискового запроса и применённым фильтрам.

**Ответ метода:**

.. code:: js

    [
     {
        "id": "string",
        "type": 0,
        "height": 0,
        "fee": 0,
        "sender": "string",
        "senderPublicKey": "string",
        "signature": "string",
        "timestamp": 0,
        "version": 0
     }
    ]

GET /transactions/count
~~~~~~~~~~~~~~~~~~~~~~~

Возвращает количество транзакций соответствующих условиям поискового запроса и примененных фильтров.

**Ответ метода:**

.. code:: js

    {
    "count": "string"
    }

GET /transactions/id/{id}
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Возвращает транзакцию по идентификатору.

**Ответ метода:**

.. code:: js

    {
    "id": "string",
    "type": 0,
    "height": 0,
    "fee": 0,
    "sender": "string",
    "senderPublicKey": "string",
    "signature": "string",
    "timestamp": 0,
    "version": 0
    }

GET /assets
~~~~~~~~~~~~~~~~~

Возвращает список доступных в блокчейне наборов токенов (в виде транзакций выпуска токенов).

**Ответ метода:**

.. code:: js

    [
     {
        "id": "string",
        "type": 0,
        "height": 0,
        "fee": 0,
        "sender": "string",
        "senderPublicKey": "string",
        "signature": "string",
        "timestamp": 0,
        "version": 0,
        "assetId": "string",
        "name": "string",
        "description": "string",
        "quantity": 0,
        "decimals": 0,
        "reissuable": true
     }
    ]

GET /users
~~~~~~~~~~~~

Возвращает список пользователей соответствующий условиям поискового запроса и применённым фильтрам.

**Ответ метода:**

.. code:: js

    [
     {
        "address": "string",
        "aliases": [
        "string"
        ],
        "registration_date": "string",
        "permissions": [
        "string"
        ],
        "balances": [
        {
        "assetId": "string",
         "amount": 0
        }
        ]
     }
    ]   

GET /users/{userAddress}
~~~~~~~~~~~~~~~~~~~~~~~~

Возвращает информацию о пользователе по его адресу.

**Ответ метода:**

.. code:: js

    {
    "address": "string",
    "aliases": [
        "string"
    ],
    "registration_date": "string",
    "permissions": [
        "string"
    ],
    "balances": [
        {
          "assetId": "string",
        "amount": 0
        }
    ]
    }

GET /blocks/{height}
~~~~~~~~~~~~~~~~~~~~

Возвращает блок на указанной высоте.

**Ответ метода:**

.. code:: js

   {
    "version": 0,
    "timestamp": 0,
    "reference": "string",
    "nxt-consensus": {
        "base-target": 0,
        "generation-signature": "string"
    },
    "features": [
        0
    ],
    "generator": "string",
    "signature": "string",
    "blocksize": 0,
    "transactionCount": 0,
    "fee": 0,
    "height": 0,
    "transactions": [
        {
        "id": "string",
        "type": 0,
        "height": 0,
        "fee": 0,
        "sender": "string",
        "senderPublicKey": "string",
        "signature": "string",
        "timestamp": 0,
        "version": 0
        }
    ]
    }

GET /api/v1/txIds/{key}
~~~~~~~~~~~~~~~~~~~~~~~~

Возвращает список идентификаторов дата-транзакций, содержащих указанный ключ.

**Ответ метода:**

.. code:: js

    [
    {
        "id": "string"
    }
    ]

GET /api/v1/txIds/{key}/{value}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Возвращает список идентификаторов дата-транзакций, содержащих указанный ключ и значение.

**Ответ метода:**

.. code:: js

    [
    {
        "id": "string"
    }
    ]

GET /api/v1/txData/{key}
~~~~~~~~~~~~~~~~~~~~~~~~

Возвращает тела дата-транзакций содержащих указанный ключ.

**Ответ метода:**

.. code:: js

    [
    {
     "id": "string",
     "type": "string",
     "height": 0,
     "fee": 0,
     "sender": "string",
     "senderPublicKey": "string",
     "signature": "string",
     "timestamp": 0,
     "version": 0,
     "key": "string",
     "value": "string",
     "position_in_tx": 0
    }
    ]

GET /api/v1/txData/{key}/{value}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Возвращает тела дата-транзакций содержащих указанный ключ и значение.

**Ответ метода:**

.. code:: js

    [
    {
     "id": "string",
     "type": "string",
     "height": 0,
     "fee": 0,
     "sender": "string",
     "senderPublicKey": "string",
     "signature": "string",
     "timestamp": 0,
     "version": 0,
     "key": "string",
     "value": "string",
     "position_in_tx": 0
    }
    ]




Поисковое значение — строковый параметр

Фильтры
~~~~~~~~

Список строк в которых ищутся совпадения:

* описания
* суммы
* блоки
* алиасы
* адреса
* в адресах как автора
* в адресах как получателя
* в идентификаторах транзакций
* в идентификаторах токенов
* в подписях
* в ключах-значениях
* везде

in_description
in_sums
in_blocks
in_aliases
in_addresses
in_addresses_author
in_addresses_participant
in_tx_ids
in_token_ids
in_signatures
in_keys_values
in_all

Тип транзакций
Токены - непонятно?
Сумма транзакции равна
Сумма транзакции от до
Дата транзакции от данные
Разрешения
Индекс и Лимит?
