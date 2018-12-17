Структура блока
=====================

В этом разделе приведена структура хранения блоков в блокчейн-платформе Восток.

.. csv-table::
   :header: "#", "Поле","Тип","Размерность"
   :widths: 5, 30, 10, 5
  
    1,"Version (0x02 for Genesis block, 0x03 for common block)",Byte,0
    2,Timestamp,Long,1
    3,Parent block signature,Bytes,64
    4,Consensus block length (always 40 bytes),Int,4
    5,Base target,Long,8
    6,Generation signature*,Bytes,32
    7,Transactions block length (N),Int,4
    8,Transaction #1 bytes,Bytes,M1
    ...,...,...,...
    "8 + (K - 1)","Transaction #K bytes",Bytes,MK
    "9 + (K - 1)","Generator's public key",Bytes,32
    "10 + (K - 1)","Block's signature",Bytes,64

Генерирующая подпись (Generation signature) вычисляется  на основе хеша (Blake2b256) от следующих полей:

.. csv-table::
   :header: "#", "Поле","Тип","Размерность"
   :widths: 5, 40, 10, 5

    1,Previous block's generation signature,Bytes,32
    2,Generator's public key,Bytes,32

Подпись блока вычисляется на основе следующих данных:

.. csv-table::
   :header: "#", "Поле","Тип","Размерность"
   :widths: 5, 40, 10, 5

    1,"Version (0x02 for Genesis block,, 0x03 for common block)",Byte,1
    2,Timestamp,Long,8
    3,Parent block signature,Bytes,64
    4,"Consensus block length (always 40 bytes)",Int,4
    5,Base target,Long,8
    6,Generation signature*,Bytes,32
    7,Transactions block length (N),Int,4
    8,"Transaction #1 bytes",Bytes,M1
    ...,...,...,...
    "8 + (K - 1)",Transaction #K bytes,Bytes,MK
    "9 + (K - 1)",Generator's public key,Bytes,32