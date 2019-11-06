��          �      l      �     �               !     #  	   %     /     7     K     O  �   `  O   C  }   �      u  .  !  �  /   �	     �	     
     
  o   
     �     �     �     �     �  	   �     �     �     �     �  �   �  +   �  E   �  !    >  )  �   h  $        5     N     h                                         
                                     	                    **Пример запроса** **Пример ответа** 1 2 3 CAdES-BES CAdES-T CAdES-X Long Type 1 PKI POST /pki/verify В PKI используются форматы ЭП, представленные в таблице ниже. Номер формата ЭП из таблицы соответствует значению поля ``sigtype``. Как установить корневой сертификат на ноду Корневой сертификат устанавливается в следующую папку со средой Java: Метод выполняет проверку УКЭП для данных, переданных в запросе. Поле ``extendedKeyUsageList`` является опциональным и может содержать массив значений OID (Объектный идентификатор) для определения области действия сертификата. Проверку сертификата может осуществлять любая нода, имеющая параметры запроса. Нода имеет возможность проверять УКЭП (Усиленная квалифицированная электронная подпись), используя метод API :ref:`Post /pki/verify <pki-api>`. Для корректности работы метода API :ref:`Post /pki/verify <pki-api>` необходимо установить корневой сертификат на ноду. Корневой сертификат УЦ однозначно идентифицирует центр сертификации и является основанием в цепочке доверия. Пароль по умолчанию на хранилище сертификатов Java cacerts - ``changeit``. При желании вы можете изменить пароль. Установка сертификатов выполняется следующей командой: Работа с методом POST /pki/verify Формат ЭП Форматы ЭП № Project-Id-Version: Vostok 1.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-10-29 14:11+0300
PO-Revision-Date: 2019-11-05 15:57+0300
Last-Translator: 
Language: en
Language-Team: 
Plural-Forms: nplurals=2; plural=(n != 1);
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.7.0
X-Generator: Poedit 2.2.1
 **Request example** **Answer example** 1 2 3 CAdES-BES CAdES-T CAdES-X Long Type 1 PKI POST /pki/verify Digital signature formats listed in the table below is used in PKI. The digital signature number in the table is consistent for the ``sigType`` field value. How to install a root certificate on a node The root certificate is installing into the following Java directory: This method checks the detached digital signature for the sent data. The ``extendedKeyUsageList`` is optional and may contain an array of object identifiers - OID. It is useful for the determination of the scope of the certificate. Any node with query parameters can check the certificate. Using API :ref:`Post /pki/verify <pki-api>` method you can verify qualified digital signature. You need to install the root certificate on the node for proper using of API :ref:`Post /pki/verify <pki-api>`. The CA root certificate uniquely identifies the certification authority and is the basis in the chain of trust. The default password for the Java cacerts certificate store is ``changeit``. You can change the password if you wish. Install certificates using the following command: Working with POST /pki/verify method Digital signature format Digital signature formats # 