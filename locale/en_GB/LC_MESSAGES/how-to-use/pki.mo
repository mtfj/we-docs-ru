��          L      |       �   O   �   }   �   u  w  !  �  /     {  ?  +   �  E   �  E  -  �   s  $   	                                         Как установить корневой сертификат на ноду Корневой сертификат устанавливается в следующую папку со средой Java: Нода имеет возможность проверять УКЭП (Усиленная квалифицированная электронная подпись), используя метод API :ref:`Post /pki/verify <pki-api>`. Для корректности работы метода API :ref:`Post /pki/verify <pki-api>` необходимо установить корневой сертификат на ноду. Корневой сертификат УЦ однозначно идентифицирует центр сертификации и является основанием в цепочке доверия. Пароль по умолчанию на хранилище сертификатов Java cacerts - ``changeit``. При желании вы можете изменить пароль. Установка сертификатов выполняется следующей командой: Работа с методом POST /pki/verify Project-Id-Version: Waves Enterprise 0.9.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-09-18 13:42+0300
PO-Revision-Date: 2019-09-18 13:43+0300
Last-Translator: 
Language: en
Language-Team: 
Plural-Forms: nplurals=2; plural=(n != 1);
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.7.0
X-Generator: Poedit 2.2.1
 How to install a root certificate on a node The root certificate is installing into the following Java directory: Using API :ref:`Post /pki/verify <pki-api>` method you can verify qualified digital signature. You need to install the root certificate on the node for proper using of API :ref:`Post /pki/verify <pki-api>` method. The CA root certificate uniquely identifies the certification authority and is the basis in the chain of trust. The default password for the Java cacerts certificate store is ``changeit``. You can change the password if you wish. Install certificates using the following command: Working with POST /pki/verify method 