.. _privacy-api:

Privacy
================

.. hint:: Правила формирования запросов к ноде приведены в разделе :ref:`rest-api-node`.

.. _privacy-senddata:

POST /privacy/sendData
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. figure:: https://img.shields.io/badge/API--KEY-required-red.svg

Запись конфиденциальных данных в хранилище ноды.

**Запрос метода:**

.. code:: js

    {
      "sender": "3HYW75PpAeVukmbYo9PQ3mzSHdKUgEytUUz",
      "password": "apgJP9atQccdBPA",
      "policyId": "4gZnJvbSBvdGhlciBhbmltYWxzLCB3aGljaC",
      "type": "file",
      "info": {
        "filename":"Service contract #100/5.doc",
        "size": "2048",
        "timestamp": 1000000000,
        "author": "AIvanov@org.com",
        "comment": "some comments"
       },
       "data": "TWFuIGlzIGRpc3Rpbmd1aXNoZWQsIG5vdCBvbmx5IGJ5IGhpcyByZWFzb24sIGJ1dCBieSB0aGlzIHNpbmd1bGFyIHBhc3Npb24gZnJvbSBvdGhlciBhbmltYWxzLCB3aGljaCBpcyBhIGx1c3Qgb2YgdGhlIG1pbmQsIHRoYXQgYnkgYSBwZXJzZXZlcmFuY2Ugb2YgZGVsaWdodCBpbiB0aGUgY29udGludWVkIGFuZCBpbmRlZmF0aWdhYmxlIGdlbmVyYXRpb24gb2Yga25vd2xlZGdlLCBleGNlZWRzIHRoZSBzaG9ydCB2ZWhlbWVuY2Ugb2YgYW55IGNhcm5hbCBwbGVhc3VyZS4=",
       "hash": "e67ad392ab4d933f39d5723aeed96c18c491140e119d590103e7fd6de15623f1"
    }

Параметры:

- sender - блокчейн-адрес, от которого должны рассылаться данные (соответствуют значению параметра "privacy.owner-address" в конфигурационном файле ноды);
- password - пароль для доступа к закрытому ключу keystore ноды;
- policyId - идентификатор группы, в рамках которой пересыалются данные;
- type - тип данных;
- info - информация о данных;
- data - данные в бинарном представлении;
- hash - хеш от данных.

GET /privacy/{policy-id}/recipients
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Получение адресов всех участников, записанных в группу {policy-id}.

Пример запроса: http://2.testnet-pos.vostoknodes.com:6862/privacy/rusal-policy/recipients

Ответ метода:

.. code:: js

    [
    "3NBVqYXrapgJP9atQccdBPAgJPwHDKkh6A8",
    "3Mx2afTZ2KbRrLNbytyzTtXukZvqEB8SkW7"
    ]

GET /privacy/{policy-id}/owners
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Получение адресов всех владельцев, записанных в группу {policy-id}.

Ответ метода:

.. code:: js

  [
    "3GCFaCWtvLDnC9yX29YftMbn75gwfdwGsBn",
    "3GGxcmNyq8ZAHzK7or14Ma84khwW8peBohJ",
    "3GRLFi4rz3SniCuC7rbd9UuD2KUZyNh84pn",
    "3GKpShRQRTddF1yYhQ58ZnKMTnp2xdEzKqW"
  ]

.. GET /privacy/{policy-id}/fullinfo
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Получение полной информации по группе {policy-id}: участники, владельцы (пользователи, которые могут вносить изменения в группу), ссылки на транзакции добавления участников в группу.
   Пример запроса: http://2.testnet-pos.vostoknodes.com:6862/privacy/rusal-policy/fullinfo
   Ответ метода:
   .. code:: js
    {
    "recipients": [
        {
        "address": "3NBVqYXrapgJP9atQccdBPAgJPwHDKkh6A8",
        "pubKey": "apgJP9atQccdBPAgJPwH3NBVqYXrapgJP9atQccdBPAgJPwHapgJP9atQccdBPAgJPwHDKkh6A8",
        "transactionId": "6RwMUQcwrxtKDgM4ANes9Amu5EJgyfF9Bo6nTpXyD89ZKMAcpCM97igbWf2MmLXLdqNxdsUc68fd5TyRBEB6nqf"
        },
        {
        "address": "3NBVqYXrapgJP9atQccdBPAgJPwHDKkh6A8",
        "pubKey": "apgJP9atQccdBPAgJPwH3NBVqYXrapgJP9atQccdBPAgJPwHapgJP9atQccdBPAgJPwHDKkh6A8",
        "transactionId": "6RwMUQcwrxtKDgM4ANes9Amu5EJgyfF9Bo6nTpXyD89ZKMAcpCM97igbWf2MmLXLdqNxdsUc68fd5TyRBEB6nqf"
        }
    ],
    "owners": [
        {
        "address": "3NBVqYXrapgJP9atQccdBPAgJPwHDKkh6A8",
        "pubKey": "apgJP9atQccdBPAgJPwH3NBVqYXrapgJP9atQccdBPAgJPwHapgJP9atQccdBPAgJPwHDKkh6A8",
        "transactionId": "6RwMUQcwrxtKDgM4ANes9Amu5EJgyfF9Bo6nTpXyD89ZKMAcpCM97igbWf2MmLXLdqNxdsUc68fd5TyRBEB6nqf"
        }
    ]
    }


