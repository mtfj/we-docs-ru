Системные требования
=======================

Ниже представлены аппартные и системные требования.

.. csv-table::
   :header: "Вариант","vCPU","RAM", "SSD", "Режим работы JVM"
   :widths: 10, 1, 1, 1, 20

    "Минимальные требования","1","3Gb","30Gb","java -Xmx3072M -jar"
    "Рекомендуемые требования","2+","4+ Gb","30+ Gb","java -Xmx4096M -jar"

.. hint:: "Xmx" - флаг, определяющий максимальный размер доступной для JVM памяти.

**Требования к окружению для ноды**

- `JRE 1.8 (64-bit) <http://www.oracle.com/technetwork/java/javase/downloads/2133155>`_
- `CryptoPro JCP 2.0.39014 <https://www.cryptopro.ru/sites/default/files/private/jcp/jcp-2.0.39014.zip>`_

.. warning:: Платформа Vostok поддерживает только версию ``2.0.39014`` для ПО CryptoPro JCP. Для скачивания дистрибутива необходимо пройти регистрацию на сайте.

**Требования к окружению для корпоративного клиента и дата-сервиса**

- `Docker CE <https://docs.docker.com/install/linux/docker-ce/ubuntu/>`_
- `Docker-compose <https://docs.docker.com/compose/install/>`_
- `node.js <https://nodejs.org/en/download/>`_ LTS версии 10+
- `npm <https://www.npmjs.com/>`_ 6+  




