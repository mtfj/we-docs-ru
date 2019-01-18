Transactions
=============

.. hint:: Правила формирования запросов к ноде приведены в разделе :ref:`rest-api-node`. Посмотреть :ref:`примеры <transaction-example>` транзакций.
   
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

GET /transactions/unconfirmed/size
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Возвращает количество транзакций, находящихся в UTX-пуле.

GET /unconfirmed/info/{id}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Запрос сведений по транзакции из UTX-пула по ее ID.


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

Подписывает транзакцию закрытым ключем отправителя, сохраненным в keystore ноды. После подписания ответ метода должен быть подан на вход метода :ref:`Broadcast <broadcast>`

**Примеры запросов**

========= ===================
ID        Тип транзакции                                                                                                                        
========= ===================
3         :ref:`Issue <tx-issue>`          
4         :ref:`Transfer <tx-transfer>`
5         Reissue             
6         Burn                
7         Exchange            
8         Lease                
9         Lease Cancel        
10        :ref:`Alias <tx-alias>`              
11        Mass Transfer        
12        :ref:`Data <tx-data>`                
13        :ref:`Set Script <tx-setscript>`           
14        Set Sponsorship     
101       Permission (for Genesis block)  
102       :ref:`Permission <tx-permission>`   
========= =================== 

.. _tx-issue:

**3. Issue**

.. code:: js

   { 
      "type": 3,
      "name": "Test Asset 1",
      "quantity": 100000000000,
      "description": "Some description",
      "sender": "3FSCKyfFo3566zwiJjSFLBwKvd826KXUaqR",
      "decimals": 8,
      "reissuable": true,
      "fee": 100000000
   }

.. _tx-transfer:

**4. Transfer**

.. code:: js

   {
     "type": 4,
     "sender": "3MtrNP7AkTRuBhX4CBti6iT21pQpEnmHtyw",
     "recipient": "3P8JYPHrnXSfsWP1LVXySdzU1P83FE1ssDa",
     "amount": 1317209272,
     "fee": 100000,
     "attachment": "string"
   }

.. _tx-alias:

**10. Alias**

.. code:: js

   {
      "type": 10,
      "timestamp": 1516171819000,
      "sender": "3MtrNP7AkTRuBhX4CBti6iT21pQpEnmHtyw",
      "fee": 100000,
      "alias": "ALIAS",
   }

.. _tx-data:

**12. Data**

.. code:: js

   {
      "type": 12,
      "version": 1,
      "sender": "3PHxBMyy2RvW6Z6uFKJ8VpXM1id4QptAwN2",
      "password": "1234",
      "data": [
         {
         "key": "objectId",
         "type": "string",
         "value": "obj:123:1234"
         }
      ],
      "fee": 100000 
   }

.. _tx-setscript:

**13. Set Script**

.. code:: js

   {
      "type": 13,
      "version": 1,
      "sender": "3MpPZXBK9pKzRNWALKcQnCt3AiY8DPCXZeq",
      "fee": 1000000,
      "script": "AQQAAAAAAByRtYXRjaDAGB8ueOsI="
   }

.. _tx-permission:

**102. Permission**

.. code:: js

   {
      "type":102,
      "sender":"3HYW75PpAeVukmbYo9PQ3mzSHdKUgEytUUz",
      "target":"3HSVTtjim3FmV21HWQ1LurMhFzjut7Aa1Ac",

      # Тип полномочий, которые требуется установить или удалить. Возможные значения: "miner", "issuer", "dex", "permissioner", "blacklister", "banned"
      "role":"miner",

      # Тип операции "add" (добавить полномочия) или "remove" (удалить полномочия)
      "opType”:"add",

      # Дата действия permission
      "dueTimestamp":1528975127294
   }


**Пример ответа метода**

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

.. _broadcast:

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