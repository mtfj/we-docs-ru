.. _contracts:

Contracts
==========

.. hint:: Правила формирования запросов к ноде приведены в разделе :ref:`rest-api-node`.

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

http://localhost:6862/contracts/executed-tx-for/EURCnUgZLwUD4ee74VucDGVTCbUtNeRMmfb5q1NeEGjy

**Ответ метода:**

.. code:: js

  {
    "type" : 105,
    "id" : "Z14JL9UFU5xrmApxDb1We5PqZrXKJ4zw74WA58vY9YE",
    "sender" : "3FQyQ1nSXtyEfBrFr6GxfNtEKWdtVNKWdPu",
    "senderPublicKey" : "5LiQqduJQWCHNP9qvFhCHYi2tvCQP8Pv4LVWt2p5vYzBWXcEGQLJCaWiJwkt95EtLssb1byhWB3bZ3G1d66ToyxU",
    "fee" : 500000,
    "timestamp" : 1545835915772,
    "proofs" : [ "3vieAtXU4ZVz5C7xJ4dsxhQv7ELN2JsX2v2dr5r63GmxJLMmgC7pozSjYMDo8b5esUsFB6xP1MAmGsX8rrp9Wk6B" ],
    "version" : 1,
    "tx" : {
      "type" : 104,
      "id" : "EURCnUgZLwUD4ee74VucDGVTCbUtNeRMmfb5q1NeEGjy",
      "sender" : "3FQyQ1nSXtyEfBrFr6GxfNtEKWdtVNKWdPu",
      "senderPublicKey" : "5LiQqduJQWCHNP9qvFhCHYi2tvCQP8Pv4LVWt2p5vYzBWXcEGQLJCaWiJwkt95EtLssb1byhWB3bZ3G1d66ToyxU",
      "fee" : 500000,
      "timestamp" : 1545835858447,
      "proofs" : [ "5YgpJDJzLxdYiwpYupU4fmzj3ywj6GmfkHdyaicayevq4zsTqcLYSwTUtYazvfXcDQCCVrytpmT8uCe4sto3Qkck" ],
      "version" : 1,
      "contractId" : "DkUTuWehJXvZMj44GT81KbhXhvsJnyPDCi4eW9BbrH3s",
      "params" : [ ]
    },
    "results" : [ {
      "key" : "updated",
      "type" : "integer",
      "value" : 1545835909
    }, {
      "key" : "buy_price",
      "type" : "string",
      "value" : "3842"
    } ]
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