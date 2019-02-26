Транзакции
=====================

В этом разделе приведена структура хранения транзакций в блокчейн-платформе Восток.
Для некоторых типов транзакций введено версионирование.

.. table:: Типы транзакций
===   ========================================================================================================================================================================================================
№	  Тип транзакции
===   ========================================================================================================================================================================================================
1	  :ref:`Genesis transaction <GenesisTransaction>`
2	  Payment Transaction (не используется)
3	  :ref:`Issue Transaction <issueTransaction>`
4	  :ref:`Transfer Transaction <TransferTransaction>`
5	  :ref:`Reissue Transaction <ReissueTransaction>`
6	  :ref:`Burn Transaction <BurnTransaction>`
7	  Exchange Transaction (не используется)
8	  :ref:`Lease Transaction <LeaseTransaction>`
9	  :ref:`Lease Cancel Transaction <LeaseCancelTransaction>`
10	  :ref:`Create Alias Transaction <CreateAliasTransaction>`
11	  :ref:`MassTransfer Transaction <MassTransferTransaction>`
12	  :ref:`Data Transaction <DataTransaction>`
13	  :ref:`SetScript Transaction <SetScriptTransaction>`
14	  :ref:`SponsoredFee Transaction (не используется) <SponsoredFeeTransaction>`
15    :ref:`SetAssetScript <SetAssetScriptTransaction>`
101   :ref:`Genesis Permission Transaction <GenesisPermitTransaction>`
102   :ref:`Permission Transaction <PermitTransaction>`
103   :ref:`CreateContract Transaction <CreateContractTransaction>`
104   :ref:`CallContract Transaction <CallContractTransaction>`
105   :ref:`ExecutedContract Transaction <ExecutedContractTransaction>`
106   :ref:`DisableContract Transaction <DisableContractTransaction>`
===   ========================================================================================================================================================================================================

.. _GenesisTransaction:

1. GenesisTransaction
~~~~~~~~~~~~~~~~~~~~~~~
.. csv-table::
   :header: "Field","JSON to sign","Broadcasted JSON","Blockchain state","Type"
   :widths: 10, 10, 10, 10, 10

   type             ,       ,+      ,+      ,Byte
   id               ,       ,+      ,       ,Byte
   fee              ,       ,+      ,       ,Long
   timestamp        ,       ,+      ,+      ,Long
   signature        ,       ,+      ,?      ,ByteStr
   recipient        ,       ,+      ,+      ,ByteStr
   amount           ,       ,+      ,+      ,Long
   height           ,       ,+      ,       , 

**JSON транзакции в блокчейне**

.. code:: js
    
    {
        "type": 1,
        "id": "VXRnximYkigS8quMiqJ2HCkhjhnjDpN4m92dHwo2TqrPiDnkJexKUbhQGj8asUz8AXmNjsSpJPDwJU5Jbuak1FJ",
        "fee": 0,
        "timestamp": 1500635421931,
        "signature": "VXRnximYkigS8quMiqJ2HCkhjhnjDpN4m92dHwo2TqrPiDnkJexKUbhQGj8asUz8AXmNjsSpJPDwJU5Jbuak1FJ",
        "recipient": "3Mx5sDq4NXef1BRzJRAofa3orYFxLanxmd7",
        "amount": 125000000000000,
        "height": 1
    }

.. _issueTransaction:

3. issueTransaction
~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","JSON to sign","Broadcasted JSON","Blockchain state","Type"
   :widths: 10, 10, 10, 10, 10

   type             ,+      ,+      ,+      ,Byte               
   id               ,       ,+      ,       ,Byte               
   sender           ,+      ,+      ,       ,PublicKeyAccount   
   senderPublicKey  ,       ,+      ,+      ,PublicKeyAccount   
   fee              ,+      ,+      ,+      ,Long               
   timestamp        ,+ (opt),+      ,+      ,Long               
   proofs           ,       ,+      ,+      ,List[ByteStr]      
   version          ,+      ,+      ,+      ,Byte               
   assetId          ,       ,+      ,       ,ByteStr            
   name             ,+      ,+      ,+      ,Array[Byte]        
   quantity         ,+      ,+      ,+      ,Long               
   reissuable       ,+      ,+      ,+      ,Boolean            
   decimals         ,+      ,+      ,+      ,Byte               
   description      ,+      ,+      ,+      ,Array[Byte]        
   chainId          ,       ,+      ,+      ,Byte               
   script           ,+ (opt),+      ,+      ,Bytes
   password         ,+ (opt),       ,       ,String
   height           ,       ,+      ,       , 

**JSON для вызова метода sign**

.. code:: js

   { 
      "type": 3,
      "name": "Test Asset 1",
      "quantity": 100000000000,
      "description": "Some description",
      "sender": "3FSCKyfFo3566zwiJjSFLBwKvd826KXUaqR",
      "decimals": 8,
      "reissuable": true,
      "fee": 100000000
   }

**JSON транзакции в блокчейне**

