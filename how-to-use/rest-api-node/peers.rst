Peers
=======

POST /peers/connect
~~~~~~~~~~~~~~~~~~~

Подключение к ноде.

**Запрос метода:**

.. code:: js

   {
       "host":"127.0.0.1",
       "port":"9084"
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
