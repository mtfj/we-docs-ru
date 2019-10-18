
.. _sign-genesis-block:

Подпись genesis блока и запуск ноды
========================================

Подпишите genesis-блок утилитой `generators-x.x.x.jar <https://github.com/waves-enterprise/WE-releases/releases>`_. Команда для подписания: ``java -jar generators-x.x.x.jar GenesisBlockGenerator nodeName.conf``, где ``nodeName.conf`` это отредактированный в этом :ref:`пункте <create-node-config>` конфигурационный файл ноды. После подписания поля ``genesis-public-key-base-58`` и ``signature`` конфигурационного файла будут заполнены значениями открытого ключа и подписи genesis-блока. 

  | Пример:

  ::

    genesis-public-key-base-58: "4ozcAj...penxrm"
    signature: "5QNVGF...7Bj4Pc"

.. _node-start:

Запуск ноды
----------------

Выполните указанную команду для запуска ноды:

::

  java -jar node-x.x.x.jar nodeName.conf









