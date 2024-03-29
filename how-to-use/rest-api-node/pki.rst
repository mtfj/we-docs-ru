.. _pki-api:

PKI
======

.. warning:: Методы PKI работают только с ГОСТ-криптографией.

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
     "sigType" : "CAdES_X_Long_Type_1",
     }

**Пример ответа**

    .. code::

      {
        "signature" : "c2RmZ3NkZmZoZ2ZkZ2hmZGpkZ2ZoamhnZmtqaGdmamtkZmdoZmdkc2doZmQjsndjfvnksdnjfn="
       }

GET ​/pki​/keystoreAliases
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Метод возвращает список всех keystore-алиасов на ГОСТ-криптографии.

**Пример ответа**

    .. code::
        
        {
         [
          "3Mq9crNkTFf8oRPyisgtf4TjBvZxo4BL2ax",
          "e19a135e-11f7-4f0c-9109-a3d1c09812e3"
         ]
         }


POST /pki/verify
~~~~~~~~~~~~~~~~~~~~~~~~~

Метод выполняет проверку УКЭП для данных, переданных в запросе. Поле ``extendedKeyUsageList`` является опциональным и может содержать массив значений OID (Объектный идентификатор) для определения области действия сертификата. Проверку сертификата может осуществлять любая нода, имеющая параметры запроса.

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

.. _working-pki:

Работа с методом POST /pki/verify
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Нода имеет возможность проверять УКЭП (Усиленная квалифицированная электронная подпись), используя метод API :ref:`Post /pki/verify <pki-api>`. Для корректности работы метода API :ref:`Post /pki/verify <pki-api>` необходимо установить корневой сертификат на ноду. Корневой сертификат УЦ однозначно идентифицирует центр сертификации и является основанием в цепочке доверия.

Как установить корневой сертификат на ноду
-------------------------------------------

Корневой сертификат устанавливается в следующую папку со средой Java:

    ::

      -keystore /Library/Java/JavaVirtualMachines/jdk1.8.0_191.jdk/Contents/Home/jre/lib/security/cacerts

Пароль по умолчанию на хранилище сертификатов Java cacerts - ``changeit``. При желании вы можете изменить пароль. Установка сертификатов выполняется следующей командой:

    ::

      sudo keytool -import -alias testAliasCA_cryptopro -keystore /Library/Java/JavaVirtualMachines/jdk1.8.0_191.jdk/Contents/Home/jre/lib/security/cacerts -file ~/Downloads/cert.cer





