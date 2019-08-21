.. _install-node:

.. meta:: 
  :description: reStructuredText язык разметки система документирования Sphinx-pyhton3 русская документация
   :keywords: reStructuredText, markup language reStructuredText, Waves утсановка, руководство по установке Waves platform, русская документация

Установка ПО
===============

Во избежание конфликтов ПО установку нод для платформы Vostok необходимо выполнять на отдельной машине от нод блокчейн-платформы Waves.
Нода предоставляет возможность использовать ГОСТ-криптографию на базе КриптоПРО и встроенный модуль Waves-криптографии. 
От типа используемой криптографии зависит список предустановленных пакетов для ноды. 

.. _install-gos:
ГОСТ-криптография
----------------------------

1. Проверка предустановленных java-пакетов 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

 Корректность установки можно проверить набрав в консоли вашей ОС команду ``java -version``.
 Если отображается следующий результат, то можно переходить к следующему шагу - "Установка КриптоПРО".

 .. code:: js

       Java version "1.8.0_74"
       Java(TM) SE Runtime Environment (build 1.8.0_74-b02)
       Java HotSpot(TM) 64-Bit Server VM (build 25.74-b02, mixed mode)

 В любом ином случае вам необходимо установить соответствующие java-пакеты. Если вы планируете использовать КриптоПРО, то вам следует 
 скачать и установить `JRE 1.8 (64-bit) <http://www.oracle.com/technetwork/java/javase/downloads/2133155>`_ соответствущий вашей ОС.

2. Установка КриптоПРО
^^^^^^^^^^^^^^^^^^^^^^^

+-------------------------+----------------------------+--------------------------+
| .. image:: img/win.png  |   .. image:: img/lin.png   |  .. image:: img/mac.png  |
|     :height: 70         |       :height: 70          |      :height: 70         |
|                         |                            |                          |
+-------------------------+----------------------------+--------------------------+


Скачайте и установите пакет `CryptoPro JCP 2.0.39014 <https://www.cryptopro.ru/sites/default/files/private/jcp/jcp-2.0.39014.zip>`_ согласно вашему типу ОС. Для скачивания дистрибутива необходимо пройти регистрацию на сайте.

    .. warning:: Платформа Vostok поддерживает только версию CryptoPro ``2.0.39014`` !
  
    .. hint:: При использовании Waves-криптографии устанавливать CryptoPro JCP необязательно.

При установке `CryptoPro JCP <https://www.cryptopro.ru/sites/default/files/private/jcp/jcp-2.0.39014.zip>`_ необходимо убедиться, что указан верный путь до исполняемого файла пакета JRE. 
    
Пример для ОС Windows:
     
     .. image:: img/JCP_1.png
        :height: 250
 
Если в процессе инсталляции возникают ошибки, связанные с JRE, то необходимо проверить корректность пути до исполняемого файла java пакета JRE, указанного в системной переменной ``PATH``.
     
     .. image:: img/JCP_2.png
        :height: 250
    
    
Пример для ОС Linux:

  Прописываем переменные окружения для Java JDK для всех пользователей по умолчанию набрав в терминале.
    
     .. code:: js 

           sudo vi /etc/profile.d/oracle.share
  В данный файл пишем следующие значения переменных окружения:
    
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

  Выдадим соответствующие права пользователям:
     
     .. code:: js

         sudo chmod 777 -R /opt/jdk1.8.0_xxx/jre/.systemPrefs

     

Пример для Mac:

 Lorem text...

.. _install-waves:
Waves-криптография
-------------------------

 В редакторе вашей ОС возьмите конфиг ``accounts.conf`` ноды на правку. Поле waves-crypto должно иметь вид:

     .. code:: js

         waves-crypto=yes

 Данная настройка включает модуль Waves-криптографии.

Установка ноды
------------------

+-------------------------+----------------------------+--------------------------+
| .. image:: img/win.png  |   .. image:: img/lin.png   |  .. image:: img/mac.png  |
|     :height: 70         |       :height: 70          |      :height: 70         |
|                         |                            |                          |
+-------------------------+----------------------------+--------------------------+


.. _windows-getnode-label:
для Windows
^^^^^^^^^^^^

1.Получение ноды
~~~~~~~~~~~~~~~

	Скачайте `актуальный релиз <https://github.com/vostokplatform/Vostok-Releases/releases>`_ ноды в jar-формате и шаблон конфигурационного файла со страницы проекта в `GitHub <https://github.com/vostokplatform/Vostok-Releases/tree/master/configs>`_.
    | Самая свежая версия приложений находится в шапке страницы:

    .. image:: img/latest.png
       :height: 250

    - node-x.x.x.jar - приложение ноды Vostok;
    - generators-x.x.x.jar - утилита для настройки параметров ноды Vostok и создания аккаунтов пользователей.
 
2.Конфигурирование ноды
~~~~~~~~~~~~~~~~~~~~~~~~
  Отредактируйте ``конфигурационный файл`` в соответствии с руководством :ref:`Конфигурация ноды <configuration>`.
  Конфигурация для подключения к mine-net :ref:`Конфигурация ноды <configuration>`.
  Конфигурация для подключения к partner-net :ref:`Конфигурация ноды <configuration>` .


3.Запуск ноды 
~~~~~~~~~~~~~~~
  Запустите ноду, набрав в консоли вашей ОС команду:
   
    .. code:: js
    
        java -jar node-x.x.x.jar example.conf

.. _linux-getnode-label:
для Linux (Ubuntu)
^^^^^^^^^^^^^^^^^^^
  
1.Получение ноды
~~~~~~~~~~~~~~~~~

  Скачайте `актуальный релиз <https://github.com/vostokplatform/Vostok-Releases/releases>`_ ноды в формате deb-пакета и шаблон конфигурационного файла со страницы проекта в `GitHub <https://github.com/vostokplatform/Vostok-Releases/tree/master/configs>`_.

2.Конфигурирование ноды
~~~~~~~~~~~~~~~~~~~~~~~~
  Отредактируйте ``конфигурационный файл`` в соответствии с руководством :ref:`"Конфигурация ноды" <configuration>`.
  Конфигурация для подключения к mine-net :ref:_`Подключение ноды в сеть "Vostok Mainnet"<vostok mainnet:>`.
  Конфигурация для подключения к partner-net :ref:`Подключение ноды в сеть "Vostok Partnernet"`_ .

  Установка ноды производится из скачанного пакета, соответствущего дистрибутиву Linux. Ниже приведен пример для .deb-пакета.
  Установите ноду из deb-пакета. Команда для установки: 

   .. code:: js

       sudo dpkg -i vostok.deb
    
   - Директория для конфигурационного файла - /etc/vostok/vostok.conf
   - Директория для jar-файла и библиотек - /usr/share/vostok/
   - Директория для данных блокчейна - /var/lib/vostok/

  
3.Запуск/останов ноды 
~~~~~~~~~~~~~~~~~~~~~~
  Запуск ноды выполняется командой: 
    
   .. code:: js

        sudo systemctl start vostok.service

  Остановка ноды выполняется командой: 
    
   .. code:: js

        sudo systemctl stop vostok.service

для Mac
^^^^^^^^^
 Lorem text...
    
    .. image:: img/scheme_p.svg
        :height: 300
      
