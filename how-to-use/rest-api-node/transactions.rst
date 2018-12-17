Transactions
=============

.. sidebar:: REST API

   Правила формирования запросов к ноде приведены в разделе :ref:`rest-api-node`.
   
GET /transactions/info/{id}
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Запрос сведений по транзакции по ее ID.

**Параметры запроса:**

::

   "id" - Transaction ID

**Ответ метода:**

.. code:: js

   {
     "type": 4,
     "id": "52GG9U2e6foYRKp5vAzsTQ86aDAABfRJ7synz7ohBp19",
     "sender": "3NBVqYXrapgJP9atQccdBPAgJPwHDKkh6A8",
     "senderPublicKey": "CRxqEuxhdZBEHX42MU4FfyJxuHmbDBTaHMhM3Uki7pLw",
     "recipient": "3NBVqYXrapgJP9atQccdBPAgJPwHDKkh6A8",
     "assetId": "E9yZC4cVhCDfbjFJCc9CqkAtkoFy5KaCe64iaxHM2adG",
     "amount": 100000,
     "feeAsset": null,
     "fee": 100000,
     "timestamp": 1479313236091,
     "attachment": "string",
     "signature": "GknccUA79dBcwWgKjqB7vYHcnsj7caYETfncJhRkkaetbQon7DxbpMmvK9LYqUkirJp17geBJCRTNkHEoAjtsUm",
     "height": 7782
   }

GET /transactions/address/{address}/limit/{limit}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Возвращает последние {limit} транзакций с адреса {address}.

**Ответ метода:**

.. code:: js

   [
     [
       {
         "type": 2,
         "id": "4XE4M9eSoVWVdHwDYXqZsXhEc4q8PH9mDMUBegCSBBVHJyP2Yb1ZoGi59c1Qzq2TowLmymLNkFQjWp95CdddnyBW",
         "fee": 100000,
         "timestamp": 1479313097422,
         "signature": "4XE4M9eSoVWVdHwDYXqZsXhEc4q8PH9mDMUBegCSBBVHJyP2Yb1ZoGi59c1Qzq2TowLmymLNkFQjWp95CdddnyBW",
         "sender": "3NBVqYXrapgJP9atQccdBPAgJPwHDKkh6A8",
         "senderPublicKey": "CRxqEuxhdZBEHX42MU4FfyJxuHmbDBTaHMhM3Uki7pLw",
         "recipient": "3N9iRMou3pgmyPbFZn5QZQvBTQBkL2fR6R1",
         "amount": 1000000000
       }
     ]
   ]

GET /transactions/unconfirmed
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Возвращает все неподтвержденные транзакции из utx-pool ноды.

**Ответ метода:**

.. code:: js

   [
     {
       "type": 4,
       "id": "52GG9U2e6foYRKp5vAzsTQ86aDAABfRJ7synz7ohBp19",
       "sender": "3NBVqYXrapgJP9atQccdBPAgJPwHDKkh6A8",
       "senderPublicKey": "CRxqEuxhdZBEHX42MU4FfyJxuHmbDBTaHMhM3Uki7pLw",
       "recipient": "3NBVqYXrapgJP9atQccdBPAgJPwHDKkh6A8",
       "assetId": "E9yZC4cVhCDfbjFJCc9CqkAtkoFy5KaCe64iaxHM2adG",
       "amount": 100000,
       "feeAsset": null,
       "fee": 100000,
       "timestamp": 1479313236091,
       "attachment": "string",
       "signature": "GknccUA79dBcwWgKjqB7vYHcnsj7caYETfncJhRkkaetbQon7DxbpMmvK9LYqUkirJp17geBJCRTNkHEoAjtsUm"
     }
   ]

POST /transactions/calculateFee
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Расчитывет размер комиссии по переданной транзакции.

**Параметры запроса**

::

   "type" - Transaction type
   "senderPublicKey" - Public key of sender
   "sender" is ignилиed
   "fee" is ignилиed
   and all the other parameters appropriate fили a transaction of the given type.

**Запрос метода**

.. code:: js

   {
    "type": 10,
    "timestamp": 1516171819000,
    "sender": "3MtrNP7AkTRuBhX4CBti6iT21pQpEnmHtyw",
    "alias": "ALIAS",
   }

или

.. code:: js

   {
     "type": 4,
     "sender": "3MtrNP7AkTRuBhX4CBti6iT21pQpEnmHtyw",
     "recipient": "3P8JYPHrnXSfsWP1LVXySdzU1P83FE1ssDa",
     "amount": 1317209272,
     "feeAssetId": "8LQW8f7P5d5PZM7GtZEBgaqRPGSzS3DfPuiXrURJ4AJS",
     "attachment": "string"
   }

**Ответ метода**

.. code:: js

   {
     "feeAssetId": null,
     "feeAmount": 10000
   }

или

.. code:: js

   {
     "feeAssetId": "8LQW8f7P5d5PZM7GtZEBgaqRPGSzS3DfPuiXrURJ4AJS",
     "feeAmount": 10000
   }

POST /transactions/sign
~~~~~~~~~~~~~~~~~~~~~~~

.. figure:: https://img.shields.io/badge/API--KEY-required-red.svg

Подписывает транзакцию закрытым ключем отправителя, сохраненным в keystore ноды.

**Примеры запросов**

.. code:: js

   {
    "type": 10,
    "timestamp": 1516171819000,
    "sender": "3MtrNP7AkTRuBhX4CBti6iT21pQpEnmHtyw",
    "fee": 100000,
    "alias": "ALIAS",
   }

или

.. code:: js

   {
     "type": 4,
     "sender": "3MtrNP7AkTRuBhX4CBti6iT21pQpEnmHtyw",
     "recipient": "3P8JYPHrnXSfsWP1LVXySdzU1P83FE1ssDa",
     "amount": 1317209272,
     "fee": 100000,
     "attachment": "string"
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


POST /transactions/broadcast
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Отправляет подписанную транзакцию в блокчейн.

**Запрос метода**

.. code:: js

   {
    "type":10,
    "senderPublicKey":"G6h72icCSjdW2A89QWDb37hyXJoYKq3XuCUJY2joS3EU",
    "fee":100000000,
    "timestamp":46305781705234713,
    "signature":"4gQyPXzJFEzMbsCd9u5n3B2WauEc4172ssyrXCL882oNa8NfNihnpKianHXrHWnZs1RzDLbQ9rcRYnSqxKWfEPJG",
    "alias":"dajzmj6gfuzmbfnhamsbuxivc"
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

GET /transactions/address/{address}/limit/{limit}?after={after}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Возвращает список транзакций, в которых в качестве одного из адресатов указан {address}.