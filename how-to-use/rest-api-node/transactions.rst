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
   "sender" is ignored
   "fee" is ignored
   and all the other parameters appropriate for a transaction of the given type.

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

.. figure:: https://img.shields.io/badge/password-optional-orange.svg

Подписывает транзакцию закрытым ключом отправителя, сохраненным в keystore ноды. После подписания ответ метода должен быть подан на вход метода :ref:`Broadcast <broadcast>`.

Для подписания запросов ключом из keystore ноды требуется обязательное указание пароля в поле ``password``.

**Примеры запросов**

========= ==================================================
ID        Тип транзакции                                                                                                                        
========= ==================================================
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
102       :ref:`PermissionTransaction <tx-permission>`
103       :ref:`CreateContractTransaction <tx-CreateContractTransaction>`
104       :ref:`CallContractTransaction <tx-CallContractTransaction>` 
105       :ref:`ExecutedContractTransaction <tx-ExecutedContractTransaction>` 
106       :ref:`DisableContractTransaction <tx-DisableContractTransaction>` 
107       :ref:`UpdateContractTransaction <tx-UpdateContractTransaction>`  
========= ==================================================

.. _tx-issue:

**3. Issue**

.. code:: js

   { 
      "type": 3,
      "version":2,
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
      "version": 2,
      "sender": "3MtrNP7AkTRuBhX4CBti6iT21pQpEnmHtyw",
      "recipient": "3P8JYPHrnXSfsWP1LVXySdzU1P83FE1ssDa",
      "amount": 1317209272,
      "fee": 100000,
   }

.. _tx-alias:

**10. Alias**

.. code:: js

   { 
      "type": 10, 
      "version": 2, 
      "fee": 100000, 
      "sender": "3N9vL3apA4j2L5PojHW8TYmfHx9Lo2ZaKPB",         
      "alias": "hodler" 
   }

.. _tx-data:

**12. Data**

