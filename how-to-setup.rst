Как настроить
==============

Подключение ноды к блокчейн-сети выполняется в 2 этапа:

#. Подготовка окружения операционной системы

   - :ref:`install-windows` 
   - :ref:`install-ubuntu` 

#. Конфигурация ноды для подключения к сети

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

.. toctree::
   :maxdepth: 2
   :caption: Содержание раздела

   how-to-setup/install-node.rst
   how-to-setup/configuration-node.rst
