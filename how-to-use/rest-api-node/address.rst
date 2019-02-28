Address
============

.. hint:: Правила формирования запросов к ноде приведены в разделе :ref:`rest-api-node`.
   
GET /addresses
~~~~~~~~~~~~~~

Получение всех адресов участников, ключевые пары которых хранятся в keystore ноды.

**Ответ метода:**

.. code:: js

  [
    "3NBVqYXrapgJP9atQccdBPAgJPwHDKkh6A8",
    "3Mx2afTZ2KbRrLNbytyzTtXukZvqEB8SkW7"
  ]

GET /addresses/seq/{from}/{to}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Получение всех адресов участников, ключевые пары которых хранятся в keystore ноды в заданном диапазоне.

**Ответ метода:**

.. code:: js

  [
    "3NBVqYXrapgJP9atQccdBPAgJPwHDKkh6A8",  
    "3Mx2afTZ2KbRrLNbytyzTtXukZvqEB8SkW7"
  ]

GET /addresses/balance/{address}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Получение баланса для адреса {address}.

**Ответ метода:**

.. code:: js

  {
    "address": "3N3keodUiS8WLEw9W4BKDNxgNdUpwSnpb3K",
    "confirmations": 0,
    "balance": 100945889661986
  }

POST /addresses/balance/details
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Получение балансов для списка адресов.

**Запрос метода:**

.. code:: js
  {
    "addresses": [
      "3N65yEf31ojBZUvpu4LCo7n8D73juFtheUJ", "3N11u447zghwj9MemYkrkt9v9xDaMwTY9nG"
    ]
  }

GET /addresses/effectiveBalance/{address}/{confirmations}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Получение баланса для адреса {address} после количества подтверждений >= значению {confirmations}.
Возвращается общий баланс участника, включая средства переданные участнику за лизинг.

**Ответ метода:**

.. code:: js
  {
    "address": "3N65yEf31ojBZUvpu4LCo7n8D73juFtheUJ",
    "confirmations": 1,
    "balance": 0
  }

GET /addresses/balance/details/{address}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Возвращает подробные сведения о балансе адресата {address}.

**Запрос метода:**

.. code:: js

  {
    "addresses": [
      "3N65yEf31ojBZUvpu4LCo7n8D73juFtheUJ"
    ]
  }

**Ответ метода:**

.. code:: js

  [
    {
      "address": "3N65yEf31ojBZUvpu4LCo7n8D73juFtheUJ",
      "regular": 0,
      "generating": 0,
      "available": 0,
      "effective": 0
    }
  ]

**Параметры ответа**

- Regular — общий баланс участника, включая средства переданные в лизинг
- Available — общий баланс участника, за исключением средств переданных в лизинг
- Effective — общий баланс участника, включая средства переданные участнику за лизинг (Available + средства переданные Вам в лизинг)
- Generating — минимальный баланс участинка, включая средства переденные участнику за лизинг, за последние 1000 блоков (используется для майнинга)

GET /addresses/scriptInfo/{address}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Получение данных об установленном скрипте на адресе {address}.

**Ответ метода:**

.. code:: js

  {
    "address": "3N3keodUiS8WLEw9W4BKDNxgNdUpwSnpb3K",
    "script": "3rbFDtbPwAvSp2vBvqGfGR9nRS1nBVnfuSCN3HxSZ7fVRpt3tuFG5JSmyTmvHPxYf34SocMRkRKFgzTtXXnnv7upRHXJzZrLSQo8tUW6yMtEiZ",
    "scriptText": "ScriptV1(BLOCK(LET(x,CONST_LONG(1)),FUNCTION_CALL(FunctionHeader(==,List(LONG, LONG)),List(FUNCTION_CALL(FunctionHeader(+,List(LONG, LONG)),List(REF(x,LONG), CONST_LONG(1)),LONG), CONST_LONG(2)),BOOLEAN),BOOLEAN))",
    "complexity": 11,
    "extraFee": 10001
  }

**Параметры ответа**

- "address" - адрес в формате Base58
- "script" - Base64 представление скрипта
- "scriptText" - исходный код скрипта
- "complexity" - сложность скрипта
- "extraFee" - комиссия за исходящие транзакции, установленные скриптом

POST /addresses/sign/{address}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. figure:: https://img.shields.io/badge/API--KEY-required-red.svg

Возвращает закодированное в формарт Base58 сообщение, подписанное приватным ключом адресата {address}, сохраненным в keystore ноды.
Сообщение сначала подписывается, после этого выполняется преобразование.

**Запрос метода:**

.. code:: js

  {
   "message": "mytext"
  }

**Ответ метода:**