.. code:: js

   {
      "type": 12,
      "version": 1,
      "sender": "3N9vL3apA4j2L5PojHW8TYmfHx9Lo2ZaKPB",
      "senderPublicKey": "Fbt5fKHesnQG2CXmsKf4TC8v9oB7bsy2AY56CUopa6H3",
      "author": "3N9vL3apA4j2L5PojHW8TYmfHx9Lo2ZaKPB",
      "data": 
      [
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
      "sender": "3N9vL3apA4j2L5PojHW8TYmfHx9Lo2ZaKPB",
      "fee": 1000000,
      "name": "faucet",
      "script": "base64:AQQAAAAHJG1hdGNoMAUAAAACdHgG+RXSzQ=="
   }

.. _tx-permission:

**102. PermissionTransaction**

**Пример запроса**

.. code:: js

   {
      "type":102,
      "sender":"3HYW75PpAeVukmbYo9PQ3mzSHdKUgEytUUz",
      "target":"3HSVTtjim3FmV21HWQ1LurMhFzjut7Aa1Ac",
      "role":"miner",
      "opType":"add",
      "dueTimestamp":1528975127294
   }


.. _tx-CreateContractTransaction:

**103. CreateContractTransaction**

**Пример запроса**

.. code:: js

   {
      "type": 103,
      "sender":"3PKyW5FSn4fmdrLcUnDMRHVyoDBxybRgP58",
      "image":"localhost:5000/sum-contract-kv",
      "params":[],
      "imageHash": "930d18dacb4f49e07e2637a62115510f045da55ca16b9c7c503486828641d662",
      "fee":500000
   }

**Пример ответа**

.. code:: js

   {
      "type": 103,
      "id": "2sqPS2VAKmK77FoNakw1VtDTCbDSa7nqh5wTXvJeYGo2",
      "sender": "3PKyW5FSn4fmdrLcUnDMRHVyoDBxybRgP58",
      "senderPublicKey": "2YvzcVLrqLCqouVrFZynjfotEuPNV9GrdauNpgdWXLsq",
      "fee": 500000,
      "timestamp": 1549443811183,
      "proofs": [
         "YSomSCKBhQWHKHR8f8ZMp7EzuA6Uouu1oq5WA5VDiZ8o2adL4XMQP3jgccketjGCEpnTnCjm5bABZG486CVR5ZM"
      ],
      "version": 1,
      "image": "localhost:5000/sum-contract-kv",
      "imageHash": "930d18dacb4f49e07e2637a62115510f045da55ca16b9c7c503486828641d662",
      "params": []
   }

.. _tx-CallContractTransaction:

**104. CallContractTransaction**

**Пример запроса**

.. code:: js

   {
      "contractId": "2sqPS2VAKmK77FoNakw1VtDTCbDSa7nqh5wTXvJeYGo2",
      "fee": 10,
      "sender": "3PKyW5FSn4fmdrLcUnDMRHVyoDBxybRgP58",
      "type": 104,
      "version": 1,
      "params": [
         {
               "type": "integer",
               "key": "a",
               "value": 1
         },
         {
               "type": "integer",
               "key": "b",
               "value": 100

         }
      ]
   }

**Пример ответа**

.. code:: js

   {
      "type": 104,
      "id": "9fBrL2n5TN473g1gNfoZqaAqAsAJCuHRHYxZpLexL3VP",
      "sender": "3PKyW5FSn4fmdrLcUnDMRHVyoDBxybRgP58",
      "senderPublicKey": "2YvzcVLrqLCqouVrFZynjfotEuPNV9GrdauNpgdWXLsq",
      "fee": 10,
      "timestamp": 1549365736923,
      "proofs": [
         "2q4cTBhDkEDkFxr7iYaHPAv1dzaKo5rDaTxPF5VHryyYTXxTPvN9Wb3YrsDYixKiUPXBnAyXzEcnKPFRCW9xVp4v"
      ],
      "version": 1,
      "contractId": "2sqPS2VAKmK77FoNakw1VtDTCbDSa7nqh5wTXvJeYGo2",
      "params": [
         {
         "key": "a",
         "type": "integer",
         "value": 1
         },
         {
         "key": "b",
         "type": "integer",
         "value": 100
         }
      ]
   }

.. _tx-ExecutedContractTransaction:

**105. ExecutedContractTransaction**

**Пример ответа**

.. code:: js

   {
      "type": 105,
      "id": "2UAHvs4KsfBbRVPm2dCigWtqUHuaNQou83CXy6DGDiRa",
      "sender": "3PKyW5FSn4fmdrLcUnDMRHVyoDBxybRgP58",
      "senderPublicKey": "2YvzcVLrqLCqouVrFZynjfotEuPNV9GrdauNpgdWXLsq",
      "fee": 500000,
      "timestamp": 1549365523980,
      "proofs": [
         "4BoG6wQnYyZWyUKzAwh5n1184tsEWUqUTWmXMExvvCU95xgk4UFB8iCnHJ4GhvJm86REB69hKM7s2WLAwTSXquAs"
      ],
      "version": 1,
      "tx": {
         "type": 103,
         "id": "2sqPS2VAKmK77FoNakw1VtDTCbDSa7nqh5wTXvJeYGo2",
         "sender": "3PKyW5FSn4fmdrLcUnDMRHVyoDBxybRgP58",
         "senderPublicKey": "2YvzcVLrqLCqouVrFZynjfotEuPNV9GrdauNpgdWXLsq",
         "fee": 500000,
         "timestamp": 1549365501462,
         "proofs": [
            "2ZK1Y1ecfQXeWsS5sfcTLM5W1KA3kwi9Up2H7z3Q6yVzMeGxT9xWJT6jREQsmuDBcvk3DCCiWBdFHaxazU8pbo41"
         ],
         "version": 1,
         "image": "localhost:5000/contract256",
         "imageHash": "930d18dacb4f49e07e2637a62115510f045da55ca16b9c7c503486828641d662",
         "params": []
      },
      "results": []
   }


.. _tx-DisableContractTransaction:

**106. DisableContractTransaction**

**Пример запроса**

.. code:: js

   {
      "senderPublicKey":"42jj4GA89Z2SncgzpxoocmWZChrpqhDGVKcJUctAGWJB2oSTQrZCQyzbvriDSFu5ZmCBsFutDyg9ES6WqqULyV5e",
      "contractId":"Fz3wqAWWcPMT4M1q6H7crLKtToFJvbeLSvqjaU4ZwMpg",
      "fee":0,
      "timestamp":1549474811381,
      "proofs":[
         "4Dny2XwkXmoLN7emoqdFdjvvKdgnCBuA3XwGgBiWNkZBFXDpRfz36Cyp2CbpjrLBadCnuobbkK5wyM41FGU6yp6h"
      ],
      "type":106
   }

**Пример ответа**

.. code:: js

   {
      "type" : 106,
      "id" : "BwcVQeC9CdmeYxiWydc5NK1MSgqPqQmWYy4PJ6eqZDtP",
      "sender" : "3HhXnbMuZAaCRr9L9hWSKwfNrcDR6CThJVB",
      "senderPublicKey" : "42jj4GA89Z2SncgzpxoocmWZChrpqhDGVKcJUctAGWJB2oSTQrZCQyzbvriDSFu5ZmCBsFutDyg9ES6WqqULyV5e",
      "fee" : 0,
      "timestamp" : 1549474811381,
      "proofs" : [ "4Dny2XwkXmoLN7emoqdFdjvvKdgnCBuA3XwGgBiWNkZBFXDpRfz36Cyp2CbpjrLBadCnuobbkK5wyM41FGU6yp6h" ],
      "version" : 1,
      "contractId" : "Fz3wqAWWcPMT4M1q6H7crLKtToFJvbeLSvqjaU4ZwMpg"
   }

.. _tx-UpdateContractTransaction:

**107. UpdateContractTransaction**

**Пример запроса**

.. code:: js

   {
      "senderPublicKey":"42jj4GA89Z2SncgzpxoocmWZChrpqhDGVKcJUctAGWJB2oSTQrZCQyzbvriDSFu5ZmCBsFutDyg9ES6WqqULyV5e",
      "contractId":"45n2BC8TmobhH7zbog8ZsR1mcHSd1uU84UvWEoSbqQBH",
      "image":"localhost:32858/stateful-increment-contract-updated-1e597b46",
      "imageHash":"9d1cd3482158f541d5494dfbeba915283d01677437f379306635bea28f399ae9",
      "fee":0,
      "timestamp":1549896202125,
      "proofs":[
         "22Xcuz95ei2b3F57SdpdJmWSeifUpjNjgvwg4VHFdxsx3PE4R6f1q1T3ao2HcSCvEyCc2jz4qY4uTLCiyXxzQ4hU"
      ],
      "type":107
   }

**Пример ответа**

.. code:: js

   {
      "type" : 107,
      "id" : "GL8eifYHfv6XcgK1sBnU2oYaJ1JExKHH3APEnU64dGfX",
      "sender" : "3HhXnbMuZAaCRr9L9hWSKwfNrcDR6CThJVB",
      "senderPublicKey" : "42jj4GA89Z2SncgzpxoocmWZChrpqhDGVKcJUctAGWJB2oSTQrZCQyzbvriDSFu5ZmCBsFutDyg9ES6WqqULyV5e",
      "fee" : 0,
      "timestamp" : 1549896202125,
      "proofs" : [ "22Xcuz95ei2b3F57SdpdJmWSeifUpjNjgvwg4VHFdxsx3PE4R6f1q1T3ao2HcSCvEyCc2jz4qY4uTLCiyXxzQ4hU" ],
      "version" : 1,
      "contractId" : "45n2BC8TmobhH7zbog8ZsR1mcHSd1uU84UvWEoSbqQBH",
      "image" : "localhost:32858/stateful-increment-contract-updated-1e597b46",
      "imageHash" : "9d1cd3482158f541d5494dfbeba915283d01677437f379306635bea28f399ae9",
      "height" : 7
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
