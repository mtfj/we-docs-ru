Структура транзакций
=====================

В этом разделе приведена структура хранения транзакций в блокчейн-платформе Восток.
Для некоторых типов транзакций введено версионирование.

.. table:: Типы транзакций
===   ==============================================
№	    Transaction type
===   ==============================================
1	    Genesis Transaction
2	    Payment Transaction (не используется)
3	    Issue Transaction
4	    Transfer Transaction
5	    Reissue Transaction
6	    Burn Transaction
7	    Exchange Transaction
8	    LeaseTransaction
9	    LeaseCancel Transaction
10	  CreateAlias Transaction
11	  MassTransfer Transaction
12	  Data Transaction
13	  SetScript Transaction
14	  SponsoredFee Transaction
===   ==============================================


1. Genesis transaction
~~~~~~~~~~~~~~~~~~~~~~~
.. csv-table::
   :header: "Field","Type","Length"
   :widths: 40, 10, 5

   Transaction type (1),Byte,1
   Timestamp,Long,8
   Recipient's address,Bytes,26
   Amount,Long,8

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

11. MassTransfer Transaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "#","Field","Length"
   :widths: 15, 40, 15

   #,Field name,Length
   1,Transaction type (0x0b),1
   2,Version (0x01),1
   3,Sender's public key,32
   4,Asset flag (0-Waves, 1-Asset),1
   5,Asset ID, if any,0 / 32
   6,Number of transfers,2
   7,AddressOrAlias object for transfer 1,variable
   8,Amount for transfer 1,8
   9,AddressOrAlias object for transfer 2,variable
   10,Amount for transfer 2,8
   ...,...,...
   N+0,Timestamp,8
   N+1,Fee,8
   N+2,Attachment length,2
   N+3,Attachment bytes,variable
   N+4,Proofs version (0x01),1
   N+5,Proof count,2
   N+6,Proof1 length (64),2
   N+7,Proof1,64

12. Data Transaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 .. csv-table::
    :header: "#","Field","Length"
    :widths: 15, 40, 15

    1,"Reserved (Always 0)",1
    2,"Transaction type (0x0c",1
    3,"Version (0x01)",1
    4,"Sender's public key",32
    5,"Number of data entries",2
    6,"Key1 byte size",2
    7,"Key1 bytes","UTF-8 encoded,variable"
    8,"Value1 type: 0 = integer 1 = boolean 2 = binary array",1
    9,"Value1 bytes","variable"
    ...,...,...
    N,"Timestamp",8
    "N+1",Fee,8
    "N+2","Proofs version (0x01)",1
    "N+3","Proof count (1)",1
    "N+4","Signature length (64)",2
    "N+5","Signature",64

13. SetScript Transaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","Type","Length"
   :widths: 45, 15, 15

   Transaction type (0x0e),Byte,1
   Version (0x01),Byte,1
   Sender's public key,Bytes,32
   Asset ID,Bytes,32
   Minimal fee in assets*,Long,8
   Fee,Long,8
   Timestamp,Long,8
   Proofs**,Bytes,64


14. SponsoredFee Transaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","Type","Length"
   :widths: 45, 15, 15

   Transaction type (0x0e),Byte,1
   Version (0x01),Byte,1
   Sender's public key,Bytes,32
   Asset ID,Bytes,32
   Minimal fee in assets*,Long,8
   Fee,Long,8
   Timestamp,Long,8
   Proofs**,Bytes,64