.. code:: js

    {
        "type": 3,
        "id": "DnK5Xfi2wXUJx9BjK9X6ZpFdTLdq2GtWH9pWrcxcmrhB",
        "sender": "3N65yEf31ojBZUvpu4LCo7n8D73juFtheUJ",
        "senderPublicKey": "C1ADP1tNGuSLTiQrfNRPhgXx59nCrwrZFRV4AHpfKBpZ",
        "fee": 100000000,
        "timestamp": 1549378509516,
        "proofs": [ "NqZGcbcQ82FZrPh6aCEjuo9nNnkPTvyhrNq329YWydaYcZTywXUwDxFAknTMEGuFrEndCjXBtrueLWaqbJhpeiG" ],
        "version": 2,
        "assetId": "DnK5Xfi2wXUJx9BjK9X6ZpFdTLdq2GtWH9pWrcxcmrhB",
        "name": "Token Name",
        "quantity": 10000,
        "reissuable": true,
        "decimals": 2,
        "description": "SmarToken",
        "chainId": 84,
        "script": "base64:AQa3b8tH",
        "height": 60719
    },

.. _TransferTransaction:

4. TransferTransaction
~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","JSON to sign","Broadcasted JSON","Blockchain state","Type"
   :widths: 10, 10, 10, 10, 10

   type             ,+      ,+      ,+      ,Byte
   id               ,       ,+      ,       ,Byte
   sender           ,+      ,+      ,       ,PublicKeyAccount
   senderPublicKey  ,       ,+      ,+      ,PublicKeyAccount
   fee              ,+      ,+      ,+      ,Long
   timestamp        ,+ (opt),+      ,+      ,Long
   proofs           ,       ,+      ,+      ,List[ByteStr]
   version          ,+      ,+      ,+      ,Byte
   recipient        ,+      ,+      ,+      ,ByteStr
   assetId          ,+ (opt),+      ,+      ,ByteStr
   amount           ,+      ,+      ,+      ,Long
   attachment       ,+ (opt),+      ,+      ,Bytes
   password         ,+ (opt),       ,       ,String   
   height           ,       ,+      ,       ,

**JSON для вызова метода sign**

.. code:: js

    {
        "type": 4,
        "sender": "3MtrNP7AkTRuBhX4CBti6iT21pQpEnmHtyw",
        "recipient": "3P8JYPHrnXSfsWP1LVXySdzU1P83FE1ssDa",
        "amount": 1317209272,
        "fee": 100000,
        "attachment": "string"
    }


**JSON транзакции в блокчейне**

.. code:: js

    {
        "type": 4,
        "id": "DZr3GPBmKDk82qHjMDszNRDMc8EqRewf43c5MH89cZ59",
        "sender": "3MrjPoYMCki2vEjb3wD1gmofdQnhk8Pd2zW",
        "senderPublicKey": "3Zf1txFhc945XG4tzVaRcQQFqLPKWivZwRfWsGsuAg5u",
        "fee": 100000,
        "timestamp": 1549378440887,
        "proofs": [ "3GJoM8sC3ZBfVKpKZpfPAsS3cchG2LYL2CLWhZC6HCfRtfCX1UJET82DeV1XvSBpPdyS9CgH5iRRCsJDsFHZnk32" ],
        "version": 2,
        "recipient": "3N65yEf31ojBZUvpu4LCo7n8D73juFtheUJ",
        "assetId": null,
        "amount": 5000000000,
        "attachment": "",
        "height": 3049
    }

.. _ReissueTransaction:

5. ReissueTransaction
~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","JSON to sign","Broadcasted JSON","Blockchain state","Type"
   :widths: 10, 10, 10, 10, 10

   type             ,+      ,+      ,+      ,Byte
   id               ,       ,+      ,       ,Byte
   sender           ,+      ,+      ,       ,PublicKeyAccount
   senderPublicKey  ,       ,+      ,+      ,PublicKeyAccount
   fee              ,+      ,+      ,+      ,Long
   timestamp        ,+ (opt),+      ,+      ,Long
   proofs           ,       ,+      ,+      ,List[ByteStr]
   version          ,+      ,+      ,+      ,Byte
   chainId          ,       ,+      ,+      ,Byte
   assetId          ,+      ,+      ,+      ,ByteStr
   quantity         ,+      ,+      ,+      ,Long
   reissuable       ,+      ,+      ,+      ,Boolean
   password         ,+ (opt),       ,       ,String
   height           ,       ,       ,       ,

**JSON для вызова метода sign**

.. code:: js

    {
    }

**JSON транзакции в блокчейне**

.. code:: js

    {
    }

.. _BurnTransaction:

6. BurnTransaction
~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","JSON to sign","Broadcasted JSON","Blockchain state","Type"
   :widths: 10, 10, 10, 10, 10

   type             ,+      ,+      ,+      ,Byte
   id               ,       ,+      ,       ,Byte
   sender           ,+      ,+      ,       ,PublicKeyAccount
   senderPublicKey  ,       ,+      ,+      ,PublicKeyAccount
   fee              ,+      ,+      ,+      ,Long
   timestamp        ,+ (opt),+      ,+      ,Long
   proofs           ,       ,+      ,+      ,List[ByteStr]
   version          ,+      ,+      ,+      ,Byte
   chainId          ,       ,+      ,+      ,Byte
   assetId          ,+      ,+      ,+      ,ByteStr
   quantity         ,+      ,       ,+      ,Long
   amount           ,       ,+      ,       ,Long
   password         ,+ (opt),       ,       ,String
   height           ,       ,       ,       ,

