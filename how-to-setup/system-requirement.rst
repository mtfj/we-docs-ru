Системные требования
=======================

**Системные требования**

.. csv-table::
   :header: "Вариант","vCPU","RAM", "SSD", "Режим работы JVM"
   :widths: 10, 1, 1, 1, 20

    "Минимальные требования","1","3Gb","30Gb","java -Xmx3072M -jar"
    "Рекомендуемые требования","2+","4+ Gb","30+ Gb","java -Xmx4096M -jar"

Xmx flag Specifies the maximum size of the memory allocation pool for a Java virtual machine (JVM), Add -Xmx option before -jar parameter, Choose size depending on your host RAM. 

**Требования к окружению**

- `JRE 1.8 (64-bit)`_
- `CryptoPro JCP 2.0`_ 

.. _`JRE 1.8 (64-bit)`: http://www.oracle.com/technetwork/java/javase/downloads/2133155
.. _`CryptoPro JCP 2.0`: https://www.cryptopro.ru/products/csp/jcp


