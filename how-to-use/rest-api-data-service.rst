
.. _rest-api-data-service:

REST API сервиса подготовки данных
=======================================

Транзакции
-----------

GET /transactions
~~~~~~~~~~~~~~~~~~

Возвращает список транзакций, соответствующий условиям поискового запроса и применённым фильтрам.

.. important:: За один запрос через метод API **GET /transactions** возвращается не более 500 транзакций.

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
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Возвращает количество транзакций, соответствующих условиям поискового запроса и применённым фильтрам.

**Ответ метода:**

.. code:: js

    {
    "count": "string"
    }

GET /transactions/id/{id}
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Возвращает транзакцию по идентификатору {id}.

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

Наборы токенов
---------------

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

Пользователи
-------------

GET /users
~~~~~~~~~~~~

Возвращает список пользователей, соответствующий условиям поискового запроса и применённым фильтрам.

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

Блоки
-------------

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

Транзакции с данными
---------------------

GET /api/v1/txIds/{key}
~~~~~~~~~~~~~~~~~~~~~~~~

Возвращает список идентификаторов транзакций с данными, содержащих указанный ключ.

**Ответ метода:**

.. code:: js

    [
    {
        "id": "string"
    }
    ]

GET /api/v1/txIds/{key}/{value}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Возвращает список идентификаторов транзакций с данными, содержащих указанный ключ и значение.

**Ответ метода:**

.. code:: js

    [
    {
        "id": "string"
    }
    ]

GET /api/v1/txData/{key}
~~~~~~~~~~~~~~~~~~~~~~~~

Возвращает тела транзакций с данными, содержащие указанный ключ.

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

Возвращает тела транзакций с данными, содержащие указанный ключ и значение.

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