**JSON для вызова метода sign**

.. code:: js

    {
    }

**JSON транзакции в блокчейне**

.. code:: js

    {
    }

.. _ExchangeTransaction:

7. ExchangeTransaction
~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","JSON to sign","Broadcasted JSON","Blockchain state","Type"
   :widths: 10, 10, 10, 10, 10

   type             ,       ,+          ,+      ,Byte
   id               ,       ,+          ,       ,Byte
   sender           ,       ,+          ,       ,PublicKeyAccount
   senderPublicKey  ,       ,+          ,+      ,PublicKeyAccount
   fee              ,       ,+          ,+      ,Long
   timestamp        ,       ,+          ,+      ,Long
   proofs           ,       ,+          ,+      ,List[ByteStr]
   version          ,       ,+          ,+      ,Byte
   amount           ,       ,+          ,+      ,Long
   Price            ,       ,+          ,+      ,Long
   buyOrder         ,       ,+(order1)  ,+      ,Bytes
   sellOrder        ,       ,+(order2)  ,+      ,Bytes
   buyMatcherFee    ,       ,+          ,+      ,Long
   sellMatcherFee   ,       ,+          ,+      ,Long
   height           ,       ,           ,       ,

**JSON для вызова метода sign**

.. code:: js

    {
    }

**JSON транзакции в блокчейне**

.. code:: js

    {
    }

.. _LeaseTransaction:

8. LeaseTransaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","JSON to sign","Broadcasted JSON","Blockchain state","Type"
   :widths: 10, 10, 10, 10, 10

   type             ,+      ,+      ,+      ,Byte
   id               ,       ,+      ,       ,Byte
   sender           ,+      ,+      ,       ,PublicKeyAccount
   senderPublicKey  ,       ,+      ,+      ,PublicKeyAccount
   fee              ,+      ,+      ,+      ,Long
   timestamp        ,+ (opt),+      ,+      ,Long
   proofs           ,       ,+      ,+      ,List[ByteStr]
   version          ,+      ,+      ,+      ,Byte
   amount           ,+      ,+      ,+      ,Long
   recipient        ,+      ,+      ,+      ,ByteStr
   ??status         ,       ,+      ,?      ,???
   password         ,+ (opt),       ,       ,String
   height           ,       ,+      ,       ,

**JSON для вызова метода sign**

.. code:: js

    {
    }

**JSON транзакции в блокчейне**

.. code:: js

    {
        "type": 8,
        "id": "CCLrYaA52khUeJSD9gJbZuQr9R5LNHPKu78DVM97TVXV",
        "sender": "3MukwaCkFvwnmF28fKL6RDgYc2To2M8D5cf",
        "senderPublicKey": "2wUdSiF9dxQ2np7YuthptUKW24wwGVk6Wfkd7UwvBPCi",
        "fee": 100000,
        "timestamp": 1547131186401,
        "proofs": [ "2bhJRBwxxptAFTSjDkCqcMwvdvkYiHdAXRoCaTf5CgC41qSaEFqSAzPeuwFsrBqY8sRedj95gMxWC9jY82oorU41" ],
        "version": 2,
        "amount": 3000000000,
        "recipient": "3N2cQFfUDzG2iujBrFTnD2TAsCNohDxYu8w",
        "status": "canceled",
        "height": 22869
    }

.. _LeaseCancelTransaction:

9. LeaseCancelTransaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","JSON to sign","Broadcasted JSON","Blockchain state","Type"
   :widths: 10, 10, 10, 10, 10

   type             ,+      ,+      ,+      ,Byte
   id               ,       ,+      ,       ,Byte
   sender           ,+      ,+      ,       ,PublicKeyAccount
   senderPublicKey  ,       ,+      ,+      ,PublicKeyAccount
   fee              ,+      ,+      ,+      ,Long
   timestamp        ,+ (opt),+      ,+      ,Long
   proofs           ,       ,+      ,+      ,List[ByteStr]
   version          ,+      ,+      ,+      ,Byte
   chainId          ,       ,+      ,+      ,Byte
   leaseId          ,+ (txId),+      ,+      ,Byte
   ??lease          ,?      ,+      ,?      ,???
   password         ,+ (opt),       ,       ,String
   height           ,       ,+      ,       ,

**JSON для вызова метода sign**

.. code:: js

    {
    }

**JSON транзакции в блокчейне**

