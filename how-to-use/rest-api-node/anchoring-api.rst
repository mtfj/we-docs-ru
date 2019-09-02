.. _anchoring-api:

Anchoring
=============

GET /anchoring/config
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. hint:: Правила формирования запросов к ноде приведены в разделе :ref:`rest-api-node`.

Получение секции :ref:`анкоринга <anchoring-settings>` конфигурационного файла ноды.

**Ответ метода**

.. code:: js

   {
  "enabled": true,
  "currentChainOwnerAddress": "3FWwx4o1177A4oeHAEW5EQ6Bkn4Lv48quYz",
  "mainnetNodeAddress": "https://clinton-pool.vostokservices.com:443",
  "mainnetSchemeByte": "L",
  "mainnetRecipientAddress": "3JzVWCSV6v4ucSxtGSjZsvdiCT1FAzwpqrP",
  "mainnetFee": 8000000,
  "currentChainFee": 666666,
  "heightRange": 5,
  "heightAbove": 3,
  "threshold": 10
   } 

