��          |      �             !     ?     ]     d     y     �  �   �  �   �  �   
     �  �   m  o  4     �     �     �     �     �        v     H   �  �   �  V   b  m   �                   	                    
                    **Запрос метода** **Пример ответа** Crypto POST /crypto/decrypt POST /crypto/encryptCommon POST /crypto/encryptSeparate Зашифровывает данные единым ключом CEK для всех получателей, CEK оборачивается уникальными KEK для каждого получателя. Зашифровывает текст отдельно для каждого получателя уникальным ключом. Описание шифрования текстовых данных представлено в подразделе :ref:`Зашифрование текстовых данных в транзакциях <crypto-data-tx>`. Правила формирования запросов к ноде приведены в разделе :ref:`rest-api-node`. Расшифровывает данные. Расшифровка доступна в случае, если ключ получателя сообщения находится в keystore ноды. Project-Id-Version: Vostok 1.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-07-26 18:00+0300
PO-Revision-Date: 2019-07-26 18:01+0300
Last-Translator: 
Language: en
Language-Team: 
Plural-Forms: nplurals=2; plural=(n != 1);
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
X-Generator: Poedit 2.2.1
 **Method Query** **Method Response** Crypto POST /crypto/decrypt POST /crypto/encryptCommon POST /crypto/encryptSeparate Encrypts the data with a single CEK key for all recipients and the CEK wraps into a unique KEK for the each recipient. Encrypts the text separately for the each recipient with the unique key. The description of text data encryption is presented in the subsection :ref:`Encrypting text data in transactions <crypto-data-tx>`. The rules for generating queries to the node are given in module :ref:`rest-api-node`. Decrypts the data. The decryption is available only if the message recipient's key is in the node's keystore. 