��    +      t  ;   �      �  n  �     (     .     =     A  �  I  a   �  A  ;  !   }	  U   �	  N   �	  c   D
  �   �
  t   �      �  %  H  �  �     >   �  ]     [   i  U  �  #     "   ?  X   b  D   �  �      �   �  p   t  �   �  �   k  G   N  �   �  �  9  H  �  I  +  {   u    �  %   �          6  C  R  r  �   ;  	"     E#     K#     Z#     ^#  �   f#  G   P$  V  �$     �%  9   &  0   ;&  :   l&  d   �&  3   '  �   @'    �'  �   �(  U   �)  "   �)  )   �)  )   '*  �   Q*     +     +  (   )+      R+  f   s+  f   �+  B   A,  e   �,  b   �,      M-  o   n-    �-  �   �.  �   �/  ]   �0  �   41     �1     �1     �1  Z  2                                        *              %            +          )           	   
   (            !   '                &       #                  "                                        $        CAdES, XAdES требуют установки зависимых пакетов ``bcpkix-jdk15on-1.50.jar`` и ``bcprov-jdk15on-1.50.jar``. Скопируйте файлы *jcp-2.0.39014.zip/dependencies/bcpkix-jdk15on-1.50.jar* и *jcp-2.0.39014.zip/dependencies/bcprov-jdk15on-1.50.jar* в  **$JAVA_HOME/jre/lib/ext** (после ручной установки). Linux Linux (Ubuntu) Mac Windows Windows позволяет устанавливать ПО КриптоПро JCP при помощи командной строки или графического интерфейса. Используйте один из двух типов установки согласно инструкции **ЖТЯИ.00091-01 91 01. Инструкция по использованию** для Windows. В данный файл внесите значения переменных окружения: В состав дистрибутива `CryptoPro JCP 2.0.39014 <https://www.cryptopro.ru/sites/default/files/private/jcp/jcp-2.0.39014.zip>`_ входит справочная документация. Инструкцию по установке можно найти в папке *Doc/\ЖТЯИ.00091-01-JCP*. Проверьте правильность пути до исполняемого пакета JRE. Для использования `CryptoPro JCP <https://www.cryptopro.ru/sites/default/files/private/jcp/jcp-2.0.39014.zip>`_ достаточно опций: ГОСТ-криптография Директория для jar-файла и библиотек - /usr/share/vostok/ Директория для данных блокчейна - /var/lib/vostok/ Директория для конфигурационного файла - /etc/vostok/vostok.conf Для использования КриптоПро прочтите соответствующий раздел установки под Linux из инструкции **ЖТЯИ.00091-01 91 01. Инструкция по использованию**. Для остановки ноды можно использовать сочетание клавиш ``ctrl + C``. Для установки Java JDK используйте официальный сайт Oracle. Следуйте инструкциям сайта по установке пакета "1.8.X_XXX" - версии. Вы можете использовать OpenJDK Если Java-пакеты не установлены, то вам следует скачать и установить `JRE 1.8 (64-bit) <http://www.oracle.com/technetwork/java/javase/downloads/2133155>`_, соответствующий вашей ОС. Для скачивания дистрибутива необходимо пройти регистрацию на сайте компании Oracle. Если в процессе инсталляции возникают ошибки, связанные с JRE, то необходимо проверить корректность пути до исполняемого файла java пакета JRE, указанного в системной переменной ``PATH``. Если на сервере стоит несколько версий Java JDK, то необходимо зарегистрировать альтернативы для новой версии. Запуск ноды выполняется командой: Запустите ноду, набрав в командной строке вашей ОС: Запустите ноду, набрав в консоли вашей ОС команду: Корректность установки можно проверить, набрав в консоли вашей ОС команду ``java -version``. Если отображается следующий результат, то можно переходить к следующему шагу - "Установка КриптоПРО". Криптопровайдер JCP. Модуль шифрования. Обеспечьте пользователей необходимыми правами: Остановка ноды выполняется командой: Отредактируйте конфигурационный файл в соответствии с руководством :ref:`"Конфигурация ноды" <configuration>`. Отредактируйте конфигурационный файл в соответствии с руководством :ref:`Конфигурация ноды <configuration>`. Платформа Waves Enterprise поддерживает только версию CryptoPro ``2.0.39014`` ! При использовании Waves-криптографии устанавливать CryptoPro JCP необязательно. При установке КриптоПро под MAC используйте соответствующий раздел инструкции **ЖТЯИ.00091-01 91 01. Инструкция по использованию**. Проверка предустановленных Java-пакетов Пропишите переменные окружения Java JDK для всех пользователей, набрав в терминале команду: Скачайте `актуальный релиз <https://github.com/waves-enterprise/WE-releases>`_ ноды в jar-формате и шаблон конфигурационного файла со страницы проекта в `GitHub <https://github.com/waves-enterprise/WE-releases/tree/master/configs>`_. Самая свежая версия приложений находится в шапке страницы: Скачайте `актуальный релиз <https://github.com/waves-enterprise/WE-releases>`_ ноды в формате deb-пакета и шаблон конфигурационного файла со страницы проекта в `GitHub <https://github.com/waves-enterprise/WE-releases/tree/master/configs>`_. Скачайте и установите пакет `CryptoPro JCP 2.0.39014 <https://www.cryptopro.ru/sites/default/files/private/jcp/jcp-2.0.39014.zip>`_ , согласно вашему типу ОС. Для скачивания дистрибутива необходимо пройти регистрацию на сайте. Установите значение ``JAVA_HOME`` равным `` /usr/local/Cellar/adoptopenjdk-openjdk8/jdk8u172-b11 `` Установите ноду из скачанного deb-пакета, соответствущего дистрибутиву Linux. Ниже приведен пример для .deb-пакета. Команда для установки следующая: Установка КриптоПро Установка ПО Установка ноды Установку нод для платформы Waves Enterprise необходимо выполнять на отдельной машине от нод блокчейн-платформы Waves. Нода предоставляет возможность использовать ГОСТ-криптографию на базе КриптоПро и встроенный модуль Waves-криптографии. От типа используемой криптографии зависит список предустановленных пакетов для ноды. Project-Id-Version: Vostok master
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-10-08 17:12+0300
PO-Revision-Date: 2019-10-09 14:51+0300
Last-Translator: 
Language: en
Language-Team: 
Plural-Forms: nplurals=2; plural=(n != 1);
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.7.0
X-Generator: Poedit 2.2.1
 Pakages: CAdES, XAdES, have a dependencies install ``bcpkix-jdk15on-1.50.jar`` and ``bcprov-jdk15on-1.50.jar``. After installation, please, copy files *jcp-2.0.39014.zip/dependencies/bcpkix-jdk15on-1.50.jar* and *jcp-2.0.39014.zip/dependencies/bcprov-jdk15on-1.50.jar* into the directory **$JAVA_HOME/jre/lib/ext**. Linux Linux (Ubuntu) Mac Windows Windows allows you to install JCP CryptoPro software using the command line or graphical interface. Use one of the two types of installation according to the instructions **ЖТЯИ.00091-01 91 01. Instructions for use** for Windows. Enter the following values of the environment variables into this file: The installation guide is included into the `CryptoPro JCP 2.0.39014 <https://www.cryptopro.ru/sites/default/files/private/jcp/jcp-2.0.39014.zip>`_ distributive. You can find the installation guide in the *Doc/\ЖТЯИ.00091-01-JCP* directory. Also you need to ensure the execution JRE package path is correct. Use the following option list: GOST cryptography Directory for jar-file and libraries - /usr/share/vostok/ Directory for blockchain data - /var/lib/vostok/ Directory for configuration file - /etc/vostok/vostok.conf To install CryptoPro use the appropriate installation section for Linux **ЖТЯИ.00091-01 91 01**. You can use the ``ctrl + C`` keys to stop the node. Use the official Oracle website to install Java JDK. Follow the instructions of the site to install "1.8.X_XXX" package - version. You can use OpenJDK If Java packages are not installed, you should download and install `JRE 1.8 (64-bit) <http://www.oracle.com/technetwork/java/javase/downloads/2133155>`_, which is fit to your OS. Also you need to register on the Oracle website before downloading the installation package. If JRE related errors appear during installation, check if the path to java.exe file of JRE package is specified correctly in the system ``PATH`` variable. If you have several Java JDK versions than register the alternatives for the new one. Launch the node using the command: Run the node using the following command: Run the node using the following command: The correctness of the installation can be checked by the command ``java -version``. If you see the following result, you can proceed to the next step - the CryptoPro installation. Crypto-option for JSP. Crypto-app. Provide users with corresponding rights: Stop the node using the command: Edit the node configuration file according with the :ref:`Node configuration <configuration>` section. Edit the node configuration file according with the :ref:`Node configuration <configuration>` section. The Waves Enterprise platform only supports ``2.0.39014`` version! You do not need to install the CryptoPro JCP software if you want to use only the Waves cryptography. To install CryptoPro use the appropriate installation section for Mac **ЖТЯИ.00091-01 91 01**. Preinstalled Java packages check Write environment variables for Java JDK for all users by default typing the following command in the terminal: Download the `latest release <hhttps://github.com/waves-enterprise/WE-releases>`_ of the node in the deb-package format and the config file template from the `GitHub <https://github.com/waves-enterprise/WE-releases/tree/master/configs>`_. The latest version is on the top: Download the `latest release <https://github.com/waves-enterprise/WE-releases>`_ of the node in the deb-package format and the config file template from the `GitHub <https://github.com/waves-enterprise/WE-releases/tree/master/configs>`_. Download and install `CryptoPro JCP 2.0.39014 <https://www.cryptopro.ru/sites/default/files/private/jcp/jcp-2.0.39014.zip>`_ according with the your OS type. You need to register on the CryptoPro website before downloading the installation package. Set the value for ``JAVA_HOME`` as `` /usr/local/Cellar/adoptopenjdk-openjdk8/jdk8u172-b11 `` Install the node using the downloaded deb package corresponding to the Linux distributive. An example below is for the .deb package. The installation command is: CryptoPro Installation Node Installation Node Installation To avoid software conflicts Waves Enterprise nodes installation must be performed on a separate machine from the Waves blockchain platform nodes. The node allows to use the GOST cryptography based on the CryptoPro software as well as the embedded Waves cryptography module. The list of node supporting packages depends on the cryptography scheme. 