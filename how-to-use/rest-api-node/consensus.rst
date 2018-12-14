Consensus
==========

.. sidebar:: REST API

   Правила формирования запросов к ноде приведены в разделе :ref:`rest-api-node`.
   
GET /consensus/algo
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Возвращает тип алгоритма консенсуса, используемый в сети.

**Ответ метода:**

.. code:: js

    {
        "consensusAlgo": "Fair Proof-of-Stake (FairPoS)"
    }

GET /consensus/basetarget/{blockId}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Возвращает значение `базовой сложности`_ (basetarget) создания блока {blockId}.

GET /consensus/basetarget
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Возвращает значение `базовой сложности`_ (basetarget) создания последнего блока.

GET /consensus/generatingbalance/{address}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Возвращает генерирующий баланс доступный для майниновой ноды {address} - минимальный баланс участинка, включая средства переденные участнику за лизинг, за последние 1000 блоков.

GET /consensus/generationsignature/{blockId}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Возвращает значение `генерирующей подписи`_ (generation signature) создания блока {blockId}.

GET /consensus/generationsignature
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Возвращает значение `генерирующей подписи`_ (generation signature) последнего блока.

.. _`базовой сложности`: https://forum.wavesplatform.com/uploads/default/original/2X/7/7397a4cb5fa77d659a7b7ecc9188dd0a4fe0decc.pdf
.. _`генерирующей подписи`: https://forum.wavesplatform.com/uploads/default/original/2X/7/7397a4cb5fa77d659a7b7ecc9188dd0a4fe0decc.pdf