.. code:: js

    {
        "type": 9,
        "id": "ByKQjHpJ9BqpPyJXUn7RVbLRicauhh2bJAn8pqF1L48B",
        "sender": "3MukwaCkFvwnmF28fKL6RDgYc2To2M8D5cf",
        "senderPublicKey": "2wUdSiF9dxQ2np7YuthptUKW24wwGVk6Wfkd7UwvBPCi",
        "fee": 100000,
        "timestamp": 1547135339055,
        "proofs": [ "HPNm1oNoPwSLwc6q3U7r9TYEwvBiUcRFTBkQ1zLS8v71R4gYDkKFSsn4aG9DDAyHLuUjYhYK8JwxEAsw8tsyfy5" ],
        "chainId": 84,
        "version": 2,
        "leaseId": "CCLrYaA52khUeJSD9gJbZuQr9R5LNHPKu78DVM97TVXV",
        "lease": 
        {
            "type": 8,
            "id": "CCLrYaA52khUeJSD9gJbZuQr9R5LNHPKu78DVM97TVXV",
            "sender": "3MukwaCkFvwnmF28fKL6RDgYc2To2M8D5cf",
            "senderPublicKey": "2wUdSiF9dxQ2np7YuthptUKW24wwGVk6Wfkd7UwvBPCi",
            "fee": 100000,
            "timestamp": 1547131186401,
            "proofs": [ "2bhJRBwxxptAFTSjDkCqcMwvdvkYiHdAXRoCaTf5CgC41qSaEFqSAzPeuwFsrBqY8sRedj95gMxWC9jY82oorU41" ], 
            "version": 2,
            "amount": 3000000000,
            "recipient": "3N2cQFfUDzG2iujBrFTnD2TAsCNohDxYu8w"
        },
        "height": 22938
    }

.. _CreateAliasTransaction:

10. CreateAliasTransaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","JSON to sign","Broadcasted JSON","Blockchain state","Type"
   :widths: 10, 10, 10, 10, 10

   type             ,+      ,+      ,+      ,Byte
   id               ,       ,+      ,       ,Byte
   sender           ,+      ,+      ,       ,PublicKeyAccount
   senderPublicKey  ,       ,+      ,+      ,PublicKeyAccount
   fee              ,+      ,+      ,+      ,Long
   timestamp        ,+ (opt),+      ,+      ,Long
   proofs           ,       ,+      ,+      ,List[ByteStr]
   version          ,+      ,+      ,+      ,Byte
   alias            ,+      ,+      ,+      ,Bytes
   password         ,+ (opt),       ,       ,String
   height           ,       ,+      ,       ,

**JSON для вызова метода sign**

.. code:: js

    {
    }

**JSON транзакции в блокчейне**

.. code:: js

    {
        "type": 10,
        "id": "DJTaiMpb7eLuPW5GcE4ndeE8jWsWPjx8gPYmbZPJjpag",
        "sender": "3N65yEf31ojBZUvpu4LCo7n8D73juFtheUJ",
        "senderPublicKey": "C1ADP1tNGuSLTiQrfNRPhgXx59nCrwrZFRV4AHpfKBpZ",
        "fee": 0,
        "timestamp": 1549290335781,
        "signature": "2qYepod9DhpxVad1yQDbv1QzU4KLKcbjjdtGY7De2272K76nbQfaXsRnyd31hUE8bhvLjjpHRdtoLVzbBDzRZYEY",
        "proofs": [ "2qYepod9DhpxVad1yQDbv1QzU4KLKcbjjdtGY7De2272K76nbQfaXsRnyd31hUE8bhvLjjpHRdtoLVzbBDzRZYEY" ],
        "version": 1,
        "alias": "chuvaknoimer4",
        "height": 59245
    }

.. _MassTransferTransaction:

11. MassTransferTransaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","JSON to sign","Broadcasted JSON","Blockchain state","Type"
   :widths: 10, 10, 10, 10, 10

   type             ,+      ,+      ,+      ,Byte
   id               ,       ,+      ,       ,Byte
   sender           ,+      ,+      ,       ,PublicKeyAccount
   senderPublicKey  ,       ,+      ,+      ,PublicKeyAccount
   fee              ,+      ,+      ,+      ,Long
   timestamp        ,+ (opt),+      ,+      ,Long
   proofs           ,       ,+      ,+      ,List[ByteStr]
   version          ,+      ,+      ,+      ,Byte
   assetId          ,+ (opt),+      ,+      ,ByteStr
   attachment       ,+ (opt),+      ,+      ,
   transfers        ,+      ,+      ,+      ,List[Transfer]
   transferCount    ,       ,+      ,?      ,
   totalAmount      ,       ,+      ,?      ,
   password         ,+ (opt),       ,       ,String
   height           ,       ,+      ,       ,

**JSON для вызова метода sign**

.. code:: js

    {
    }

**JSON транзакции в блокчейне**

