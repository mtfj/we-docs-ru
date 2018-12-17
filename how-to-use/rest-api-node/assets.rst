Assets
=========

.. sidebar:: REST API

   Правила формирования запросов к ноде приведены в разделе :ref:`rest-api-node`.
   
GET /assets/balance/{address}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Возвращает баланс всех ассетов адресата {address}.

**Ответ метода:**

.. code:: js

   {
     "address": "3Mv61qe6egMSjRDZiiuvJDnf3Q1qW9tTZDB",
     "balances": [
       {
         "assetId": "Ax9T4grFxx5m3KPUEKjMdnQkCKtBktf694wU2wJYvQUD",
         "balance": 4879179221,
         "quantity": 48791792210,
         "reissuable": true,
         "minSponsoredAssetFee" : 100,
         "sponsorBalance" : 1233221,
         "issueTransaction" : {
            "type" : 3,
            ...
         }
       },
       {
         "assetId": "49KfHPJcKvSAvNKwM7CTofjKHzL87SaSx8eyADBjv5Wi",
         "balance": 10,
         "quantity": 10000000000,
         "reissuable": false,
         "issueTransaction" : {
            "type" : 3,
            ...
         }
       }
     ]
   }

**Параметры метода:**

- "address" -  адрес участника
- "balances" - объект с балансами участника
- "assetId" - ассет ID
- "balance" - баланс ассета
- "quantity" - кол-во выпущенных ассетов
- "reissuable" - признак может быть ассет перевыпущен или нет
- "issueTransaction" - транзакция создания ассета
- "minSponsoredAssetFee" - минимальное значение коммиссии для спонсорских транзакций
- "sponsorBalance" - средства, выделенные для оплаты транзакций по спонсируемым ассетам

GET /assets/balance/{address}/{assetId}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Возвращает баланс адресата {address} по ассету {assetId}.

**Ответ метода:**

.. code:: js

   {
     "address": "3Mv61qe6egMSjRDZiiuvJDnf3Q1qW9tTZDB",
     "assetId": "Ax9T4grFxx5m3KPUEKjMdnQkCKtBktf694wU2wJYvQUD",
     "balance": 4879179221
   }

GET /assets/details/{assetId}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Возвращает описание ассета {assetId}.

**Ответ метода:**

.. code:: js

   {
     "assetId" : "8tdULCMr598Kn2dUaKwHkvsNyFbDB1Uj5NxvVRTQRnMQ",
     "issueHeight" : 140194,
     "issueTimestamp" : 1504015013373,
     "issuer" : "3NCBMxgdghg4tUhEEffSXy11L6hUi6fcBpd",
     "name" : "name",
     "description" : "Sponsored asset",
     "decimals" : 1,
     "reissuable" : true,
     "quantity" : 1221905614,
     "script" : null,
     "scriptText" : null,
     "complexity" : 0,
     "extraFee": 0,
     "minSponsoredAssetFee" : 100000 // null assume no sponsorship, number - amount of assets for minimal fee
   }



GET /assets/{assetId}/distribution
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Возвращает распределение ассета {assetId}.

**Ответ метода:**

.. code:: js

  {
    "3P8GxcTEyZtG6LEfnn9knp9wu8uLKrAFHCb": 1,
    "3P2voHxcJg79csj4YspNq1akepX8TSmGhTE": 1200
  }