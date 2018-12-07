Как настроить
==============

Подключение ноды к блокчейн-сети выполняется в 2 этапа:

#. Подготовка окружения операционной системы

   - Установка на Ubuntu_
   .. _Ubuntu: how-to-setup/install-node

   - Установка на Windows_
   .. _Windows: how-to-setup/install-node

#. Конфигурация ноды для подключения к сети

Системные требования
~~~~~~~~~~~~~~~~~~~~~~~~~

.. csv-table::
   :header: "Вариант","vCPU","RAM", "SSD", "Режим работы JVM"
   :widths: 30, 5, 5, 5, 40

    "Минимальные требования","1","3Gb","30Gb","Xmx flag Specifies the maximum size of the memory allocation pool for a Java virtual machine (JVM), Add -Xmx option before -jar parameter, Choose size depending on your host RAM. The command should be as following java -Xmx3072M -jar"
    "Рекомендуемые требования","2+","4+ Gb","30+ Gb","java -Xmx4096M -jar"


.. toctree::
   :caption: Содержание раздела

   how-to-setup/install-node.rst
   how-to-setup/configuration-node.rst
