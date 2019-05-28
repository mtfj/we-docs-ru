.. _contracts:

Contracts
==========

.. important:: Функциональность Docker-контрактов доступна начиная с релиза версии 0.8.

.. hint:: Правила формирования запросов к ноде приведены в разделе :ref:`rest-api-node`.

GET /contracts
~~~~~~~~~~~~~~~~~~~~~

Возвращает информацию по контрактам.

**Ответ метода**

.. code:: js
   [
     {
       "contractId": "dmLT1ippM7tmfSC8u9P4wU6sBgHXGYy6JYxCq1CCh8i",
       "image": "registry.vostokservices.com/vostok-sc/may14_1:latest",
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
      "dmLT1ippM7tmfSC8u9P4wU6sBgHXGYy6JYxCq1CCh8i": [
        {
          "type": "string",
          "value": "11",
          "key": "11"
        },
        {
          "type": "string",
          "value": "Only description",
          "key": "Description"
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

**Пример запроса**

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

**Пример запроса**

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
  


GET /contracts/{contractId}/{key}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Возвращает значение исполнения смарт-контракта по его идентификатору (id транзакции создания контракта) и ключу {key}.

**Пример запроса**

http://localhost:6862/contracts/DkUTuWehJXvZMj44GT81KbhXhvsJnyPDCi4eW9BbrH3s/updated

**Ответ метода:**

.. code:: js

  {
    "key": "updated",
    "type": "integer",
    "value": 1545835909
  }