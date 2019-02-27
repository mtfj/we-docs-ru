.. _transaction-structure:

Транзакции
=====================

В этом разделе приведена структура хранения транзакций в блокчейн-платформе Восток.
Для некоторых типов транзакций введено версионирование.

.. table:: Типы транзакций
===   ========================================================================================================================================================================================================
№	  Тип транзакции
===   ========================================================================================================================================================================================================
1	  `Genesis transaction <https://1.partner-net.vostoknodes.com:8443/transactions/info/LgdxnrTMbNmGJ7a1XB62wtaubm7aeDhkrWSPE5jpLENWpsGY1XeHQWVqkf5KywZTxBrn6sGJksgsdM2BCcTy52R>`_
2	  Payment Transaction (не используется)
3	  `Issue Transaction <https://1.partner-net.vostoknodes.com:8443/transactions/info/B4cFhfhTKhHLzpSKL4J6QgaApYorXzWfqjcx8q5Mh33w>`_
4	  `Transfer Transaction <https://1.partner-net.vostoknodes.com:8443/transactions/info/3jDSuDCxnYakMezZ8KeH7TYtJrNM6RLpAvP6hrDFN3gE>`_
5	  `Reissue Transaction <https://1.partner-net.vostoknodes.com:8443/transactions/info/4G7sWdcjWrkAemCt7z549m9vJbXS6i8ha6XCBN27ceXz>`_
6	  `Burn Transaction <https://1.partner-net.vostoknodes.com:8443/transactions/info/Bo7dde5ogLy5SWkexfiT3jNcZkBiSdq4GyRNPHso5WfV>`_
7	  Exchange Transaction (не используется)
8	  `LeaseTransaction <https://1.partner-net.vostoknodes.com:8443/transactions/info/Ewq1JmSVs38FBnEXK8AhdKRBFP9TP6mwbwm6ySfsBwCH>`_
9	  `LeaseCancel Transaction <https://1.partner-net.vostoknodes.com:8443/transactions/info/2SgUqYV5XPGzMwstSuwwtLe5WrFY4VEt2iGHZ5VLuv4B>`_
10	  `CreateAlias Transaction <https://1.partner-net.vostoknodes.com:8443/transactions/info/FheJMKF3b2nbzatoNXHyfUmUoR6x7sBJKLc7Yc2Sa4bm>`_
11	  `MassTransfer Transaction <https://1.partner-net.vostoknodes.com:8443/transactions/info/9Bu9jx2VVr4gRy9R2k3t7LmUFyv53UjnwwuCQE3XwyKu>`_
12	  `Data Transaction <https://1.partner-net.vostoknodes.com:8443/transactions/info/Et6mGUM7A9kSwHx6sxvUr1faJJS18hqkt9qT4jPGeuJv>`_
13	  SetScript Transaction
14	  SponsoredFee Transaction (не используется)
15    SetAssetScriptTransaction
101   `Permission Transaction <https://1.partner-net.vostoknodes.com:8443/transactions/info/5eduZZDRsuh24xcXE1w8ZXmg51YxVebXwuZy5E2Rwbtw6mQMhPmbiJEoaARMFT5UvuxPbiBTzwHDyW3zefEb44P2>`_ (for genesis block) 
102   `Permission Transaction <https://1.partner-net.vostoknodes.com:8443/transactions/info/B8YHUmkqdD1xfcEVYnNGMYzWcrG7fgdvA6Em1Mg89Voz>`_
103   CreateContractTransaction
104   CallContractTransaction
105   ExecutedContractTransaction
===   ========================================================================================================================================================================================================





1. Genesis transaction
~~~~~~~~~~~~~~~~~~~~~~~
.. csv-table::
   :header: "Field","Type"
   :widths: 40, 10

   Transaction type (1),Byte
   Timestamp,Long
   Recipient's address,Bytes
   Amount,Long

3. Issue Transaction
~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","Type","v1","v2"
   :widths: 40, 10, 10, 10

   Transaction Type,Byte,Y,Y
   Version,Byte,N,Y
   ChainId,Byte,N,Y
   Sender's Public Key,PublicKeyAccount,Y,Y
   Name,Bytes,Y,Y
   Description,Bytes,Y,Y
   Quantity,Long,Y,Y
   Decimals,Byte,Y,Y
   Reissuable,Byte,Y,Y
   Fee,Long,Y,Y
   Timestamp,Long,Y,Y
   Script,option[script],N,Y
   Proofs,proofs,N,Y
   Signature,Bytes,Y,N


