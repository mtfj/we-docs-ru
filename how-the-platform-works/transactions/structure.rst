Структура транзакций
=====================

В этом разделе приведена структура хранения транзакций в блокчейн-платформе Восток.
Для некоторых типов транзакций введено версионирование.


3. Issue Transaction
~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","Type","Length","v1","v2"
   :widths: 40, 10, 5, 10, 10

   Transaction Type,Byte,1,Y,Y
   Version,Byte,1,N,Y
   ChainId,Byte,1,N,Y
   Sender's Public Key,PublicKeyAccount,32,Y,Y
   Name,Bytes,maximum N,Y,Y
   Description,Bytes,maximum N,Y,Y
   Quantity,Long,8,Y,Y
   Decimals,Byte,1,Y,Y
   Reissuable,Byte,1,Y,Y
   Fee,Long,8,Y,Y
   Timestamp,Long,8,Y,Y
   Script,option[script],N,N,Y
   Proofs,proofs,64,N,Y
   Signature,Bytes,64,Y,N



4. Transfer Transaction
~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","Type","Length","v1","v2"
   :widths: 40, 10, 5, 10, 10

    Transaction Type,Byte,1,Y,Y
    version,Byte,1,N,Y
    chainId,Byte,1,N,Y
    Sender's Public Key,PublicKeyAccount,32,Y,Y
    Recipient's Address Or Alias object bytes,Byte,M,Y,Y
    assetId,Bytes,32,Y,Y
    Fee assetId,Bytes,32,Y,Y
    Amount,Long,8,Y,Y
    Fee,Long,8,Y,Y
    Timestamp,Long,8,Y,Y
    Attachment,Bytes,N,Y,Y
    Proofs,proofs,64,N,Y
    Signature,Bytes,64,Y,N

5. Reissue Transaction
~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","Type","Length","v1","v2"
   :widths: 40, 10, 5, 10, 10

   transactionType,Byte,1,Y,Y
   version,Byte,1,N,Y
   chainId,Byte,1,N,Y
   Sender's Public Key,PublicKeyAccount,32,Y,Y
   Asset ID,Bytes,32,Y,Y
   Quantity,Long,8,Y,Y
   Reissuable,Boolean,1,Y,Y
   Fee,Long,8,Y,Y
   Timestamp,Long,8,Y,Y
   Proofs,proofs,64,N,Y
   Signature,Bytes,64,Y,N

6. Burn Transaction
~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","Type","Length","v1","v2"
   :widths: 40, 10, 5, 10, 10

    Transaction Type,Byte,1,Y,Y
    Version,Byte,1,N,Y
    ChainId,Byte,1,N,Y
    Sender's Public Key,PublicKeyAccount,32,Y,Y
    AssetId,Bytes,32,Y,Y
    Quantity,Long,8,Y,Y
    Fee,Long,8,Y,Y
    Timestamp,Long,8,Y,Y
    Proofs,proofs,64,N,Y
    Signature,Bytes,64,Y,N

7. Exchange Transaction
~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
    :header: "Field","Type","Length","v1","v2"
    :widths: 40, 10, 5, 10, 10

    Transaction Type,Byte,1,Y,Y
    Version,Byte,1,N,Y
    ChainId,Byte,1,N,Y
    Buy order,Bytes,4,Y,Y
    Sell Order,Bytes,4,Y,Y
    Price,Long,8,Y,Y
    Amount,Long,8,Y,Y
    Buy matcher fee,Long,8,Y,Y
    Sell matcher fee,Long,8,Y,Y
    Fee,Long,8,Y,Y
    Timestamp,Long,8,Y,Y
    Proofs,proofs,64,N,Y
    Signature,Bytes,64,Y,N

8. Lease Transaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","Type","Length","v1","v2"
   :widths: 40, 10, 5, 10, 10

   Transaction Type,Byte,1,Y,Y
   Version,Byte,1,N,Y
   ChainId,Byte,1,N,Y
   Sender's Public Key,PublicKeyAccount,32,Y,Y
   Recipient's Address Or Alias object bytes,Byte,M,Y,Y
   Amount,Long,8,Y,Y
   Fee,Long,8,Y,Y
   Timestamp,Long,8,Y,Y
   Proofs,proofs,64,N,Y
   Signature,Bytes,64,Y,N

9. Lease Cancel Transaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","Type","Length","v1","v2"
   :widths: 40, 10, 5, 10, 10

   Transaction Type,Byte,1,Y,Y
   Version,Byte,1,N,Y
   ChainId,Byte,1,N,Y
   Sender's Public Key,PublicKeyAccount,32,Y,Y
   LeaseId,ByteStr,1,Y,Y
   Fee,Long,8,Y,Y
   Timestamp,Long,8,Y,Y
   Proofs,proofs,64,N,Y
   Signature,Bytes,64,Y,N

10. Create Alias Transaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","Type","Length","v1","v2"
   :widths: 40, 10, 5, 10, 10

   Transaction Type,Byte,1,Y,Y
   Version,Byte,1,N,Y
   ChainId,Byte,1,N,Y
   Sender's Public Key,PublicKeyAccount,32,Y,Y
   Alias,Bytes,n,Y,Y
   Fee,Long,8,Y,Y
   Timestamp,Long,8,Y,Y
   Proofs,proofs,64,N,Y
   Signature,Bytes,64,Y,N
