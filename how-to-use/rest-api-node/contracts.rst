.. _contracts:

Contracts
==========

.. hint:: Правила формирования запросов к ноде приведены в разделе :ref:`rest-api-node`.

GET /contracts
~~~~~~~~~~~~~~~~~~~~~

Возвращает информацию по контрактам.

**Ответ метода**

.. code:: js

   [
     {
       "contractId": "dmLT1ippM7tmfSC8u9P4wU6sBgHXGYy6JYxCq1CCh8i",
       "image": "registry.wvservices.com/wv-sc/may14_1:latest",
       "imageHash": "ff9b8af966b4c84e66d3847a514e65f55b2c1f63afcd8b708b9948a814cb8957",
       "version": 1,
       "active": false
      }
    ]

POST /contracts
~~~~~~~~~~~~~~~~~~~~~~~

Возвращает некоторые параметры по одному или нескольким заданным в запросе идентификаторам контрактов.

**Ответ метода**

.. code:: js

   {
     "8vBJhy4eS8oEwCHC3yS3M6nZd5CLBa6XNt4Nk3yEEExG": [
      {
      "type": "string",
      "value": "Only description",
      "key": "Description"
      },
      {
      "type": "integer",
      "value": -9223372036854776000,
      "key": "key_may"
      }
     ]
    }

GET /contracts/status/{id}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Возвращает статус исполняемой транзакции по контракту.

**Ответ метода**

.. code:: js
  
   [
     {
       "sender": "3GLWx8yUFcNSL3DER8kZyE4TpyAyNiEYsKG",
       "senderPublicKey": "4WnvQPit2Di1iYXDgDcXnJZ5yroKW54vauNoxdNeMi2g",
       "txId": "4q5Q8vLeGBpcdQofZikyrrjHUS4pB1AB4qNEn2yHRKWU",
       "status": "Success",
       "code": null,
       "message": "Smart contract transaction successfully mined",
       "timestamp": 1558961372834,
       "signature": "4gXy7qtzkaHHH6NkksnZ5pnv8juF65MvjQ9JgVztpgNwLNwuyyr27Db3gCh5YyADqZeBH72EyAkBouUoKvwJ3RQJ"
      },
      }
        "sender": "3GLWx8yUFcNSL3DER8kZyE4TpyAyNiEYsKG",
        "senderPublicKey": "4WnvQPit2Di1iYXDgDcXnJZ5yroKW54vauNoxdNeMi2g",
        "txId": "4q5Q8vLeGBpcdQofZikyrrjHUS4pB1AB4qNEn2yHRKWU",
        "status": "Success",
        "code": null,
        "message": "Smart contract transaction successfully mined",
        "timestamp": 1558961376012,
        "signature": "3Vhqc9DvNhMvFFtWnBuV4XwQ62ZcTAvLNZYmeGc7mGzMcnGZ3RLshDs393fnQu1WTh8CmL58YnvnjyULEEi5yorV"
      }
    ]

GET /contracts/{contractId}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Возвращает результат исполнения смарт-контракта по его идентификатору (id транзакции создания контракта).

.. **Пример запроса**
    http://localhost:6862/contracts/DkUTuWehJXvZMj44GT81KbhXhvsJnyPDCi4eW9BbrH3s

**Ответ метода:**

.. code:: js

  [
    {
      "key": "avg",
      "type": "string",
      "value": "3897.80146957"
    },
    {
      "key": "buy_price",
      "type": "string",
      "value": "3842"
    }
  ]


GET /contracts/executed-tx-for/{id}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Возвращает результат исполнения смарт-контракта по идентификатору транзакции исполнения контракта.

.. **Пример запроса**
    http://localhost:6862/contracts/executed-tx-for/2sqPS2VAKmK77FoNakw1VtDTCbDSa7nqh5wTXvJeYGo2

**Ответ метода:**

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
        "id": "ULcq9R7PvUB2yPMrmBdxoTi3bcRmQPT3JDLLLZVj4Ky",
        "sender": "3N3YTj1tNwn8XUJ8ptGKbPuEFNa9GFnhqew",
        "senderPublicKey": "3kW7vy6nPC59BXM67n5N56rhhAv38Dws5skqDsjMVT2M",
        "fee": 500000,
        "timestamp": 1550591678479,
        "proofs": [ "yecRFZm9iBLyDy93bDVaNo1PR5Qkkic7196GAgUt9TNH1cnQphq4yGQQ8Fxj4BYA4TaqYVw5qxtWzGMPQyVeKYv" ], 
        "version": 1, 
        "image": "stateful-increment-contract:latest", 
        "imageHash": "7d3b915c82930dd79591aab040657338f64e5d8b842abe2d73d5c8f828584b65",
        "contractName": "stateful-increment-contract",
        "params": [], 
        "height": 1619
    },
    "results": []
  }

GET /contracts/{contractId}/{key}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Возвращает значение исполнения смарт-контракта по его идентификатору (id транзакции создания контракта) и ключу {key}.

.. **Пример запроса**
    http://localhost:6862/contracts/DkUTuWehJXvZMj44GT81KbhXhvsJnyPDCi4eW9BbrH3s/updated

**Ответ метода:**

.. code:: js

  {
    "key": "updated",
    "type": "integer",
    "value": 1545835909
  }

