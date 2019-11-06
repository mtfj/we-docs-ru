.. _install-node1:

Установка ПО
===============

На данный момент мы поддерживаем операционные системы на базе Unix (например, популярные дистрибутивы Linux или MacOS). Однако платформа Waves Enterprise может быть запущена и под Windows в экспериментальном режиме. Вы также можете использовать такие решения, как виртуальные машины с Unix подобной системой или среду Docker для установки и запуска платформы Waves Enterprise на операционной системе Windows.

Вы можете использовать ГОСТ-криптографию на базе ПО "КриптоПро JCP" или встроенный модуль Waves-криптографии. От типа используемой криптографии зависит список предустановленных пакетов для ноды.

.. important:: Нода Waves Enterprise устанавливается на отдельную машину от других блокчейн-нод платформы `Waves <https://wavesplatform.com/>`_.

.. _install-node:

Установка ноды
------------------

+----------------------------+---------------------------+
|   .. image:: img/lin.png   |  .. image:: img/mac.png   |
|       :height: 70          |      :height: 70          |
|       :target: `linux2`_   |      :target: `mac2`_     |
+----------------------------+---------------------------+

.. _linux2:

Linux (Ubuntu)
~~~~~~~~~~~~~~~~

1. Скачайте `актуальный релиз <https://github.com/waves-enterprise/WE-releases>`_ ноды в формате deb-пакета и шаблон конфигурационного файла со страницы проекта в `GitHub <https://github.com/waves-enterprise/WE-releases/tree/master/configs>`_.

2. Отредактируйте конфигурационный файл в соответствии с руководством :ref:`"Конфигурация ноды" <configuration>`.

3. Установите ноду из скачанного deb-пакета, соответствущего дистрибутиву Linux. Ниже приведен пример для .deb-пакета. Команда для установки следующая: 

   .. code:: js

       sudo dpkg -i WE.deb
    
   - Директория для конфигурационного файла - /etc/we/we.conf
   - Директория для jar-файла и библиотек - /usr/share/we/
   - Директория для данных блокчейна - /var/lib/we/

.. important:: При использовании .deb-пакета конфигурационный файл ноды должен иметь только одно название - ``we.conf``.

4. Запуск ноды выполняется командой: 
    
   .. code:: js

        sudo systemctl start we.service

5. Остановка ноды выполняется командой: 
    
   .. code:: js

        sudo systemctl stop we.service

.. _mac2:

Mac
~~~~~~~~~

1. Скачайте `актуальный релиз <https://github.com/waves-enterprise/WE-releases>`_ ноды в jar-формате и шаблон конфигурационного файла со страницы проекта в `GitHub <https://github.com/waves-enterprise/WE-releases/tree/master/configs>`_. Самая свежая версия приложений находится в шапке страницы:

 .. figure:: img/latest.png

    - node-x.x.x.jar - приложение ноды Waves Enterprise;
    - generators-x.x.x.jar - утилита для настройки параметров ноды Waves Enterprise и создания аккаунтов пользователей.

2. Отредактируйте конфигурационный файл в соответствии с руководством :ref:`Конфигурация ноды <configuration>`.

3. Запустите ноду, набрав в консоли вашей ОС команду:
   
    .. code:: js
    
        java -jar node-x.x.x.jar nodeName.conf

Для остановки ноды можно использовать сочетание клавиш ``ctrl + C``.

.. _install-gos:

ГОСТ-криптография
----------------------------

.. hint:: При использовании Waves-криптографии устанавливать CryptoPro JCP необязательно.

1. Проверка предустановленных Java-пакетов 

Корректность установки можно проверить, набрав в консоли вашей ОС команду ``java -version``. Если отображается следующий результат, то можно переходить к следующему шагу - "Установка КриптоПРО".

 .. code:: js

       Java version "1.8.0_74"
       Java(TM) SE Runtime Environment (build 1.8.0_74-b02)
       Java HotSpot(TM) 64-Bit Server VM (build 25.74-b02, mixed mode)

Если Java-пакеты не установлены, то вам следует скачать и установить `JRE 1.8 (64-bit) <http://www.oracle.com/technetwork/java/javase/downloads/2133155>`_, соответствующий вашей ОС. Для скачивания дистрибутива необходимо пройти регистрацию на сайте компании Oracle.

2. Установка КриптоПро

+----------------------------+---------------------------+
|   .. image:: img/lin.png   |  .. image:: img/mac.png   |
|       :height: 70          |      :height: 70          |
|       :target: `linux1`_   |      :target: `mac1`_     |
+----------------------------+---------------------------+

Скачайте и установите пакет `CryptoPro JCP 2.0.40035 <https://www.cryptopro.ru/sites/default/files/private/jcp/jcp-2.0.40035.zip>`_ , согласно вашему типу ОС. Для скачивания дистрибутива необходимо пройти регистрацию на сайте.

.. warning:: Платформа Waves Enterprise поддерживает только версию CryptoPro ``2.0.40035`` !

В состав дистрибутива `CryptoPro JCP 2.0.40035 <https://www.cryptopro.ru/sites/default/files/private/jcp/jcp-2.0.40035.zip>`_ входит справочная документация. Инструкцию по установке можно найти в папке *Doc/\ЖТЯИ.00091-01-JCP*. Проверьте правильность пути до исполняемого пакета JRE. Для использования `CryptoPro JCP <https://www.cryptopro.ru/sites/default/files/private/jcp/jcp-2.0.40035.zip>`_ достаточно опций:

* Криптопровайдер JCP.
* Модуль шифрования.
* CAdES, XAdES требуют установки зависимых пакетов ``bcpkix-jdk15on-1.50.jar`` и ``bcprov-jdk15on-1.50.jar``. Скопируйте файлы *jcp-2.0.40035.zip/dependencies/bcpkix-jdk15on-1.50.jar* и *jcp-2.0.40035.zip/dependencies/bcprov-jdk15on-1.50.jar* в  **$JAVA_HOME/jre/lib/ext** (после ручной установки).

.. _linux1:

Linux
~~~~~~~~~~~

Пропишите переменные окружения Java JDK для всех пользователей, набрав в терминале команду:
    
     .. code:: js 

           sudo vi /etc/profile.d/oracle.share

В данный файл внесите значения переменных окружения:
    
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

Обеспечьте пользователей необходимыми правами:
     
     .. code:: js

         sudo chmod 777 -R /opt/jdk1.8.0_xxx/jre/.systemPrefs

Для установки «КриптоПро JCP» используйте следующую команду:

    .. code:: js

         ./setup_console .sh </opt/jdk1.8.0_xxx/bin/java>

Следуйте шагам скрипта для установки «КриптоПро JCP».

.. _mac1:

Mac
~~~~~~~~~

Для установки Java JDK используйте официальный сайт Oracle. Следуйте инструкциям сайта по установке пакета "1.8.X_XXX" - версии. Вы можете использовать OpenJDK.

        .. code:: js

         brew install adoptopenjdk/openjdk/adoptopenjdk-openjdk8
        
Установите значение ``JAVA_HOME`` равным ``/usr/local/Cellar/adoptopenjdk-openjdk8/jdk8u172-b11``.

Для установки «КриптоПро JCP» используйте следующую команду:

    .. code:: js

         ./setup_console .sh </usr/local/Cellar/adoptopenjdk-openjdk8/jdk8u172-b11>

Следуйте шагам скрипта для установки «КриптоПро JCP».
