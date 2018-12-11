Alias
===========

GET /alias/by-alias/{alias}
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Получает адрес участника по его {alias} псевдониму.

**Ответ метода**

.. code:: js

   {

   "address": "address:3Mx2afTZ2KbRrLNbytyzTtXukZvqEB8SkW7"

   }

GET /alias/by-address/{address}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Получает {alias} псевдоним участника по его адрес {address}.

**Ответ метода**

.. code:: js

   [

   "alias:HUMANREADABLE1",
   "alias:HUMANREADABLE2",
   "alias:HUMANREADABLE3",

   ]
