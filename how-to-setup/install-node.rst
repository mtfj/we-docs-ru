.. _install-node:

Установка ноды
===============

Во избежание конфликтов ПО установку нод для платформы Vostok необходимо выполнять на отдельной машине от нод блокчейн-платформы Waves.

.. _install-windows:

Установка на Windows
----------------------------

1.	Скачайте и установите `JRE 1.8 (64-bit) <http://www.oracle.com/technetwork/java/javase/downloads/2133155>`_.
    | Корректность установки можно проверить командой ``java -version``.
    | Если отображается следующий результат, то можно переходить к следующему шагу.    
    
    .. code:: js

        Java version "1.8.0_74"
        Java(TM) SE Runtime Environment (build 1.8.0_74-b02)
        Java HotSpot(TM) 64-Bit Server VM (build 25.74-b02, mixed mode)

2.	Скачайте и установите `CryptoPro JCP 2.0.39014 <https://www.cryptopro.ru/sites/default/files/private/jcp/jcp-2.0.39014.zip>`_. Для скачивания дистрибутива необходимо пройти регистрацию на сайте.

    .. warning:: Платформа Vostok поддерживает только версию ``2.0.39014``!
  
    .. hint:: При использовании Waves-криптографии устанавливать CryptoPro JCP необязательно.

    При установке `CryptoPro JCP <https://www.cryptopro.ru/sites/default/files/private/jcp/jcp-2.0.39014.zip>`_ необходимо убедиться, что указан верный путь до исполняемого файла пакета JRE: 
     
     .. image:: img/JCP_1.png
        :height: 250
 
    Если в процессе инсталляции возникают ошибки, связанные с JRE, то необходимо проверить корректность пути до файла java.exe пакета JRE, указанного в системной переменной ``PATH``.
     
     .. image:: img/JCP_2.png
        :height: 250

3.	Скачайте `актуальный релиз <https://github.com/vostokplatform/Vostok-Releases/releases>`_ ноды в jar-формате и шаблон конфигурационного файла со страницы проекта в `GitHub <https://github.com/vostokplatform/Vostok-Releases/tree/master/configs>`_.
    | Самая свежая версия приложений находится в шапке страницы:

    .. image:: img/latest.png
       :height: 250

    - node-x.x.x.jar - приложение ноды Vostok;
    - generators-x.x.x.jar - утилита для настройки параметров ноды Vostok и создания аккаунтов пользователей.
 
4.  Отредактируйте ``example.conf`` в соответствии с руководством :ref:`Конфигурация ноды <configuration>`.
5.	Запустите ноду коммандой:

    .. code:: js
    
        java -jar node-x.x.x.jar example.conf

.. _install-ubuntu:

Установка на Ubuntu
----------------------------

1. Скачайте и установите `JRE 1.8 (64-bit) <http://www.oracle.com/technetwork/java/javase/downloads/2133155>`_.

   .. code:: js
        
       sudo add-apt-repository -y ppa:webupd8team/java
       sudo apt-get update
       sudo apt-get -y install oracle-java8-installer

   Корректность установки можно проверить командой ``java -version``.
   Если отображается следующий результат, то можно переходить к следующему шагу.    
    
   .. code:: js

       Java version "1.8.0_74"
       Java(TM) SE Runtime Environment (build 1.8.0_74-b02)
       Java HotSpot(TM) 64-Bit Server VM (build 25.74-b02, mixed mode)

2. Скачайте и установите `CryptoPro JCP 2.0.39014 <https://www.cryptopro.ru/sites/default/files/private/jcp/jcp-2.0.39014.zip>`_. Для скачивания дистрибутива необходимо пройти регистрацию на сайте.

   .. warning:: Платформа Vostok поддерживает только версию ``2.0.39014``!

3. Скачайте `актуальный релиз <https://github.com/vostokplatform/Vostok-Releases/releases>`_ ноды в формате deb-пакета и шаблон конфигурационного файла со страницы проекта в `GitHub <https://github.com/vostokplatform/Vostok-Releases/tree/master/configs>`_.

4. Отредактируйте ``example.conf`` в соответствии с руководством :ref:`"Конфигурация ноды" <configuration>`.

5. Установите ноду из deb-пакета. Команда для установки: 

   .. code:: js

       sudo dpkg -i vostok.deb

    
   - Директория для конфигурационного файла - /etc/vostok/vostok.conf
   - Директория для jar-файла и библиотек - /usr/share/vostok/
   - Директория для данных блокчейна - /var/lib/vostok/

   Запуск ноды выполняется командой: 
    
   .. code:: js

        sudo systemctl start vostok.service

   Остановка ноды выполняется командой: 
    
   .. code:: js

        sudo systemctl stop vostok.service
