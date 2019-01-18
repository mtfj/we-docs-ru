Consensus
==========

.. hint:: Правила формирования запросов к ноде приведены в разделе :ref:`rest-api-node`.
   
GET /consensus/algo
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Возвращает тип алгоритма консенсуса, используемый в сети.

**Ответ метода:**

.. code:: js

    {
        "consensusAlgo": "Fair Proof-of-Stake (FairPoS)"
    }

GET /consensus/settings
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Возвращает параметры консенсуса, заданные в конфигурационном файле ноды.

**Ответ метода:**

.. code:: js

    {
        "consensusAlgo": "Proof-of-Authority (PoA)",
        "roundDuration": "25 seconds",
        "syncDuration": "5 seconds",
        "banDurationBlocks": 50,
        "warningsForBan": 3
    }


GET /consensus/minersAtHeight/{height}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Возвращает очередь майнеров на высоте {height}.

**Ответ метода:**

.. code:: js

    {
    "miners": [
        "3Mx5sDq4NXef1BRzJRAofa3orYFxLanxmd7",
        "3N2EsS6hJPYgRn7WFJHLJNnrsm92sUKcXkd",
        "3N2cQFfUDzG2iujBrFTnD2TAsCNohDxYu8w",
        "3N6pfQJyqjLCmMbU7G5sNABLmSF5aFT4KTF",
        "3NBbipRYQmZFudFCoVJXg9JMkkyZ4DEdZNS"
    ],
    "height": 1
    }

GET /consensus/miners/{timestamp}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Возвращает очередь майнеров на время {timestamp}.

**Ответ метода:**

.. code:: js

    {
        "miners": [
            "3Mx5sDq4NXef1BRzJRAofa3orYFxLanxmd7",
            "3N2EsS6hJPYgRn7WFJHLJNnrsm92sUKcXkd",
            "3N2cQFfUDzG2iujBrFTnD2TAsCNohDxYu8w",
            "3N6pfQJyqjLCmMbU7G5sNABLmSF5aFT4KTF",
            "3NBbipRYQmZFudFCoVJXg9JMkkyZ4DEdZNS"
        ],
        "timestamp": 1547804621000
    }

GET /consensus/bannedMiners/{height}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Возвращает список заблокированных майнеров на высоте {height}.


**Ответ метода:**

.. code:: js

    {
        "bannedMiners": [],
        "height": 1000
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