GET /privacy/{policy-id}/hashes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Получение массива идентификационный хешей, которые записаны в привязке к {policy-id}.

Пример запроса: http://2.testnet-pos.vostoknodes.com:6862/privacy/rusal-policy/getHashes

Ответ метода:

.. code:: js

    [
    "FdfdNBVqYXrapgJP9atQccdBPAgJPwHDKkh6A8",
    "eedfdNBVqYXrapgJP9atQccdBPAgJPwHDKkh6A"
    ]

GET /privacy/getData/{policy-item-hash}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. figure:: https://img.shields.io/badge/API--KEY-required-red.svg

Получение пакета конфиденциальных данных по идентификационному хешу.

Пример запроса: http://2.testnet-pos.vostoknodes.com:6862/privacy/getdata/NBVqYXrapgJP9atQccdBPAgJPwHapgJP9atQccdBPAg


GET /privacy/getInfo/{policy-item-hash}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. figure:: https://img.shields.io/badge/API--KEY-required-red.svg

Получение метаданных для пакета конфиденциальных данных по идентификационному хешу.

Пример запроса: http://2.testnet-pos.vostoknodes.com:6862/privacy/getinfo/NBVqYXrapgJP9atQccdBPAgJPwHapgJP9atQccdBPAg

Ответ метода:

.. code:: js

    {
      "sender": "3HYW75PpAeVukmbYo9PQ3mzSHdKUgEytUUz",
      "policy": "4gZnJvbSBvdGhlciBhbmltYWxzLCB3aGljaC",
      "type": "file",
      "info": {
        "filename":"Contract №100/5.doc",
        "size": "2048",
        "timestamp": 1000000000,
        "author": "AIvanov@org.com",
        "comment": "Comment"
      },
    "hash": "e67ad392ab4d933f39d5723aeed96c18c491140e119d590103e7fd6de15623f1"
    }

POST /privacy/forceSync
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. figure:: https://img.shields.io/badge/API--KEY-required-red.svg

Запрос на принудительное получение пакета конфиденциальных данных.

Ответ метода:

.. code:: js

  {
    "result": "success" // or "error"
    "message": "Address '3NBVqYXrapgJP9atQccdBPAgJPwHDKkh6A8' not in policy 'policyName'"
  }

POST /privacy/getInfos
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. figure:: https://img.shields.io/badge/API--KEY-required-red.svg

Запрос на возвращение массива мета-информации о приватных данных по предоставленным идентификатору группы и хешу данных.

Пример запроса:

.. code:: js

   { "policiesDataHashes":
     [
      {
       "policyId":"somepolicyId_1",
       "datahashes":[ "datahash_1","datahash_2" ]
      },
      {
        "policyId":"somepolicyId_2",
        "datahashes":[ "datahash_3","datahash_4" ]
      }
     ]
    }

Ответ метода:

.. code:: js

  {
   "policiesDataInfo":[
      {
         "policyId":"somepolicyId_1",
         "datasInfo":[
            {
               "hash":"e67ad392ab4d933f39d5723aeed96c18c491140e119d590103e7fd6de15623f1",
               "sender":"3HYW75PpAeVukmbYo9PQ3mzSHdKUgEytUUz",
               "type":"file",
               "info":{
                  "filename":"Contract №100/5.doc",
                  "size":"2048",
                  "timestamp":1000000000,
                  "author":"AIvanov@org.com",
                  "comment":"Comment"
               }
            },
            {
               "hash":"e67ad392ab4d933f39d5723aeed96c18c491140e119d590103e7fd6de15623f1",
               "sender":"3HYW75PpAeVukmbYo9PQ3mzSHdKUgEytUUz",
               "type":"file",
               "info":{
                  "filename":"Contract №101/5.doc",
                  "size":"2048",
                  "timestamp":1000000000,
                  "author":"AIvanov@org.com",
                  "comment":"Comment"
               }
            }
            }
          ]
      ]
  }


