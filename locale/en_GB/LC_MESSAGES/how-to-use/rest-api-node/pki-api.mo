��          �      �           	     )     G     I     K     M     O  	   Q     [     c     k          �     �     �  �   �  �   �  ~        �          )     =  o  A     �     �     �     �     �     �     �  	   �     �     �     �                    )  �   :  D   �  1     V   N     �     �     �                                                           	                              
               **Пример запроса** **Пример ответа** 1 2 3 4 5 CAdES-BES CAdES-C CAdES-T CAdES-X Long Type 1 PKCS7 PKI POST /pki/sign POST /pki/verify В PKI используются форматы ЭП, представленные в таблице ниже. Номер формата ЭП из таблицы соответствует значению поля ``sigType``. Метод выполняет проверку отсоединённой ЭП для данных, переданных в запросе. Метод формирует отсоединённую ЭП для данных, передаваемых в запросе. Правила формирования запросов к ноде приведены в разделе :ref:`rest-api-node`. Формат ЭП Форматы ЭП № Project-Id-Version: Vostok 1.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-08-29 11:27+0300
PO-Revision-Date: 2019-08-29 11:43+0300
Last-Translator: 
Language: en
Language-Team: 
Plural-Forms: nplurals=2; plural=(n != 1);
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.7.0
X-Generator: Poedit 2.2.1
 **Request example** **Answer example** 1 2 3 4 5 CAdES-BES CAdES-C CAdES-T CAdES-X Long Type 1 PKCS7 PKI POST /pki/sign POST /pki/verify Digital signature formats listed in the table below is used in PKI. The digital signature number in the table is consistent for the ``sigType`` field value. This method checks the detached digital signature for the sent data. This method creates a detached digital signature. The rules for generating queries to the node are given in :ref:`rest-api-node` module. Digital signature format Digital signature fotmats # 