.. code:: js
  {
    "message": "wWshKhJj",
    "publicKey": "C1ADP1tNGuSLTiQrfNRPhgXx59nCrwrZFRV4AHpfKBpZ",
    "signature": "62PFG855ThsEHUZ4N8VE8kMyHCK9GWnvtTZ3hq6JHYv12BhP1eRjegA6nSa3DAoTTMammhamadvizDUYZAZtKY9S"
  }


POST /addresses/verify/{address}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. figure:: https://img.shields.io/badge/API--KEY-required-red.svg

Проверяет подпись сообщения, выполненную адресатом {address}, в т.ч. созданную через метод POST /addresses/sign/{address}.

**Запрос метода:**

.. code:: js

  {
    "message": "wWshKhJj",
    "publickey": "C1ADP1tNGuSLTiQrfNRPhgXx59nCrwrZFRV4AHpfKBpZ",
    "signature": "5kwwE9sDZzssoNaoBSJnb8RLqfYGt1NDGbTWWXUeX8b9amRRJN3hr5fhs9vHBq6VES5ng4hqbCUoDEsoQNauRRts"
  }

**Ответ метода:**

.. code:: js

  {
    "valid": true
  }

POST /addresses/signText/{address}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. figure:: https://img.shields.io/badge/API--KEY-required-red.svg

Возвращает сообщение, подписанное приватным ключом адресата {address}, сохраненным в keystore ноды.

**Запрос метода:**

.. code:: js

  {
    "message": "mytext"
  }

**Ответ метода:**

.. code:: js
  {
    "message": "message",
    "publicKey": "C1ADP1tNGuSLTiQrfNRPhgXx59nCrwrZFRV4AHpfKBpZ",
    "signature": "5kVZfWfFmoYn38cJfNhkdct5WCyksMgQ7kjwHK7Zjnrzs9QYRWo6HuJoGc8WRMozdYcAVJvojJnPpArqPvu2uc3u"
  }

POST /addresses/verifyText/{address}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. figure:: https://img.shields.io/badge/API--KEY-required-red.svg

Проверяет подпись сообщения, выполненную адресатом {address}, в т.ч. созданную через метод POST /addresses/signText/{address}.

**Запрос метода:**

.. code:: js
  {
    "message": "message",
    "publicKey": "C1ADP1tNGuSLTiQrfNRPhgXx59nCrwrZFRV4AHpfKBpZ",
    "signature": "5kVZfWfFmoYn38cJfNhkdct5WCyksMgQ7kjwHK7Zjnrzs9QYRWo6HuJoGc8WRMozdYcAVJvojJnPpArqPvu2uc3u"
  }

 **Ответ метода:**

.. code:: js

  {
    "valid": true
  } 


GET /addresses/validate/{addressOrAlias}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Проверяет корректность заданого адресата или его псевдонима {addressOrAlias} в блокчейн-сети работающей ноды.

**Ответ метода:**

.. code:: js

  {
    addressOrAlias: "3HSVTtjim3FmV21HWQ1LurMhFzjut7Aa1Ac",
    valid: true
  }

POST /addresses/validateMany
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Запрос метода:**

.. code:: js

  {
    addressesOrAliases: [
      "3HSVTtjim3FmV21HWQ1LurMhFzjut7Aa1Ac",
      "alias:T:asdfghjk",
      "alias:T:1nvAliDAl1ass99911%^&$$$ "
    ]
  }

**Ответ метода:**

.. code:: js
  {
    validations: [
      {
        addressOrAlias: "3HSVTtjim3FmV21HWQ1LurMhFzjut7Aa1Ac",
        valid: true
      },
      {
        addressOrAlias: "alias:T:asdfghjk",
        valid: true
      },
      {
        addressOrAlias: "alias:T:1nvAliDAl1ass99911%^&$$$ ",
        valid: false,
        reason: "GenericError(Alias should contain only following characters: -.0123456789@_abcdefghijklmnopqrstuvwxyz)"
      }
    ]
  }

GET /addresses/publicKey/{publicKey}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Возвращает адрес участника на основании его публичного ключа.

**Ответ метода:**

.. code:: js
  {
    "address": "3N4WaaaNAVLMQgVKTRSePgwBuAKvZTjAQbq"
  }

GET /addresses/data/{address}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Возвращает все данные, записанные на аккаунт адресата {address}.

**Ответ метода:**

.. code:: js

  [
    {
      "key": "4yR7b6Gv2rzLrhYBHpgVCmLH42raPGTF4Ggi1N36aWnY",
      "type": "integer",
      "value": 1500000
    }
  ]

GET /addresses/data/{address}/{key}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Возвращает данные, записанные на аккаунт адресата {address} по ключу {key}.

**Ответ метода:**

.. code:: js

  {
    "key": "4yR7b6Gv2rzLrhYBHpgVCmLH42raPGTF4Ggi1N36aWnY",
    "type": "integer",
    "value": 1500000
  }