4. Transfer Transaction
~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","Type","v1","v2"
   :widths: 40, 10, 10, 10

    Transaction Type,Byte,Y,Y
    version,Byte,N,Y
    chainId,Byte,N,Y
    Sender's Public Key,PublicKeyAccount,Y,Y
    Recipient's Address Or Alias object bytes,Byte,Y,Y
    assetId,Bytes,Y,Y
    Fee assetId,Bytes,Y,Y
    Amount,Long,Y,Y
    Fee,Long,Y,Y
    Timestamp,Long,Y,Y
    Attachment,Bytes,Y,Y
    Proofs,proofs,N,Y
    Signature,Bytes,Y,N

5. Reissue Transaction
~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","Type","v1","v2"
   :widths: 40, 10, 10, 10

   transactionType,Byte,Y,Y
   version,Byte,N,Y
   chainId,Byte,N,Y
   Sender's Public Key,PublicKeyAccount,Y,Y
   Asset ID,Bytes,Y,Y
   Quantity,Long,Y,Y
   Reissuable,Boolean,Y,Y
   Fee,Long,Y,Y
   Timestamp,Long,Y,Y
   Proofs,proofs,N,Y
   Signature,Bytes,Y,N

6. Burn Transaction
~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","Type","v1","v2"
   :widths: 40, 10, 10, 10

    Transaction Type,Byte,Y,Y
    Version,Byte,N,Y
    ChainId,Byte,N,Y
    Sender's Public Key,PublicKeyAccount,Y,Y
    AssetId,Bytes,Y,Y
    Quantity,Long,Y,Y
    Fee,Long,Y,Y
    Timestamp,Long,Y,Y
    Proofs,proofs,N,Y
    Signature,Bytes,Y,N

7. Exchange Transaction
~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
    :header: "Field","Type","v1","v2"
    :widths: 40, 10, 10, 10

    Transaction Type,Byte,Y,Y
    Version,Byte,N,Y
    ChainId,Byte,N,Y
    Buy order,Bytes,Y,Y
    Sell Order,Bytes,Y,Y
    Price,Long,Y,Y
    Amount,Long,Y,Y
    Buy matcher fee,Long,Y,Y
    Sell matcher fee,Long,Y,Y
    Fee,Long,Y,Y
    Timestamp,Long,Y,Y
    Proofs,proofs,N,Y
    Signature,Bytes,Y,N

8. Lease Transaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","Type","v1","v2"
   :widths: 40, 10, 10, 10

   Transaction Type,Byte,Y,Y
   Version,Byte,N,Y
   ChainId,Byte,N,Y
   Sender's Public Key,PublicKeyAccount,Y,Y
   Recipient's Address Or Alias object bytes,Byte,Y,Y
   Amount,Long,Y,Y
   Fee,Long,Y,Y
   Timestamp,Long,Y,Y
   Proofs,proofs,N,Y
   Signature,Bytes,Y,N

9. Lease Cancel Transaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","Type","v1","v2"
   :widths: 40, 10, 10, 10

   Transaction Type,Byte,Y,Y
   Version,Byte,N,Y
   ChainId,Byte,N,Y
   Sender's Public Key,PublicKeyAccount,Y,Y
   LeaseId,ByteStr,Y,Y
   Fee,Long,Y,Y
   Timestamp,Long,Y,Y
   Proofs,proofs,N,Y
   Signature,Bytes,Y,N

10. Create Alias Transaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","Type","v1","v2"
   :widths: 40, 10, 10, 10

   Transaction Type,Byte,Y,Y
   Version,Byte,N,Y
   ChainId,Byte,N,Y
   Sender's Public Key,PublicKeyAccount,Y,Y
   Alias,Bytes,Y,Y
   Fee,Long,Y,Y
   Timestamp,Long,Y,Y
   Proofs,proofs,N,Y
   Signature,Bytes,Y,N

