.. _pki-api:

PKI
======

POST /pki/sign
~~~~~~~~~~~~~~~~~~~~

.. hint:: Правила формирования запросов к ноде приведены в разделе :ref:`rest-api-node`.

Метод формирует отсоединённую ЭП для данных, передаваемых в запросе.

**Пример запроса**

.. code::

    {
     "inputData" : "SGVsbG8gd29ybGQh",
     "keystoreAlias" : "key1",
     "password" : "password",
     "sigType" : "CAdES_X_Long_Type_1",
     }

**Пример ответа**

.. code::
    {
      "signature" : "c2RmZ3NkZmZoZ2ZkZ2hmZGpkZ2ZoamhnZmtqaGdmamtkZmdoZmdkc2doZmQjsndjfvnksdnjfn="
     }

POST /pki/verify
~~~~~~~~~~~~~~~~~~~~~~~~~

Метод выполняет проверку отсоединённой ЭП для данных, переданных в запросе.

**Пример запроса**

.. code::

    {
     "inputData" : "SGVsbG8gd29ybGQh",
     "signature" : "c2RmZ3NkZmZoZ2ZkZ2hmZGpkZ2ZoamhnZmtqaGdmamtkZmdoZmdkc2doZmQ=",
     "sigType" : "CAdES_X_Long_Type_1",
     "extendedKeyUsageList": [
     "1.2.643.7.1.1.1.1",
     "1.2.643.2.2.35.2"
     ]
     }

**Пример ответа**

.. code::
    {
     "sigStatus" : "true"
     }







