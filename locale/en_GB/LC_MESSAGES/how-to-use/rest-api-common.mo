��          �      \      �     �     �  �   �  F   �  ,     (   D  1  m  �   �  5  V  (  �	  w  �  _  -  (   �  #   �  G  �     "  F   ?  2   �  i   �  {  #     �     �  �   �  7   P     �     �  �  �  m   �  w    �  �  v  *  �   �     �     �  �   �     v  7   �  !   �  :   �                                                  
                        	                         **URL к HTTP-методу** REST API ``ApiKey or PrivacyApiKey (apiKey)`` - значение ``api-key-hash`` как для общего доступа к REST API ноды, так и для доступа к методам :ref:`privacy <privacy-api>`. ``OAuth2 Bearer (apiKey)`` - значение **access** токена. Авторизация по ``api-key-hash`` Авторизация по токену Блокчейн-платформа Waves Enterprise предоставляет возможность взаимодействия с блокчейном как в части получения данных (транзакции, блоки, балансы и др.), так и в части записи информации в блокчейн (подписание и отправка транзакций) при помощи RESTful API ноды. REST API позволяет пользователям удалённо взаимодействовать с нодой через запросы и ответы в формате JSON. Работа с API происходит по протоколу HTTPS. Удобным интерфейсом к API служит известный фреймворк Swagger. В зависимости от метода авторизации указываются разные значения для получения доступа к REST API ноды. Все вызовы методов API — это GET, POST или DELETE HTTPS-запросы к URL ``https://yournetwork.com/node-N/api-docs/swagger.json`` с набором параметров. В интерфейсе Swagger выбираются нужные группы запросов и далее маршруты с точками доступа. Маршрут в Swagger это URL к HTTP-методу, а точка доступа (endpoint) - конечная часть маршрута, само обращение к методу. Пример: Генерация значения ``api-key-hash`` выполняется при :ref:`конфигурации ноды <auth-api-key-setup>`. Также получить значение поля ``rest-api.api-key-hash`` можно при помощи метода :ref:`/utils/hash/secure <utils-hash>` REST API ноды. Для подписания запросов ключем из keystore ноды в поле ``password`` запроса ``POST /transaction/sign`` требуется указания пароля доступа к keystore. Для запросов, требующих нижеперечисленных действий, необходима обязательная авторизация по ``api-key-hash``. Тип авторизации устанавливается в конфигурационном файле ноды. Если выбран тип авторизации по ``api-key-hash``, то при авторизации необходимо указывать значение секретной фразы, hash которой указан в конфигурационном файле ноды (поле ``rest-api.api-key-hash``). Если используется :ref:`сервис авторизации <authorization-service>`, для доступа к ноде и другим сервисам клиент получает пару токенов - **refresh** и **access**. Токены можно получить через REST API сервиса авторизации. Как использовать REST API Методы авторизации При авторизации по токену в соответствующем поле указывается значение **access** токена. Если выбрана авторизация по токену, в таком случае закрыты все методы REST API для доступа к ноде. Пример запроса: доступ к keystore ноды (например, метод sign); доступ к конфигурации ноды. доступ к операциям с группами доступа к приватным данным; Project-Id-Version: Waves Enterprise 0.9.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-11-05 15:34+0300
PO-Revision-Date: 2019-11-05 15:45+0300
Last-Translator: 
Language: en
Language-Team: 
Plural-Forms: nplurals=2; plural=(n != 1);
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.7.0
X-Generator: Poedit 2.2.1
 **URL to the HTTP-method** REST API ``ApiKey or PrivacyApiKey (apiKey)`` - ``api-key-hash`` value for both access to the node REST API and :ref:`privacy <privacy-api>` methods. ``OAuth2 Bearer (apiKey)`` - an **access** token value. ``api-key-hash`` authorization Token authorization The Waves Enterprise blockchain platform provides an opportunity to interact with blockchain both in terms of receiving data (transactions, blocks, balances, etc.) and in terms of writing information to blockchain (signing and sending transactions) via RESTful API of the node. REST API allows users to interact remotely with the node using requests and responses in JSON format. HTTPS protocol is using to work with API and as an interface it is utilized the Swagger framework. Depending on the authorization method, different values are specified to get the access to the node REST API. All API methods are including GET, POST or DELETE HTTPS requests to URL ``https://yournetwork.com/node-N/api-docs/swagger.json`` using the set of parameters. The requests groups with routes and endpoints are selected in the Swagger interface. The route is the URL of the HTTP method, and the endpoint is the final part of the route, this is the access to the method. Example: The ``api-key-hash`` generation is happening during the :ref:`node configuration <auth-api-key-setup>`. The value of the field ``rest-api.api-key-hash`` can be also generated using the :ref:`/utils/hash/secure <utils-hash>` method of node REST API. It is required to specify the access password to the keystore in the ``password`` field of the ``POST /transaction/sign`` request for signing requests by the node keystore key. For requests requiring the following actions, mandatory authorization by ``api-key-hash`` is required. The authorization type is specified in the node configuration file. If ``api-key-hash`` authorization type is selected, it is necessary to specify the value of the secret phrase, the hash of which is wrote in the node configuration file (``rest-api.api-key-hash`` field). If the :ref:`authorization service <authorization-service>` is used, the client receives a pair of tokens - **refresh** and **access** - for the node and other services access. Tokens can be obtained via the authorization service REST API. How to use REST API Authorization methods When authorized by token, the value of **access** token is specified in the corresponding field. If token authorization is selected, then all REST API methods for node access are closed. Sample query: access to the node keystore (for example, sign method); access to the node configuration. access to operations with confidential data access groups; 