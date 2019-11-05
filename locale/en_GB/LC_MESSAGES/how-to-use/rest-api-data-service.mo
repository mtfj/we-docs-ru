��            )         �     �     �      �                @     L     a     s     �  
   �     �  
   �  C   �  _     �   x  �   8  �   �  �   �  �   -  �   �  �   �  w   /	  Q   �	  �   �	  M   �
     �
     �
     
  &     {  F     �     �      �          )     I     U     j     |     �  
   �     �     �  *   �  ;     Z   @  Y   �  Q   �  G   G  O   �  V   �  G   6  =   ~     �  ^   �  %   ;     a     n     t     �                         
                                                                                                  	             **Ответ метода:** GET /api/v1/txData/{key} GET /api/v1/txData/{key}/{value} GET /api/v1/txIds/{key} GET /api/v1/txIds/{key}/{value} GET /assets GET /blocks/{height} GET /transactions GET /transactions/count GET /transactions/id/{id} GET /users GET /users/{userAddress} Блоки Возвращает блок на указанной высоте. Возвращает информацию о пользователе по его адресу. Возвращает количество транзакций, соответствующих условиям поискового запроса и применённым фильтрам. Возвращает список доступных в блокчейне наборов токенов (в виде транзакций выпуска токенов). Возвращает список идентификаторов транзакций с данными, содержащих указанный ключ и значение. Возвращает список идентификаторов транзакций с данными, содержащих указанный ключ. Возвращает список пользователей, соответствующий условиям поискового запроса и применённым фильтрам. Возвращает список транзакций, соответствующий условиям поискового запроса и применённым фильтрам. Возвращает тела транзакций с данными, содержащие указанный ключ и значение. Возвращает тела транзакций с данными, содержащие указанный ключ. Возвращает транзакцию по идентификатору {id}. За один запрос через метод API **GET /transactions** возвращается не более 500 транзакций. Методы REST API для сервиса подготовки данных Наборы токенов Пользователи Транзакции Транзакции с данными Project-Id-Version: Waves Enterprise 0.9.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-10-29 14:11+0300
PO-Revision-Date: 2019-11-05 15:29+0300
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.7.0
Plural-Forms: nplurals=2; plural=(n != 1);
Last-Translator: 
Language-Team: 
Language: en
X-Generator: Poedit 2.2.1
 **Method Response:** GET /api/v1/txData/{key} GET /api/v1/txData/{key}/{value} GET /api/v1/txIds/{key} GET /api/v1/txIds/{key}/{value} GET /assets GET /blocks/{height} GET /transactions GET /transactions/count GET /transactions/id/{id} GET /users GET /users/{userAddress} Blocks Returns the block at the specified height. Returns information about the user as per user’s address. Returns the number of transactions matching the search query criteria and filters applied. Returns a list of token assets available in the blockchain (as token issue transactions). Returns a list of data transaction ID’s containing the specified key and value. Returns a list of data transaction ID’s containing the specified key. Returns a list of users matching the search query criteria and filters applied. Returns a list of transactions matching the search query criteria and filters applied. Returns data transaction bodies containing the specified key and value. Returns data transaction bodies containing the specified key. Returns transaction by ID {id}. It is returned a maximum of 500 transactions for the API **GET /transactions** method request. REST API methods for the data service Token assets Users Transactions Data transactions 