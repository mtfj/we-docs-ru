.. _privacy-api:

Privacy
================

Указанные в разделе запросы доступны в релизе 0.9 ноды Восток.

.. hint:: Правила формирования запросов к ноде приведены в разделе :ref:`rest-api-node`.

POST /privacy/sendData
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Запись конфиденциальных данных в хранилище ноды

**Запрос метода:**

.. code:: js

    {
    "sender": "3HYW75PpAeVukmbYo9PQ3mzSHdKUgEytUUz",
    "password": "apgJP9atQccdBPA",
    "policy": "rusal_policy",
    "data": "TWFuIGlzIGRpc3Rpbmd1aXNoZWQsIG5vdCBvbmx5IGJ5IGhpcyByZWFzb24sIGJ1dCBieSB0aGlzIHNpbmd1bGFyIHBhc3Npb24gZnJvbSBvdGhlciBhbmltYWxzLCB3aGljaCBpcyBhIGx1c3Qgb2YgdGhlIG1pbmQsIHRoYXQgYnkgYSBwZXJzZXZlcmFuY2Ugb2YgZGVsaWdodCBpbiB0aGUgY29udGludWVkIGFuZCBpbmRlZmF0aWdhYmxlIGdlbmVyYXRpb24gb2Yga25vd2xlZGdlLCBleGNlZWRzIHRoZSBzaG9ydCB2ZWhlbWVuY2Ugb2YgYW55IGNhcm5hbCBwbGVhc3VyZS4=",
    "hash": "e67ad392ab4d933f39d5723aeed96c18c491140e119d590103e7fd6de15623f1"
    }

Параметры:

- sender - блокчейн-адрес, от которого должны рассылаться данные (соответствуют значению параметра "privacy.owner-address" в конфигурационном файле ноды);
- password - пароль для доступа к закрытому ключу keystore ноды;
- policy - идентификатор группы, в рамках которой пересыалются данные;
- data - данные в бинарном представлении;
- hash - хеш от данных.



GET /privacy/{policy}/recipients
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Получение адресов всех участников, записанных в группу {policy}.

Пример запроса: http://2.testnet-pos.vostoknodes.com:6862/privacy/rusal-policy/recipients

Ответ метода:

.. code:: js

    [
    "3NBVqYXrapgJP9atQccdBPAgJPwHDKkh6A8",
    "3Mx2afTZ2KbRrLNbytyzTtXukZvqEB8SkW7"
    ]

GET /privacy/{policy}/fullinfo
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Получение полной информации по группе {policy}: участники, владельцы (пользователи, которые могут вносить изменения в policy), ссылки на транзакции добавления участников в policy.

Пример запроса: http://2.testnet-pos.vostoknodes.com:6862/privacy/rusal-policy/fullinfo

Ответ метода:

.. code:: js

    {
    "recipients": [
        {
        "address": "3NBVqYXrapgJP9atQccdBPAgJPwHDKkh6A8",
        "pubKey": "apgJP9atQccdBPAgJPwH3NBVqYXrapgJP9atQccdBPAgJPwHapgJP9atQccdBPAgJPwHDKkh6A8",
        "txID": "6RwMUQcwrxtKDgM4ANes9Amu5EJgyfF9Bo6nTpXyD89ZKMAcpCM97igbWf2MmLXLdqNxdsUc68fd5TyRBEB6nqf"
        },
        {
        "address": "3NBVqYXrapgJP9atQccdBPAgJPwHDKkh6A8",
        "pubKey": "apgJP9atQccdBPAgJPwH3NBVqYXrapgJP9atQccdBPAgJPwHapgJP9atQccdBPAgJPwHDKkh6A8",
        "txID": "6RwMUQcwrxtKDgM4ANes9Amu5EJgyfF9Bo6nTpXyD89ZKMAcpCM97igbWf2MmLXLdqNxdsUc68fd5TyRBEB6nqf"
        }
    ],
    "policyOwners": [
        {
        "address": "3NBVqYXrapgJP9atQccdBPAgJPwHDKkh6A8",
        "pubKey": "apgJP9atQccdBPAgJPwH3NBVqYXrapgJP9atQccdBPAgJPwHapgJP9atQccdBPAgJPwHDKkh6A8",
        "txID": "6RwMUQcwrxtKDgM4ANes9Amu5EJgyfF9Bo6nTpXyD89ZKMAcpCM97igbWf2MmLXLdqNxdsUc68fd5TyRBEB6nqf"
        }
    ]
    }

GET /privacy/{policy}/getHashes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Получение массива идентификационный хешей, которые записаны в привязке к {policy}.

Пример запроса: http://2.testnet-pos.vostoknodes.com:6862/privacy/rusal-policy/getHashes

Ответ метода:

.. code:: js

    [
    "FdfdNBVqYXrapgJP9atQccdBPAgJPwHDKkh6A8",
    "eedfdNBVqYXrapgJP9atQccdBPAgJPwHDKkh6A"
    ]

GET /privacy/getData/{hash}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. figure:: https://img.shields.io/badge/API--KEY-required-red.svg

Получение пакета конфиденциальных данных по идентификационному хешу.

Пример запроса: http://2.testnet-pos.vostoknodes.com:6862/privacy/getdata/NBVqYXrapgJP9atQccdBPAgJPwHapgJP9atQccdBPAg


GET /privacy/getInfo/{hash}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. figure:: https://img.shields.io/badge/API--KEY-required-red.svg

Получение метаданных для пакета конфиденциальных данных по идентификационному хешу.

Пример запроса: http://2.testnet-pos.vostoknodes.com:6862/privacy/getinfo/NBVqYXrapgJP9atQccdBPAgJPwHapgJP9atQccdBPAg

Ответ метода:

.. code:: js

    {
    "creator": {
        "address": "3NBVqYXrapgJP9atQccdBPAgJPwHDKkh6A8",
        "pubKey": "apgJP9atQccdBPAgJPwH3NBVqYXrapgJP9atQccdBPAgJPwHapgJP9atQccdBPAgJPwHDKkh6A8"
    },
    "txID": "6RwMUQcwrxtKDgM4ANes9Amu5EJgyfF9Bo6nTpXyD89ZKMAcpCM97igbWf2MmLXLdqNxdsUc68fd5TyRBEB6nqf",
    "policy": "rusal_policy"
    }
