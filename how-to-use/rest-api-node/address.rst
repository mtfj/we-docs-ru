Address
============

GET /addresses
~~~~~~~~~~~~~~

Получение всех адресов участников, ключевые пары которых хранятся в keystore ноды.

**Ответ метода:**

.. code:: js

   [
   "3NBVqYXrapgJP9atQccdBPAgJPwHDKkh6A8",
   "3Mx2afTZ2KbRrLNbytyzTtXukZvqEB8SkW7"
   ]

GET /addresses/seq/{from}/{to}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Получение всех адресов участников, ключевые пары которых хранятся в keystore ноды в заданном диапазоне.

**Ответ метода:**

.. code:: js

   [
   "3NBVqYXrapgJP9atQccdBPAgJPwHDKkh6A8",  
   "3Mx2afTZ2KbRrLNbytyzTtXukZvqEB8SkW7"
   ]

POST /addresses
~~~~~~~~~~~~~~~

Создание новой ключевой пары и адреса в keystore ноды.

**Ответ метода:**

.. code:: js

   {
   "address": "3Mx2afTZ2KbRrLNbytyzTtXukZvqEB8SkW7"
   }

GET /addresses/balance/{address}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Получение баланса для адреса {address}:

**Ответ метода:**

.. code:: js

   {
     "address": "3N3keodUiS8WLEw9W4BKDNxgNdUpwSnpb3K",
     "confirmations": 0,
     "balance": 100945889661986
   }

GET /addresses/balance/{address}/{confirmations}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Получение баланса для адреса {address} после подтверждений {confirmations}.

**Ответ метода:**

.. code:: js

   {
   "address": "3N3keodUiS8WLEw9W4BKDNxgNdUpwSnpb3K",
   "confirmations": 500,
   "balance": 100945388397565
   }

GET /addresses/scriptInfo/{address}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Получение данных об установленном скрипте на адресе 

**Ответ метода:**

.. code:: js

   {
     "address": "3N3keodUiS8WLEw9W4BKDNxgNdUpwSnpb3K",
     "script": "3rbFDtbPwAvSp2vBvqGfGR9nRS1nBVnfuSCN3HxSZ7fVRpt3tuFG5JSmyTmvHPxYf34SocMRkRKFgzTtXXnnv7upRHXJzZrLSQo8tUW6yMtEiZ",
     "scriptText": "ScriptV1(BLOCK(LET(x,CONST_LONG(1)),FUNCTION_CALL(FunctionHeader(==,List(LONG, LONG)),List(FUNCTION_CALL(FunctionHeader(+,List(LONG, LONG)),List(REF(x,LONG), CONST_LONG(1)),LONG), CONST_LONG(2)),BOOLEAN),BOOLEAN))",
     "complexity": 11,
     "extraFee": 10001
   }


- "address" - адреса в формате Base58
- "script" - Base64 представление скрипта
- "scriptText" - исходный код скрипта
- "complexity" - сложность скрипта
- "extraFee" - комиссия за исходящие транзакции, установленные скриптом