11. MassTransfer Transaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "#","Field"
   :widths: 15, 40

   1,"Transaction type (0x0b)"
   2,"Version (0x01)"
   3,"Sender's public key"
   4,"Asset flag (0-Waves, 1-Asset)"
   5,"Asset ID, if any"
   6,"Number of transfers"
   7,"AddressOrAlias object for transfer 1"
   8,"Amount for transfer 1"
   9,"AddressOrAlias object for transfer 2"
   10,"Amount for transfer 2"
   ...,...
   "N+0",Timestamp
   "N+1",Fee
   "N+2","Attachment length"
   "N+3","Attachment bytes"
   "N+4","Proofs version (0x01)"
   "N+5","Proof count"
   "N+6","Proof1 length (64)"
   "N+7",Proof1

12. Data Transaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "#","Field"
   :widths: 10, 45

   1,"Reserved (Always 0)"
   2,"Transaction type (0x0c"
   3,"Version (0x01)"
   4,"Sender's public key"
   5,"Number of data entries"
   6,"Key1 byte size"
   7,"Key1 bytes"
   8,"Value1 type: 0 = integer 1 = boolean 2 = binary array"
   9,"Value1 bytes"
   ...,...
   N,"Timestamp"
   "N+1",Fee
   "N+2","Proofs version (0x01)"
   "N+3","Proof count (1)"
   "N+4","Signature length (64)"
   "N+5","Signature"

13. SetScript Transaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","Type"
   :widths: 45, 15

   Transaction type (0x0e),Byte
   Version (0x01),Byte
   Sender's public key,Bytes
   Asset ID,Bytes
   Minimal fee in assets*,Long
   Fee,Long
   Timestamp,Long
   Proofs,Bytes


14. SponsoredFee Transaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","Type"
   :widths: 45, 15

   Transaction type (0x0e),Byte
   Version (0x01),Byte
   Sender's public key,Bytes
   Asset ID,Bytes
   Minimal fee in assets*,Long
   Fee,Long
   Timestamp,Long
   Proofs,Bytes

101. PermissionTransaction (for genesis block)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","Type"
   :widths: 45, 15

    Transaction type,Byte
    Target Address Or Alias object, Byte
    Timestamp,timestamp
    Role, Byte

102. PermissionTransaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","Type"
   :widths: 45, 15

    Empty, Byte
    Transaction type,Byte
    Version, Byte
    Sender's public key,Bytes
    Target Address Or Alias object, Byte
    Timestamp,timestamp
    OpType (Add/Remove), Byte
    Role, Byte
    [Optional] Due timestamp, timestamp

.. _CreateContractTransaction:

103. CreateContractTransaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","Type"
   :widths: 45, 15

   Transaction type,Byte
   Sender's public key, Bytes
   Fee,Long
   Timestamp,timestamp
   Proofs,Bytes
   Version, Byte
   Image,Bytes
   ImageHash,Bytes
   params, Bytes

.. _CallContractTransaction:   
   
104. CallContractTransaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","Type"
   :widths: 45, 15

   Transaction type,Byte
   Sender's public key, Bytes
   Fee,Long
   Timestamp,timestamp
   Proofs,Bytes
   Version, Byte
   contractId,Bytes
   params, Bytes

.. _ExecutedContractTransaction:

105. ExecutedContractTransaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","Type"
   :widths: 45, 15

   Transaction type,Byte
   Sender's public key, Bytes
   Fee,Long
   Timestamp,timestamp
   Proofs,Bytes
   Version, Byte
   tx, Bytes 
   results, Bytes

tx represents a set of CreateContract Transaction fields.

.. _DisableContractTransaction:

106. DisableContractTransaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","Type"
   :widths: 45, 15

   Transaction type,Byte
   Sender's public key, Bytes
   Fee,Long
   Timestamp,timestamp
   Proofs,Bytes
   Version, Byte
   contractId,Bytes
   
.. _UpdateContractTransaction:

107. UpdateContractTransaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Field","Type"
   :widths: 45, 15

   Transaction type,Byte
   Sender's public key, Bytes
   Fee,Long
   Timestamp,timestamp
   Proofs,Bytes
   Version, Byte
   Image,Bytes
   ImageHash,Bytes
   params, Bytes

