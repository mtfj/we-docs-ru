��    #      4  /   L           	               "  �  *  �   �  @   l  !   �  U   �  N   %  c   t  t   �    M  H  V  �   �	  >   e
  [   �
  U     #   V  "   z  D   �  �   �  �   �  p   V  �   �     M  G   e  �  �  H  V    �  %   �     �     �  C     I  D     �     �     �     �  �   �  o   �  3        <  9   N  0   �  :   �  3   �  �   (  �   �  U   [  "   �  )   �  �   �     �  
   �      �  f   �  f   \  B   �  e        l      p    �  �   �  �   �      5!     L!     ^!  Z  p!                                 
                                      "                                   #      !      	                                       Linux Linux (Ubuntu) Mac Windows Windows позволяет устанавливать ПО КриптоПро JCP при помощи командной строки или графического интерфейса. Используйте один из двух типов установки согласно инструкции **ЖТЯИ.00091-01 91 01. Инструкция по использованию** для Windows. generators-x.x.x.jar - утилита для настройки параметров ноды Waves Enterprise и создания аккаунтов пользователей. node-x.x.x.jar - приложение ноды Waves Enterprise; ГОСТ-криптография Директория для jar-файла и библиотек - /usr/share/vostok/ Директория для данных блокчейна - /var/lib/vostok/ Директория для конфигурационного файла - /etc/vostok/vostok.conf Для остановки ноды можно использовать сочетание клавиш ``ctrl + C``. Для установки Java JDK используйте официальный сайт Oracle. Следуйте инструкциям сайта по установке пакета "1.8.X_XXX" - версии. Вы можете использовать OpenJDK Если в процессе инсталляции возникают ошибки, связанные с JRE, то необходимо проверить корректность пути до исполняемого файла java пакета JRE, указанного в системной переменной ``PATH``. Если на сервере стоит несколько версий Java JDK, то необходимо зарегистрировать альтернативы для новой версии. Запуск ноды выполняется командой: Запустите ноду, набрав в консоли вашей ОС команду: Корректность установки можно проверить, набрав в консоли вашей ОС команду ``java -version``. Если отображается следующий результат, то можно переходить к следующему шагу - "Установка КриптоПРО". Криптопровайдер JCP. Модуль шифрования. Остановка ноды выполняется командой: Отредактируйте конфигурационный файл в соответствии с руководством :ref:`"Конфигурация ноды" <configuration>`. Отредактируйте конфигурационный файл в соответствии с руководством :ref:`Конфигурация ноды <configuration>`. Платформа Waves Enterprise поддерживает только версию CryptoPro ``2.0.39014`` ! При использовании Waves-криптографии устанавливать CryptoPro JCP необязательно. Провайдер TLS. Проверка предустановленных Java-пакетов Скачайте `актуальный релиз <https://github.com/waves-enterprise/WE-releases>`_ ноды в jar-формате и шаблон конфигурационного файла со страницы проекта в `GitHub <https://github.com/waves-enterprise/WE-releases/tree/master/configs>`_. Самая свежая версия приложений находится в шапке страницы: Скачайте `актуальный релиз <https://github.com/waves-enterprise/WE-releases>`_ ноды в формате deb-пакета и шаблон конфигурационного файла со страницы проекта в `GitHub <https://github.com/waves-enterprise/WE-releases/tree/master/configs>`_. Установите ноду из скачанного deb-пакета, соответствущего дистрибутиву Linux. Ниже приведен пример для .deb-пакета. Команда для установки следующая: Установка КриптоПро Установка ПО Установка ноды Установку нод для платформы Waves Enterprise необходимо выполнять на отдельной машине от нод блокчейн-платформы Waves. Нода предоставляет возможность использовать ГОСТ-криптографию на базе КриптоПро и встроенный модуль Waves-криптографии. От типа используемой криптографии зависит список предустановленных пакетов для ноды. Project-Id-Version: Vostok master
Report-Msgid-Bugs-To: 
PO-Revision-Date: 2019-09-09 14:25+0300
Last-Translator: 
Language: en
Language-Team: 
Plural-Forms: nplurals=2; plural=(n != 1);
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.7.0
X-Generator: Poedit 2.0.6
 Linux Linux (Ubuntu) Mac Windows Windows allows you to install JCP CryptoPro software using the command line or graphical interface. Use one of the two types of installation according to the instructions **ЖТЯИ.00091-01 91 01. Instructions for use** for Windows generators-x.x.x.jar - the utility for setting the Waves Enterprise node parameters and creating user accounts. node-x.x.x.jar - Waves Enterprise Node Application; GOST cryptography Directory for jar-file and libraries - /usr/share/vostok/ Directory for blockchain data - /var/lib/vostok/ Directory for configuration file - /etc/vostok/vostok.conf You can use the ``ctrl + C`` keys to stop the node. Use the official Oracle website to install Java JDK. Follow the instructions of the site to install "1.8.X_XXX" package - version. You can use OpenJDK If JRE related errors appear during installation, check if the path to java.exe file of JRE package is specified correctly in the system ``PATH`` variable. If you have several Java JDK versions than register the alternatives for the new one. Launch the node using the command: Run the node using the following command: The correctness of the installation can be checked by the command ``java -version``. If you see the following result, you can proceed to the next step - the CryptoPro installation. Crypto-option for JSP Crypto-app Stop the node using the command: Edit the node configuration file according with the :ref:`Node configuration <configuration>` section. Edit the node configuration file according with the :ref:`Node configuration <configuration>` section. The Waves Enterprise platform only supports ``2.0.39014`` version! You do not need to install the CryptoPro JCP software if you want to use only the Waves cryptography. TLS Preinstalled Java packages check Download the `latest release <hhttps://github.com/waves-enterprise/WE-releases>`_ of the node in the deb-package format and the config file template from the `GitHub <https://github.com/waves-enterprise/WE-releases/tree/master/configs>`_. The latest version is on the top: Download the `latest release <https://github.com/waves-enterprise/WE-releases>`_ of the node in the deb-package format and the config file template from the `GitHub <https://github.com/waves-enterprise/WE-releases/tree/master/configs>`_. 3. Install the node using the downloaded deb package corresponding to the Linux distributive. An example below is for the .deb package. The installation command is: CryptoPro Installation Node Installation Node Installation To avoid software conflicts Waves Enterprise nodes installation must be performed on a separate machine from the Waves blockchain platform nodes. The node allows to use the GOST cryptography based on the CryptoPro software as well as the embedded Waves cryptography module. The list of node supporting packages depends on the cryptography scheme. 