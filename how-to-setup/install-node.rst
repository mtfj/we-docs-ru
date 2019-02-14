.. _install-node:

Установка ноды
===============

.. _install-windows:

Установка на Windows
----------------------------

**Последовательность действий для установки ноды на операционную систему Windows**

1.	Скачать и установить `JRE 1.8 (64-bit) <http://www.oracle.com/technetwork/java/javase/downloads/2133155>`_       
    | Корректность установки можно проверить командой ``java -version``.
    | Если отображается следующий результат, то можно переходить к следующему шагу.    
    
    .. code:: js

        Java version "1.8.0_74"
        Java(TM) SE Runtime Environment (build 1.8.0_74-b02)
        Java HotSpot(TM) 64-Bit Server VM (build 25.74-b02, mixed mode)

2.	Скачать и установить `CryptoPro JCP 2.0 <https://www.cryptopro.ru/products/csp/jcp>`_ (или версию выше).
    | При скачивании дистрибутива необходимо пройти регистрацию на сайте.
    | При установке `CryptoPro JCP 2.0 <https://www.cryptopro.ru/products/csp/jcp>`_ необходимо убедиться что указан верный путь до исполняемого файла пакета JRE: 
     
     .. image:: img/JCP_1.png
        :height: 250
 
    | Если в процессе инсталляции возникают ошибки, связанные с JRE, то необходимо проверить корректность пути до файла java.exe пакета JRE, указанного в системной переменной ``PATH`` 
     
     .. image:: img/JCP_2.png
        :height: 250

3.	Скачать `актуальный релиз <https://github.com/vostokplatform/Vostok-Releases/releases>`_ ноды в jar-формате и конфигурационный файл `example.conf <https://github.com/vostokplatform/Vostok-Releases/blob/master/configs/example.conf>`_
    | Самая свежая версия приложений находится в шапке страницы: 

    .. image:: img/latest.png
       :height: 250

    - node-x.x.x+VST-x.x.x.jar - приложение ноды Vostok
    - generators-x.x.x+VST-x.x.x.jar - утилита для настройки параметров ноды Vostok и создания аккаунтов пользователей 

 
4.  Отредактировать ``example.conf`` в соответствии с руководством :ref:`"Конфигурация ноды" <configuration>`
5.	Запустить ноду коммандой:

    .. code:: js
    
        java -jar node-x.x.x+VST-x.x.x.jar example.conf



.. _install-ubuntu:

Установка на Ubuntu
----------------------------

**Последовательность действий для установки ноды на операционную систему Ubuntu**

1. Скачать и установить `JRE 1.8 (64-bit) <http://www.oracle.com/technetwork/java/javase/downloads/2133155>`_  

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

2. Скачать и установить `CryptoPro JCP 2.0 <https://www.cryptopro.ru/products/csp/jcp>`_ (или версию выше).       

3. Скачать `актуальный релиз <https://github.com/vostokplatform/Vostok-Releases/releases>`_ ноды в формате deb-пакета и конфигурационный файл `example.conf <https://github.com/vostokplatform/Vostok-Releases/blob/master/configs/example.conf>`_

4. Отредактировать ``example.conf`` в соответствии с руководством :ref:`"Конфигурация ноды" <configuration>`

5. Установить ноду из deb-пакета. Команда для установки: 

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
