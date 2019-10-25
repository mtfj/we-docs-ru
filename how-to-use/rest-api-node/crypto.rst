.. _crypto:

Crypto
============

.. hint:: Правила формирования запросов к ноде приведены в разделе :ref:`rest-api-node`.

Описание шифрования текстовых данных представлено в подразделе :ref:`Шифрование текстовых данных в транзакциях <crypto-data-tx>`.

.. attention:: Ноды версии **1.0** и ниже используют кодировку **Base58** для шифрования/расшифрования текстовых данных. Начиная с версии **1.0.2**, используется кодировка **Base64**. При наличии в сети нод разных версий используйте методы ``crypto`` следующим образом:

  * Если данные принимаются от нод новых версий на ноде старой версии, то данные из строки ``encryptedText`` необходимо преобразовать из **Base64** в **Base58**.
  * Если данные принимаются от нод старых версий на ноде новой версии, то данные из строки ``encryptedText`` необходимо преобразовать из **Base58** в **Base64**.

.. _encryptSeparate:

POST /crypto/encryptSeparate
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Шифрует текст отдельно для каждого получателя уникальным ключом.

**Запрос метода**

.. code:: js

   {
    "sender": "3MCUfX4P4U56hoQwSqXnLJenB6cDkxBjisL",
    "password": "some string as a password",
    "encryptionText": "some text to encrypt",
    "recipientsPublicKeys": [ "5R65oLxp3iwPekwirA4VwwUXaySz6W6YKXBKBRL352pwwcpsFcjRHJ1VVHLp63LkrkxsNod64V1pffeiZz5i2qXc",
    "9LopMj2GqWxBYgnZ2gxaNxwXqxXHuWd6ZAdVqkprR1fFMNvDUHYUCwFxsB79B9sefgxNdqwNtqzuDS8Zmn48w3S"]
   }

**Пример ответа**

.. code:: js

   {
    "encryptedText": "IZ5Kk5YNspMWl/jmlTizVxD6Nik=",
    "publicKey": "5R65oLxp3iwPekwirA4VwwUXaySz6W6YKXBKBRL352pwwcpsFcjRHJ1VVHLp63LkrkxsNod64V1pffeiZz5i2qXc",
    "wrappedKey": "uWVoxJAzruwTDDSbphDS31TjSQX6CSWXivp3x34uE3XtnMqqK9swoaZ3LyAgFDR7o6CfkgzFkWmTen4qAZewPfBbwR"
   },
   {
    "encryptedText": "F9uO1ORGvSEDe6dWm1pzJQ+3xqE=",
    "publicKey": "9LopMj2GqWxBYgnZ2gxaNxwXqxXHuWd6ZAdVqkprR1fFMNvDUHYUCwFxsB79B9sefgxNdqwNtqzuDS8Zmn48w3S",
    "wrappedKey": "LdzdoKadUzBTMwczGYgu1AM4YrbbLr9Uh1MvQ3MPcLZUhCD9herz4dv1m6ssaVHPiBNUGgqKnLZ6Si4Cc64UvhXBbG"
   }

.. _encryptCommon:

POST /crypto/encryptCommon
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Шифрует данные единым ключом CEK для всех получателей, CEK оборачивается уникальными KEK для каждого получателя.

**Запрос метода**

.. code:: js

   {
    "sender": "3MCUfX4P4U56hoQwSqXnLJenB6cDkxBjisL",
    "password": "some string as a password",
    "encryptionText": "some text to encrypt",
    "recipientsPublicKeys": [ "5R65oLxp3iwPekwirA4VwwUXaySz6W6YKXBKBRL352pwwcpsFcjRHJ1VVHLp63LkrkxsNod64V1pffeiZz5i2qXc",
    "9LopMj2GqWxBYgnZ2gxaNxwXqxXHuWd6ZAdVqkprR1fFMNvDUHYUCwFxsB79B9sefgxNdqwNtqzuDS8Zmn48w3S"]
   }

**Пример ответа**

.. code:: js

  {
  "encryptedText": "NpCCig2i3jzo0xBnfqjfedbti8Y=",
  "recipientToWrappedStructure": {
    "5R65oLxp3iwPekwirA4VwwUXaySz6W6YKXBKBRL352pwwcpsFcjRHJ1VVHLp63LkrkxsNod64V1pffeiZz5i2qXc":
  "M8pAe8HnKiWLE1HsC1ML5t8b7giWxiHfvagh7Y3F7rZL8q1tqMCJMYJo4qz4b3xjcuuUiV57tY3k7oSig53Aw1Dkkw",
    "9LopMj2GqWxBYgnZ2gxaNxwXqxXHuWd6ZAdVqkprR1fFMNvDUHYUCwFxsB79B9sefgxNdqwNtqzuDS8Zmn48w3S":
  "Doqn6gPvBBeSu2vdwgFYMbDHM4knEGMbqPn8Np76mNRRoZXLDioofyVbSSaTTEr4cvXwzEwVMugiy2wuzFWk3zCiT3"
   }
  }

.. _decrypt:

POST /crypto/decrypt
~~~~~~~~~~~~~~~~~~~~~~~

Расшифровывает данные. Расшифровка доступна в случае, если ключ получателя сообщения находится в keystore ноды.

**Запрос метода**

.. code:: js

   {
    "recipient": "3M5F8B1qxSY1W6kA2ZnQiDB4JTGz9W1jvQy",
    "password": "some string as a password",
    "encryptedText": "oiKFJijfid8HkjsjdhKHhud987d",
    "wrappedKey": "M5F8B1qxSY1W6kA2ZnQiDB4JTGzA2ZnQiDB4JTGz9W1jvQy"
    "senderPublicKey": "M5F8B1qxSY1W6kA2ZnQiDB4JTGzA2ZnQiDB4JTGz9W1jvQy",
   }

**Пример ответа**

.. code:: js

  {
  "decryptedText": "some string for encryption",
  }