.. code:: js

    {
        "type": 11,
        "id": "DXdKzZD9PX1kQRZVyfotz8yEEbzVmNLEdo2f6ZuNg2Fg",
        "sender": "3N6J8YZ4VGMrcX9fHRoJutfGPmiWziMd8z7",
        "senderPublicKey": "7Qi7EuGU74GrnCuoSuEETNyGJFNnxNwLUTPurejcUWod",
        "fee": 1250000,
        "timestamp": 1547211767624,
        "proofs": [ "3tbuvMRB8SGLrzPGBrVQ7Lna9Z29HGTkWrcFPob9Ahbd43A2X8RLn1LzYxSfXpSmrU99o9HYEz73gebVCAfCcygb" ],
        "version": 1,
        "assetId": "7WtLv6f4pBWd5n8NFe1CwYTZoM5KjbDR8pAjWC74GRVN",
        "attachment": "",
        "transferCount": 22,
        "totalAmount": 2200000,
        "transfers":
        [
            {
                "recipient": "3N2cQFfUDzG2iujBrFTnD2TAsCNohDxYu8w", "amount": 100000
            }
        ],
        "height": 24214
    }

.. _DataTransaction:

12. DataTransaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","JSON to sign","Broadcasted JSON","Blockchain state","Type"
   :widths: 10, 10, 10, 10, 10

   type             ,+      ,+      ,+      ,Byte
   id               ,       ,+      ,       ,Byte
   sender           ,+      ,+      ,       ,PublicKeyAccount
   senderPublicKey  ,+      ,+      ,+      ,PublicKeyAccount
   fee              ,+      ,+      ,+      ,Long
   timestamp        ,+ (opt),+      ,+      ,Long
   proofs           ,       ,+      ,+      ,List[ByteStr]
   version          ,+      ,+      ,       ,Byte
   authorPublicKey  ,       ,+      ,+      ,PublicKeyAccount
   author           ,+      ,+      ,       ,
   data             ,+      ,+      ,+      ,
   password         ,+ (opt),       ,       ,String
   height           ,       ,+      ,       ,

**JSON для вызова метода sign ???** 

.. code:: js

    {
        "type": 12,
        "version": 1,
        "sender": "3PHxBMyy2RvW6Z6uFKJ8VpXM1id4QptAwN2",
        "password": "1234",
        "data": [
            {
            "key": "objectId",
            "type": "string",
            "value": "obj:123:1234"
            }
        ],
        "fee": 100000
    }

**JSON транзакции в блокчейне**

.. code:: js

    {
        "type": 12,
        "id": "14MZURh2wtmUxJkk9FBkqW3esocmTkbWgKyZwtbVkgZR",
        "sender": "3NBbipRYQmZFudFCoVJXg9JMkkyZ4DEdZNS",
        "senderPublicKey": "BUUzu4Kg6ApnPFfxdDEMugtd23BftRmbddfbHDapRHbx",
        "fee": 1000000,
        "timestamp": 1549276970555,
        "proofs": [ "29hWk2JLVMMbF5MezdE6WEeWxMyZBCh5RRW5ScqrqNXUJQVWQsVkV83yeP3VtXYewT748FhRJ92Lvyp31GUwgcm9" ],
        "version": 1,
        "authorPublicKey": "BUUzu4Kg6ApnPFfxdDEMugtd23BftRmbddfbHDapRHbx",
        "author": "3NBbipRYQmZFudFCoVJXg9JMkkyZ4DEdZNS",
        "data":
        [
            {
                "key": "Your key name. Integer like scala long, 8 bytes, floats are not supported",
                "type": "integer",
                "value": 24
            },
            {
                "key": "Your key name 1. Value support only true or false",
                "type": "boolean",
                "value": true
            },
            {
                "key": "Your key name 2",
                "type": "string",
                "value": "String support plain text. Limit 32767 bytes (for binary data too). Key unique for address, but not unique in blockhain. Relevant for all data types."
            }, 
        ],
        "height": 59015
    }

.. _SetScriptTransaction:

13. SetScriptTransaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","JSON to sign","Broadcasted JSON","Blockchain state","Type"
   :widths: 10, 10, 10, 10, 10

   type             ,+      ,+      ,+      ,Byte
   id               ,       ,+      ,       ,Byte
   sender           ,+      ,+      ,       ,PublicKeyAccount
   senderPublicKey  ,       ,+      ,+      ,PublicKeyAccount
   fee              ,+      ,+      ,+      ,Long
   timestamp        ,+ (opt),+      ,+      ,Long
   proofs           ,       ,+      ,+      ,List[ByteStr]
   chainId          ,       ,+      ,+      ,Byte
   version          ,+      ,+      ,+      ,Byte
   script           ,+ (opt),+      ,+      ,Bytes
   name             ,+ ??   ,+      ,+      ,Array[Byte]
   description      ,+ (opt),+      ,+      ,Array[Byte]
   password         ,+ (opt),       ,       ,String
   height           ,       ,+      ,       ,

**JSON для вызова метода sign ???** 

.. code:: js

    {
        "type": 13,
        "version": 1,
        "sender": "3MpPZXBK9pKzRNWALKcQnCt3AiY8DPCXZeq",
        "fee": 1000000,
        "script": "AQQAAAAAAByRtYXRjaDAGB8ueOsI="
    }

**JSON транзакции в блокчейне**

