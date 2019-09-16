.. _pki-api:

PKI
======

В PKI используются форматы ЭП, представленные в таблице ниже. Номер формата ЭП из таблицы соответствует значению поля ``sigtype``.

.. list-table:: Форматы ЭП
   :widths: 10 30
   :header-rows: 1

   * - №
     - Формат ЭП
   * - 1
     - CAdES-BES
   * - 2
     - CAdES-X Long Type 1
   * - 3
     - CAdES-T

POST /pki/sign
~~~~~~~~~~~~~~~~~~~~

.. hint:: Правила формирования запросов к ноде приведены в разделе :ref:`rest-api-node`.

Метод формирует отсоединённую ЭП для данных, передаваемых в запросе. В данном запросе ``inputData`` - это данные для формирования ЭП в виде массива байт в кодировке **Base64**, ``keystoreAlias`` - это наименование ключевого контейнера закрытого ключа ЭП. Также необходимо указать пароль от ключевого контейнера в параметре ``password``.

**Пример запроса**

.. code::

    {
     "inputData" : "SGVsbG8gd29ybGQh",
     "keystoreAlias" : "key1",
     "password" : "password",
     "sigType" : 1,
     }

**Пример ответа**

.. code::

    {
      "signature" : "c2RmZ3NkZmZoZ2ZkZ2hmZGpkZ2ZoamhnZmtqaGdmamtkZmdoZmdkc2doZmQjsndjfvnksdnjfn="
     }

POST /pki/verify
~~~~~~~~~~~~~~~~~~~~~~~~~

Метод выполняет проверку отсоединённой ЭП для данных, переданных в запросе. Поле ``extendedKeyUsageList`` является опциональным и может содержать массив значений OID (Объектный идентификатор) для определения области действия сертификата. Проверку сертификата может осуществлять любая нода, имеющая параметры запроса.

**Пример запроса**

.. code::

    {
     "inputData" : "SGVsbG8gd29ybGQh",
     "signature" : "c2RmZ3NkZmZoZ2ZkZ2hmZGpkZ2ZoamhnZmtqaGdmamtkZmdoZmdkc2doZmQjsndjfvnksdnjfn=",
     "sigType" : 1,
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

