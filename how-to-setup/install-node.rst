.. _install-node:

Установка ПО
===============

Во избежание конфликтов ПО установку нод для платформы Vostok необходимо выполнять на отдельной машине от нод блокчейн-платформы Waves. Нода предоставляет возможность использовать ГОСТ-криптографию на базе КриптоПро и встроенный модуль Waves-криптографии. От типа используемой криптографии зависит список предустановленных пакетов для ноды. 

.. _install-gos:

ГОСТ-криптография
----------------------------

1. Проверка предустановленных Java-пакетов 

Корректность установки можно проверить, набрав в консоли вашей ОС команду ``java -version``. Если отображается следующий результат, то можно переходить к следующему шагу - "Установка КриптоПРО".

 .. code:: js

       Java version "1.8.0_74"
       Java(TM) SE Runtime Environment (build 1.8.0_74-b02)
       Java HotSpot(TM) 64-Bit Server VM (build 25.74-b02, mixed mode)

Если Java-пакеты не установлены, то вам следует скачать и установить `JRE 1.8 (64-bit) <http://www.oracle.com/technetwork/java/javase/downloads/2133155>`_, соответствущий вашей ОС. Для скачивания дистрибутива необходимо пройти регистрацию на сайте.

2. Установка КриптоПро

+-----------------------------+----------------------------+---------------------------+
|  .. image:: img/win.png     |   .. image:: img/lin.png   |  .. image:: img/mac.png   |
|      :height: 70            |       :height: 70          |      :height: 70          |
|      :target: `windows1`_   |       :target: `linux1`_   |      :target: `mac1`_     |
+-----------------------------+----------------------------+---------------------------+

Скачайте и установите пакет `CryptoPro JCP 2.0.39014 <https://www.cryptopro.ru/sites/default/files/private/jcp/jcp-2.0.39014.zip>`_ согласно вашему типу ОС. Для скачивания дистрибутива необходимо пройти регистрацию на сайте.

    .. warning:: Платформа Vostok поддерживает только версию CryptoPro ``2.0.39014`` !
  
    .. hint:: При использовании Waves-криптографии устанавливать CryptoPro JCP необязательно.

При установке `CryptoPro JCP <https://www.cryptopro.ru/sites/default/files/private/jcp/jcp-2.0.39014.zip>`_ необходимо убедиться, что указан верный путь до исполняемого файла пакета JRE. 

.. _windows1:

Windows
~~~~~~~~~~~
     
     .. image:: img/JCP_1.png
        :height: 250

Если в процессе инсталляции возникают ошибки, связанные с JRE, то необходимо проверить корректность пути до исполняемого файла java пакета JRE, указанного в системной переменной ``PATH``.
     
     .. image:: img/JCP_2.png
        :height: 250
    
.. _linux1:

Linux
~~~~~~~~~~~

Пропишите переменные окружения для Java JDK для всех пользователей по умолчанию, набрав в терминале следующую команду.
    
     .. code:: js 

           sudo vi /etc/profile.d/oracle.share

В данный файл внесите следующие значения переменных окружения:
    
     .. code:: js

         export JAVA_HOME=/opt/jdk1.8.0_xxx
         export JRE_HOME=/opt/jdk1.8.0_xxx/jre
         export PATH=$PATH:/opt/jdk1.8.0_xxx/bin:/opt/jdk1.8.0_xxx/jre/bin 

Если на сервере стоит несколько версий Java JDK, то необходимо зарегистрировать альтернативы для новой версии.
     
     .. code:: js

         sudo alternatives --install /usr/bin/java java /opt/jdk1.8.0_xxx/bin/java 
         sudo alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_xxx/bin/jar 
         sudo alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_xxx/bin/javac 
         sudo alternatives --set jar /opt/jdk1.8.0_xxx/bin/jar
         sudo alternatives --set jar /opt/jdk1.8.0_xxx/bin/jar
         sudo alternatives --set javac /opt/jdk1.8.0_xxx/bin/javac
         sudo alternatives --config java

Обеспечьте пользователей соответствующими правами:
     
     .. code:: js

         sudo chmod 777 -R /opt/jdk1.8.0_xxx/jre/.systemPrefs

.. _mac1:

Mac
~~~~~~~~~

Lorem text...

.. _install-node:

Установка ноды
------------------

+-----------------------------+----------------------------+---------------------------+
|  .. image:: img/win.png     |   .. image:: img/lin.png   |  .. image:: img/mac.png   |
|      :height: 70            |       :height: 70          |      :height: 70          |
|      :target: `windows2`_   |       :target: `linux2`_   |      :target: `mac2`_     |
+-----------------------------+----------------------------+---------------------------+

.. _windows2:

Windows
~~~~~~~~~~~

1. Скачайте `актуальный релиз <https://github.com/vostokplatform/Vostok-Releases/releases>`_ ноды в jar-формате и шаблон конфигурационного файла со страницы проекта в `GitHub <https://github.com/vostokplatform/Vostok-Releases/tree/master/configs>`_. Самая свежая версия приложений находится в шапке страницы:

    .. image:: img/latest.png
       :height: 250

    - node-x.x.x.jar - приложение ноды Vostok;
    - generators-x.x.x.jar - утилита для настройки параметров ноды Vostok и создания аккаунтов пользователей.

2. Отредактируйте конфигурационный файл в соответствии с руководством :ref:`Конфигурация ноды <configuration>`.

3. Запустите ноду, набрав в консоли вашей ОС команду:
   
    .. code:: js
    
        java -jar node-x.x.x.jar example.conf

Для остановки ноды можно использовать сочетание клавиш ``ctrl + C``.

.. _linux2:

Linux (Ubuntu)
~~~~~~~~~~~~~~~~
  
1. Скачайте `актуальный релиз <https://github.com/vostokplatform/Vostok-Releases/releases>`_ ноды в формате deb-пакета и шаблон конфигурационного файла со страницы проекта в `GitHub <https://github.com/vostokplatform/Vostok-Releases/tree/master/configs>`_.

2. Отредактируйте конфигурационный файл в соответствии с руководством :ref:`"Конфигурация ноды" <configuration>`.

3. Установите ноду из скачанного deb-пакета, соответствущего дистрибутиву Linux. Ниже приведен пример для .deb-пакета. Команда для установки: 

   .. code:: js

       sudo dpkg -i vostok.deb
    
- Директория для конфигурационного файла - /etc/vostok/vostok.conf
- Директория для jar-файла и библиотек - /usr/share/vostok/
- Директория для данных блокчейна - /var/lib/vostok/

4. Запуск ноды выполняется командой: 
    
   .. code:: js

        sudo systemctl start vostok.service

  Остановка ноды выполняется командой: 
    
   .. code:: js

        sudo systemctl stop vostok.service

.. _mac2:

Mac
~~~~~~~~~
Lorem text...
          