.. code:: js

    {
        "type": 13,
        "id": "HPDypnQJHJskN8kwszF8rck3E5tQiuiM1fEN42w6PLmt",
        "sender": "3N2cQFfUDzG2iujBrFTnD2TAsCNohDxYu8w",
        "senderPublicKey": "91epiducUBtjd5brWqX4DxLWTr2H4kLHbYxsgQdtXtvz",
        "fee": 5000000,
        "timestamp": 1545986757233,
        "proofs": [ "2QiGYS2dqh8QyN7Vu2tAYaioX5WM6rTSDPGbt4zrWS7QKTzojmR2kjppvGNj4tDPsYPbcDunqBaqhaudLyMeGFgG" ],
        "chainId": 84,
        "version": 1,
        "script": "base64:AQQAAAAHJG1hdGNoMAUAAAACdHgG+RXSzQ==",
        "name": "faucet",
        "description": "",
        "height": 3805
    }

.. _SponsorFeeTransaction:

14. SponsoredFeeTransaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","JSON to sign","Broadcasted JSON","Blockchain state","Type"
   :widths: 10, 10, 10, 10, 10

   type                ,+       ,+      ,+      ,Byte
   id                  ,        ,+      ,       ,Byte
   sender              ,+       ,+      ,       ,PublicKeyAccount
   senderPublicKey     ,        ,+      ,+      ,PublicKeyAccount
   fee                 ,+       ,+      ,+      ,Long
   timestamp           ,+ (opt) ,+      ,+      ,Long
   proofs              ,        ,+      ,+      ,List[ByteStr]
   version             ,+       ,+      ,+      ,Byte
   assetId             ,+       ,+      ,       ,ByteStr
   minSponsorAssetFee  ,+ (opt) ,       ,+      ,
   password            ,+ (opt) ,       ,       ,String
   height              ,        ,       ,       ,

**JSON для вызова метода sign**

.. code:: js

    {
    }

**JSON транзакции в блокчейне**

.. code:: js

    {
    }

.. _SetAssetScriptTransaction:

15. SetAssetScriptTransaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","JSON to sign","Broadcasted JSON","Blockchain state","Type"
   :widths: 10, 10, 10, 10, 10

   type             ,+      ,+      ,+      ,Byte
   id               ,       ,+      ,       ,Byte
   sender           ,+      ,+      ,       ,PublicKeyAccount
   senderPublicKey  ,       ,+      ,+      ,PublicKeyAccount
   fee              ,+      ,+      ,+      ,Long
   timestamp        ,+ (opt),+      ,+      ,Long
   proofs           ,       ,+      ,+      ,List[ByteStr]
   version          ,+      ,+      ,+      ,Byte
   chainId          ,       ,+      ,+      ,Byte
   assetId          ,+      ,+      ,+      ,ByteStr
   script           ,+ (opt),+      ,+      ,Bytes
   password         ,+ (opt),       ,       ,String
   height           ,       ,+      ,       ,

**JSON для вызова метода sign**

.. code:: js

    {
    }

**JSON транзакции в блокчейне**

.. code:: js

    {
        "type": 15,
        "id": "CQpEM9AEDvgxKfgWLH2HxE82iAzpXrtqsDDcgZGPAF9J",
        "sender": "3N65yEf31ojBZUvpu4LCo7n8D73juFtheUJ",
        "senderPublicKey": "C1ADP1tNGuSLTiQrfNRPhgXx59nCrwrZFRV4AHpfKBpZ",
        "fee": 100000000,
        "timestamp": 1549448710502,
        "proofs": [ "64eodpuXQjaKQQ4GJBaBrqiBtmkjSxseKC97gn6EwB5kZtMr18mAUHPRkZaHJeJxaDyLzGEZKqhYoUknWfNhXnkf" ],
        "version": 1,
        "chainId": 84,
        "assetId": "DnK5Xfi2wXUJx9BjK9X6ZpFdTLdq2GtWH9pWrcxcmrhB",
        "script": "base64:AQa3b8tH",
        "height": 61895
    }

.. _GenesisPermitTransaction:

101. GenesisPermitTransaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","JSON to sign","Broadcasted JSON","Blockchain state","Type"
   :widths: 10, 10, 10, 10, 10

   type             ,       ,+      ,+      ,Byte
   id               ,       ,+      ,       ,Byte
   fee              ,       ,+      ,       ,Long
   timestamp        ,       ,+      ,+      ,Long
   signature        ,       ,+      ,       ,ByteStr
   target           ,       ,+      ,+      ,ByteStr
   role             ,       ,+      ,+      ,String
   height           ,       ,       ,       ,

**JSON транзакции в блокчейне**

.. code:: js

    {
    }

.. _PermitTransaction:

102. PermitTransaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","JSON to sign","Broadcasted JSON","Blockchain state","Type"
   :widths: 10, 10, 10, 10, 10

   type             ,+      ,+      ,+      ,Byte
   id               ,       ,+      ,       ,Byte
   sender           ,+      ,+      ,       ,PublicKeyAccount
   senderPublicKey  ,       ,+      ,+      ,PublicKeyAccount
   fee              ,       ,+      ,       ,Long
   timestamp        ,+ (opt),+      ,+      ,Long
   proofs           ,       ,+      ,+      ,List[ByteStr]
   version          ,       ,       ,+      ,Byte
   target           ,+      ,+      ,+      ,ByteStr
   PermissionOp     ,       ,       ,+      ,PermissionOp
   opType           ,+      ,+      ,       ,String
   role             ,+      ,+      ,       ,String
   dueTimestamp     ,+ (opt),+      ,       ,Option[Long]
   password         ,+ (opt),       ,       ,String
   height           ,       ,+      ,       ,

