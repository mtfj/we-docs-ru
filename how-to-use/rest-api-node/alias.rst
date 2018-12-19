Alias
===========

.. hint:: Правила формирования запросов к ноде приведены в разделе :ref:`rest-api-node`.
   
GET /alias/by-alias/{alias}
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Получает адрес участника по его псевдониму {alias}.

**Ответ метода**

.. code:: js

   {

        "address": "address:3Mx2afTZ2KbRrLNbytyzTtXukZvqEB8SkW7"

   }

GET /alias/by-address/{address}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Получает {alias} псевдоним участника по его адресу {address}.

**Ответ метода**

.. code:: js

    [
        "alias:HUMANREADABLE1",
        "alias:HUMANREADABLE2",
        "alias:HUMANREADABLE3",
    ]
