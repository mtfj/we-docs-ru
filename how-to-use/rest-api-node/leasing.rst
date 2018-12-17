Leasing
===========

.. sidebar:: REST API

   Правила формирования запросов к ноде приведены в разделе :ref:`rest-api-node`.
   
GET /leasing/active/{address}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Возвращает список транзакций создания лизинга, в которых принимал участие {address}, как отправитель или получатель.

**Ответ метода:**

.. code:: js

  [
    {
      "type": 8,
      "id": "2jWhz6uGYsgvfoMzNR5EEGdi9eafyCA2zLFfkM4NP6T7",
      "sender": "3PP6vdkEWoif7AZDtSeSDtZcwiqSfhmwttE",
      "senderPublicKey": "DW9NKLYeyoEWDqJKhWv87EdFfTqpFtJBWoCqfCVwRhsY",
      "fee": 100000,
      "timestamp": 1544390280347,
      "signature": "25kpwh7nYjRUtfbAbWYRyMDPCUCoyMoUuWTJ6vZQrXsZYXbdiWHa9iGscTTGnPFyegP82sNSfM2bXNX3K7p6D3HD",
      "version": 1,
      "amount": 31377465877,
      "recipient": "3P3RD3yJW2gQ9dSVwVVDVCQiFWqaLtZcyzH",
      "height": 1298747
    }
  ]

.. code-block:: json

  [
    {
      "type": 8,
      "id": "2jWhz6uGYsgvfoMzNR5EEGdi9eafyCA2zLFfkM4NP6T7",
      "sender": "3PP6vdkEWoif7AZDtSeSDtZcwiqSfhmwttE",
      "senderPublicKey": "DW9NKLYeyoEWDqJKhWv87EdFfTqpFtJBWoCqfCVwRhsY",
      "fee": 100000,
      "timestamp": 1544390280347,
      "signature": "25kpwh7nYjRUtfbAbWYRyMDPCUCoyMoUuWTJ6vZQrXsZYXbdiWHa9iGscTTGnPFyegP82sNSfM2bXNX3K7p6D3HD",
      "version": 1,
      "amount": 31377465877,
      "recipient": "3P3RD3yJW2gQ9dSVwVVDVCQiFWqaLtZcyzH",
      "height": 1298747
    }
  ]