**JSON для вызова метода sign**

.. code:: js

    {
    }

**JSON транзакции в блокчейне**

.. code:: js

    {
        "type" : 102,
        "id" : "B8YHUmkqdD1xfcEVYnNGMYzWcrG7fgdvA6Em1Mg89Voz",
        "sender" : "3LWg4n6VmN6DKBSwGF1hwnaCzXdjMkQCFrn",
        "senderPublicKey" : "CaFrRzAv7B3DrECR4i2Los1DwxHj4yKAEKCT3zEke9U4",
        "fee" : 0,
        "timestamp" : 1549030854292,
        "proofs" : [ "3n8h7uswSqCSuYZf6oiUzsQPQLWfL6yhTGwrhZ46uJqubcPLFan312dKdQs8Lwyvh5t9VgMo1CsNHSsd7F5hbG83" ],
        "target" : "3LMKWgu7cZFPiVewYZDBn54HdVT86RfREGc",
        "opType" : "add",
        "role" : "issuer",
        "dueTimestamp" : null,
        "height" : 4400
    }

.. _CreateContractTransaction:

103. CreateContractTransaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","JSON to sign","Broadcasted JSON","Blockchain state","Type"
   :widths: 10, 10, 10, 10, 10

   type             ,+      ,+      ,+      ,Byte
   id               ,       ,+      ,       ,Byte
   sender           ,+      ,+      ,       ,PublicKeyAccount
   senderPublicKey  ,       ,+      ,+      ,PublicKeyAccount
   fee              ,+      ,+      ,+      ,Long
   timestamp        ,+ (opt),+      ,+      ,Long
   proofs           ,       ,+      ,+      ,List[ByteStr]
   version          ,       ,+      ,+      ,Byte
   image            ,+      ,+      ,+      ,Array[Bytes]
   imageHash        ,+      ,+      ,+      ,Array[Bytes]
   params           ,+      ,+      ,+      ,List[DataEntry[_]]
   height           ,       ,+      ,       ,

**JSON для вызова метода sign**

.. code:: js

    {
    }

**JSON транзакции в блокчейне**

.. code:: js

    {
        "type": 103,
        "id": "ULcq9R7PvUB2yPMrmBdxoTi3bcRmQPT3JDLLLZVj4Ky",
        "sender": "3N3YTj1tNwn8XUJ8ptGKbPuEFNa9GFnhqew",
        "senderPublicKey": "3kW7vy6nPC59BXM67n5N56rhhAv38Dws5skqDsjMVT2M",
        "fee": 500000,
        "timestamp": 1550591678479,
        "proofs": [ "yecRFZm9iBLyDy93bDVaNo1PR5Qkkic7196GAgUt9TNH1cnQphq4yGQQ8Fxj4BYA4TaqYVw5qxtWzGMPQyVeKYv" ], 
        "version": 1, 
        "image": "localhost:5000/lshevtsova", 
        "imageHash": "a93c124016b87bbbf1c1deff9638c0f9393d31289d824401d280f85098d154f7", 
        "params": [], 
        "height": 1619 
    }

.. _CallContractTransaction:   
   
104. CallContractTransaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","JSON to sign","Broadcasted JSON","Blockchain state","Type"
   :widths: 10, 10, 10, 10, 10

   type             ,+      ,+      ,+      ,Byte
   id               ,       ,+      ,       ,Byte
   sender           ,+      ,+      ,       ,PublicKeyAccount
   senderPublicKey  ,       ,+      ,+      ,PublicKeyAccount
   fee              ,+      ,+      ,+      ,Long
   timestamp        ,+ (opt),+      ,+      ,Long
   proofs           ,       ,+      ,+      ,List[ByteStr]
   version          ,       ,+      ,+      ,Byte
   contractId       ,+      ,+      ,+      ,ByteStr
   params           ,+      ,+      ,+      ,List[DataEntry[_]]
   height           ,       ,+      ,       ,

**JSON для вызова метода sign**

.. code:: js

    {
    }

**JSON транзакции в блокчейне**

