Alias
===========

POST /alias/create
~~~~~~~~~~~~~~~~~~

Подписывает транзакцию по созданию (alias) псевдонима закрытым ключем отправителя, сохраненным в keystore ноды.

**Параметры запроса**

::

   "sender" - Sender's addresss, Base58-encoded
   "fee" - Amount of transaction fee
   "alias" - alias for a sender's address

**Запрос метода**

.. code:: js

    {
    "sender": "3MtrNP7AkTRuBhX4CBti6iT21pQpEnmHtyw",
    "fee": 100000,
    "alias": "ALIAS",
   }

**Ответ метода**

.. code:: js

   {
    "type":10,
    "id":"9q7X84wFuVvKqRdDQeWbtBmpsHt9SXFbvPPtUuKBVxxr",
    "sender":"3MtrNP7AkTRuBhX4CBti6iT21pQpEnmHtyw",
    "senderPublicKey":"G6h72icCSjdW2A89QWDb37hyXJoYKq3XuCUJY2joS3EU",
    "fee":100000000,
    "timestamp":46305781705234713,
    "signature":"4gQyPXzJFEzMbsCd9u5n3B2WauEc4172ssyrXCL882oNa8NfNihnpKianHXrHWnZs1RzDLbQ9rcRYnSqxKWfEPJG",
    "alias":"dajzmj6gfuzmbfnhamsbuxivc"
   }

GET /alias/by-alias/{alias}
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Получает адрес участника по его {alias} псевдониму.

**Ответ метода**

.. code:: js

   {

   "address": "address:3Mx2afTZ2KbRrLNbytyzTtXukZvqEB8SkW7"

   }

GET /alias/by-address/{address}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Получает {alias} псевдоним участника по его адрес {address}.

**Ответ метода**

.. code:: js

   [

   "alias:HUMANREADABLE1",
   "alias:HUMANREADABLE2",
   "alias:HUMANREADABLE3",

   ]
