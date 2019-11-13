Peers
=======

.. hint:: Правила формирования запросов к ноде приведены в разделе :ref:`rest-api-node`.
   
POST /peers/connect
~~~~~~~~~~~~~~~~~~~

.. figure:: https://img.shields.io/badge/API--KEY-required-red.svg

Запрос на подключение нового узла к ноде.

**Запрос метода:**

.. code:: js

   {
       "host":"127.0.0.1",
       "port":"9084"
   }

**Ответ метода:**

.. code:: js

  {
    "hostname": "localhost",
    "status": "Trying to connect"
  }

GET /peers/connected
~~~~~~~~~~~~~~~~~~~~
Возвращает список подключенных нод.

**Ответ метода:**

.. code:: js

   {
     "peers": [
       {
         "address": "52.51.92.182/52.51.92.182:6863",
         "declaredAddress": "N/A",
         "peerName": "zx 182",
         "peerNonce": 183759
       },
       {
         "address": "ec2-52-28-66-217.eu-central-1.compute.amazonaws.com/52.28.66.217:6863",
         "declaredAddress": "N/A",
         "peerName": "zx 217",
         "peerNonce": 1021800
       }
     ]
   }

GET /peers/blacklisted
~~~~~~~~~~~~~~~~~~~~~~
Возвращает список заблокированных (на сетевом уровне) нод.

GET /peers/all
~~~~~~~~~~~~~~
Возвращает список всех известных нод.

**Ответ метода:**

.. code:: js

  {
    "peers": [
      {
        "address": "/13.80.103.153:6864",
        "lastSeen": 1544704874714
      }
    ]
  }

POST /peers/clearblacklist
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. figure:: https://img.shields.io/badge/API--KEY-required-red.svg

Очищает список заблокированных нод.

**Запрос метода:**

Объект запроса передавать не обязательно.

**Ответ метода:**

.. code:: js

  {
    "result": "blacklist cleared"
  }

GET /peers/suspended
~~~~~~~~~~~~~~~~~~~~~~~~
Возвращает список suspended нод.

**Ответ метода:**

.. code:: js

  [
    {
      "hostname": "/13.80.103.153",
      "timestamp": 1544704754619
    }
  ]

POST /peers/identity
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Получение публичного ключа пира, к которому подключается нода для передачи конфиденциальных данных.

**Запрос метода:**

.. code:: js

  {
    "address": "3NBVqYXrapgJP9atQccdBPAgJPwHDKkh6A8",
    "signature": "6RwMUQcwrxtKDgM4ANes9Amu5EJgyfF9Bo6nTpXyD89ZKMAcpCM97igbWf2MmLXLdqNxdsUc68fd5TyRBEB6nqf"
  }

Параметры:

- address - блокчейн-адрес, который соответствует параметру "privacy.owner-address" в конфигурационном файле ноды;
- signature - электронная подпись от значения поля "address".

**Ответ метода:**

.. code:: js

  {
    "publicKey": "3NBVqYXrapgJP9atQccdBPAgJPwHDKkh6A8"
  }
    
Параметры:

- publicKey - публичный ключ пира, связанный с параметром "privacy.owner-address" в его конфигурационном файле. Если выключен режим проверки handshakes, то параметр publicKey не отображается.  


GET /peers/hostname/{address}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Получение hostname и IP-адреса ноды по ее адресу в сети Vostok.

Пример запроса: http://2.testnet-pos.vostoknodes.com:6862/privacy/hostname/3NBVqYXrapgJP9atQccdBPAgJPwHDKkh6A8

**Ответ метода:**

.. code:: js

  {
    "hostname": "node1.vostok.io",
    "ip": "10.0.0.1"
  }

GET /peers/allowedNodes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Получение актуального списка разрешенных участников сети на момент запроса.

**Ответ метода:**

.. code:: js

  {
    "allowedNodes": [
      {
        "address": "3JNLQYuHYSHZiHr5KjJ89wwFJpDMdrAEJpj",
        "publicKey": "Gt3o1ghh2M2TS65UrHZCTJ82LLcMcBrxuaJyrgsLk5VY"
      },
      {
        "address": "3JLp8wt7rEUdn4Cca5Hp9jZ7w8T5XDAKicd",
        "publicKey": "J3ffCciVu3sustgb5vxmEHczACMR89Vty5ZBLbPn9xyg"
      },
      {
        "address": "3JRY1cp7atRMBd8QQoswRpH7DLawM5Pnk3L",
        "publicKey": "5vn4UcB9En1XgY6w2N6e9W7bqFshG4SL2RLFqEWEbWxG"
      }
    ],
    "timestamp": 1558697649489
  }