.. code:: js

    {
        "type": 104, 
        "id": "DdG6YK6A3TMAxjzLB16mjkYLVJfM3QBWWD26fL8UhrbG", 
        "sender": "3N3YTj1tNwn8XUJ8ptGKbPuEFNa9GFnhqew", 
        "senderPublicKey": "3kW7vy6nPC59BXM67n5N56rhhAv38Dws5skqDsjMVT2M", 
        "fee": 100000, 
        "timestamp": 1550582410150, 
        "proofs": [ "3ummgjkihzK9EJBB4UT1GsdicRhvgoNDG4ABF5zrs4YmWc5ScbhhkFSiCUCNNFWnJDcvEek9JQ3DnE1f5LkwdTpT" ], 
        "version": 1, 
        "contractId": "8GQcpUzHLh5WKapKUCGGNeMPhmZQMe4dyMtx4iYdvgEL", 
        "params": 
        [
            {
                "key": "a", 
                "type": "integer", 
                "value": 1 
            }, 
            { 
                "key": "b", 
                "type": "integer", 
                "value": 100 
            } 
        ], 
        "height": 1474 
    }

.. _ExecutedContractTransaction:

105. ExecutedContractTransaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","JSON to sign","Broadcasted JSON","Blockchain state","Type"
   :widths: 10, 10, 10, 10, 10

   type             ,       ,+      ,+      ,Byte
   id               ,       ,+      ,       ,Byte
   sender           ,       ,+      ,       ,PublicKeyAccount
   senderPublicKey  ,       ,+      ,+      ,PublicKeyAccount
   fee              ,       ,+      ,       ,Long
   timestamp        ,       ,+      ,+      ,Long
   proofs           ,       ,+      ,+      ,List[ByteStr]
   version          ,       ,+      ,+      ,Byte
   tx               ,       ,+      ,+      ,ExecutableTransaction
   results          ,       ,+      ,+      ,List[DataEntry[_]]
   height           ,       ,+      ,       ,

**JSON для вызова метода sign**

.. code:: js

    {
    }

**JSON транзакции в блокчейне**

.. code:: js

    { 
        "type": 105, 
        "id": "38GmSVC5s8Sjeybzfe9RQ6p1Mb6ajb8LYJDcep8G8Umj", 
        "sender": "3N3YTj1tNwn8XUJ8ptGKbPuEFNa9GFnhqew", 
        "senderPublicKey": "3kW7vy6nPC59BXM67n5N56rhhAv38Dws5skqDsjMVT2M", 
        "fee": 500000, 
        "timestamp": 1550591780234, 
        "proofs": [ "5whBipAWQgFvm3myNZe6GDd9Ky8199C9qNxLBHqDNmVAUJW9gLf7t9LBQDi68CKT57dzmnPJpJkrwKh2HBSwUer6" ], 
        "version": 1, 
        "tx": 
        { 
            "type": 103,
            "id": "ULcq9R7PvUB2yPMrmBdxoTi3bcRmQPT3JDLLLZVj4Ky", 
            "sender": "3N3YTj1tNwn8XUJ8ptGKbPuEFNa9GFnhqew", 
            "senderPublicKey": "3kW7vy6nPC59BXM67n5N56rhhAv38Dws5skqDsjMVT2M", 
            "fee": 500000, 
            "timestamp": 1550591678479, 
            "proofs": [ "yecRFZm9iBLyDy93bDVaNo1PR5Qkkic7196GAgUt9TNH1cnQphq4yGQQ8Fxj4BYA4TaqYVw5qxtWzGMPQyVeKYv" ], 
            "version": 1, 
            "image": "localhost:5000/lshevtsova", 
            "imageHash": "a93c124016b87bbbf1c1deff9638c0f9393d31289d824401d280f85098d154f7", 
            "params": [] 
        }, 
        "results": [], 
        "height": 1619 
    }

.. _DisableContractTransaction:

106. DisableContractTransaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","JSON to sign","Broadcasted JSON","Blockchain state","Type"
   :widths: 10, 10, 10, 10, 10

   type             ,+      ,+      ,+      ,Byte
   id               ,       ,+      ,       ,Byte
   sender           ,+      ,+      ,       ,PublicKeyAccount
   senderPublicKey  ,       ,+      ,+      ,PublicKeyAccount
   fee              ,+      ,+      ,+      ,Long
   timestamp        ,+ (opt),+      ,+      ,Long
   proofs           ,       ,+      ,+      ,List[ByteStr]
   version          ,       ,+      ,+      ,Byte
   contractId       ,+      ,+      ,+      ,ByteStr
   height           ,       ,+      ,       ,

**JSON для вызова метода sign**

.. code:: js

    {
    }

**JSON транзакции в блокчейне**

.. code:: js

    {
    "type": 106,
    "id": "8Nw34YbosEVhCx18pd81HqYac4C2pGjyLKck8NhSoGYH",
    "sender": "3N3YTj1tNwn8XUJ8ptGKbPuEFNa9GFnhqew",
    "senderPublicKey": "3kW7vy6nPC59BXM67n5N56rhhAv38Dws5skqDsjMVT2M",
    "fee": 500000,
    "timestamp": 1550592449973,
    "proofs": [ "5GqPQkuRvG6LPXgPoCr9FogAdmhAaMbyFb5UfjQPUKdSc6BLuQSz75LAWix1ok2Z6PC5ezPpjqzqnr15i3RQmaEc" ],
    "version": 1,
    "contractId": "ULcq9R7PvUB2yPMrmBdxoTi3bcRmQPT3JDLLLZVj4Ky",
    "height": 1632 
    }