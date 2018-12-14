Utils
=======

.. sidebar:: REST API

   Правила формирования запросов к ноде приведены в разделе :ref:`rest-api-node`.
   
POST /utils/hash/secure
~~~~~~~~~~~~~~~~~~~~~~~

Возвращает secure (двойной) hash от заданного сообщения.

**Запрос метода:**

::

   ridethewaves!

**Ответ метода:**

.. code:: js

   {
     "message": "ridethewaves!",
     "hash": "H6nsiifwYKYEx6YzYD7woP1XCn72RVvx6tC1zjjLXqsu"
   }

POST /utils/hash/fast
~~~~~~~~~~~~~~~~~~~~~

Возвращает hash от заданного сообщения.

**Запрос метода:**

::

   ridethewaves!

**Ответ метода:**

.. code:: js

   {
     "message": "ridethewaves!",
     "hash": "DJ35ymschUFDmqCnDJewjcnVExVkWgX7mJDXhFy9X8oQ"
   }

GET /utils/seed/{length}
~~~~~~~~~~~~~~~~~~~~~~~~

Возвращает случайный seed заданной {length} длины.

**Ответ метода:**

.. code:: js

   {
     "seed": "3XcHLU6bYRax1c"
   }

GET /utils/seed
~~~~~~~~~~~~~~~

Возвращает случайный seed.

**Ответ метода:**

.. code:: js

   {
     "seed": "2uwLAe7Rp7TuNiBTKsmTEJ5wxGqkBHjcyPq2tMXiWye7"
   }

POST /utils/script/compile
~~~~~~~~~~~~~~~~~~~~~~~~~~

**Параметры ответа:**

::

   "script" - скрипт в формате Base64
   "complexity" - сложность скрипта
   "extraFee" - комиссия за исходящие транзакции, установленные скриптом

**Запрос метода:**

::

   let x = 1
   (x + 1) == 2

**Ответ метода:**

.. code:: json

   {
     "script": "3rbFDtbPwAvSp2vBvqGfGR9nRS1nBVnfuSCN3HxSZ7fVRpt3tuFG5JSmyTmvHPxYf34SocMRkRKFgzTtXXnnv7upRHXJzZrLSQo8tUW6yMtEiZ",
     "complexity": 11,
     "extraFee": 10001
   }

или 

**Запрос метода:**

::

   x == 1

**Ответ метода:**

.. code:: json

   {
     "error": "Typecheck failed: A definition of 'x' is not found"
   }

POST /utils/script/estimate
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Декодирование base64 скрипта.

**Запрос метода:**

::

   AQQAAAABeAAAAAAAAAAAAQkAAAAAAAACCQAAZAAAAAIFAAAAAXgAAAAAAAAAAAEAAAAAAAAAAAJdecYi

**Ответ метода:**

.. code:: json

   {
     "script": "3rbFDtbPwAvSp2vBvqGfGR9nRS1nBVnfuSCN3HxSZ7fVRpt3tuFG5JSmyTmvHPxYf34SocMRkRKFgzTtXXnnv7upRHXJzZrLSQo8tUW6yMtEiZ",
     "scriptText": "FUNCTION_CALL(FunctionHeader(==,List(LONG, LONG)),List(CONST_LONG(1), CONST_LONG(2)),BOOLEAN)",
     "complexity": 11,
     "extraFee": 10001
   }

GET /utils/time
~~~~~~~~~~~~~~~~~~~~~~~~~~~
Возвращает текущее время на ноде.

**Ответ метода:**

.. code:: json

   {
   "system": 1544715343390,
   "NTP": 1544715343390
   }