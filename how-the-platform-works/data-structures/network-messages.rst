.. _network-message:

Сетевые сообщения
====================

В этом разделе приведена структура сетевых сообщений в блокчейн-платформе Восток.


Network message
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Все сетевые сообщения, за исключением Handshake, базируются на следующей структуре:

.. csv-table::
   :header: "#", "Поле","Тип","Размерность"
   :widths: 5, 30, 10, 5

   1,Packet length (BigEndian),Int,4
   2,Magic Bytes,Bytes,4
   3,Content ID,Byte,1
   4,Payload length,Int,4
   5,Payload checksum,Bytes,4
   6,Payload,Bytes,N

Magic Bytes are 0x12, 0x34, 0x56, 0x78. Payload checksum is first 4 bytes of_FastHash_of Payload bytes. FastHash is hash function Blake2b256(data).


Handshake message
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Handshake сообщение предназначена для первичного обмена данными между двумя нодами.

.. csv-table::
   :header: "#", "Поле","Тип","Размерность"
   :widths: 5, 30, 10, 5

   1,Application name length (N),Byte,1
   2,Application name (UTF-8 encoded bytes),Bytes,N
   3,Application version major,Int,4
   4,Application version minor,Int,4
   5,Application version patch,Int,4
   6,Node name length (M),Byte,1
   7,Node name (UTF-8 encoded bytes),Bytes,M
   8,Node nonce,Long,8
   9,Declared address length (K) or 0 if no declared address was set,Int,4
   10,Declared address bytes (if length is not 0),Bytes,K
   11,Timestamp,Long,8


GetPeers message
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

GetPeers сообщение отправляется для запроса сетевых адресов участников сети.


.. csv-table::
   :header: "#", "Поле","Тип","Размерность"
   :widths: 5, 30, 10, 5

   1,Packet length (BigEndian),Int,4
   2,Magic Bytes,Bytes,4
   3,Content ID (0x01),Byte,1
   4,Payload length,Int,4
   5,Payload checksum,Bytes,4

Peers message
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Peers сообщение является ответом на запрос GetPeers.

.. csv-table::
   :header: "#", "Поле","Тип","Размерность"
   :widths: 5, 30, 10, 5

   1,Packet length (BigEndian),Int,4
   2,Magic Bytes,Bytes,4
   3,Content ID (0x02),Byte,1
   4,Payload length,Int,4
   5,Payload checksum,Bytes,4
   6,Peers count (N),Int,4
   7,Peer #1 IP address,Bytes,4
   8,Peer #1 port,Int,4
   ...,...,...,...
   6 + 2 * N - 1,Peer #N IP address,Bytes,4
   6 + 2 * N,Peer #N port,Int,4

GetSignatures message
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "#", "Поле","Тип","Размерность"
   :widths: 5, 30, 10, 5

   1,Packet length (BigEndian),Int,4
   2,Magic Bytes,Bytes,4
   3,Content ID (0x14),Byte,1
   4,Payload length,Int,4
   5,Payload checksum,Bytes,4
   6,Block IDs count (N),Int,4
   7,Block #1 ID,Bytes,64
   ...,...,...,...
   6 + N,Block #N ID,Bytes,64


Signatures message
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "#", "Поле","Тип","Размерность"
   :widths: 5, 30, 10, 5

   1,Packet length (BigEndian),Int,4
   2,Magic Bytes,Bytes,4
   3,Content ID (0x15),Byte,1
   4,Payload length,Int,4
   5,Payload checksum,Bytes,4
   6,Block signatures count (N),Int,4
   7,Block #1 signature,Bytes,64
   ...,...,...,...
   6 + N,Block #N signature,Bytes,64

GetBlock message
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "#", "Поле","Тип","Размерность"
   :widths: 5, 30, 10, 5

   1,Packet length (BigEndian),Int,4
   2,Magic Bytes,Bytes,4
   3,Content ID (0x16),Byte,1
   4,Payload length,Int,4
   5,Payload checksum,Bytes,4
   6,Block ID,Bytes,64


Block message
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "#", "Поле","Тип","Размерность"
   :widths: 5, 30, 10, 5

   1,Packet length (BigEndian),Int,4
   2,Magic Bytes,Bytes,4
   3,Content ID (0x17),Byte,1
   4,Payload length,Int,4
   5,Payload checksum,Bytes,4
   6,Block bytes (N),Bytes,N


Score message
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "#", "Поле","Тип","Размерность"
   :widths: 5, 30, 10, 5

   1,Packet length (BigEndian),Int,4
   2,Magic Bytes,Bytes,4
   3,Content ID (0x18),Byte,1
   4,Payload length,Int,4
   5,Payload checksum,Bytes,4
   6,Score (N bytes),BigInt,N


Transaction message
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "#", "Поле","Тип","Размерность"
   :widths: 5, 30, 10, 5

   1,Packet length (BigEndian),Int,4
   2,Magic Bytes,Bytes,4
   3,Content ID (0x19),Byte,1
   4,Payload length,Int,4
   5,Payload checksum,Bytes,4
   6,Transaction (N bytes),Bytes,N


Checkpoint message
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "#", "Поле","Тип","Размерность"
   :widths: 5, 30, 10, 5

   1,Packet length (BigEndian),Int,4
   2,Magic Bytes,Bytes,4
   3,Content ID (0x64),Byte,1
   4,Payload length,Int,4
   5,Payload checksum,Bytes,4
   6,Checkpoint items count (N),Int,4
   7,Checkpoint #1 height,Long,8
   8,Checkpoint #1 signature,Bytes,64
   ...,...,...,...
   6 + 2 * N - 1,Checkpoint #N height,Long,8
   6 + 2 * N,Checkpoint #N signature,Bytes,64