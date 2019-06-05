��          �               �      �   :        U  -  g  5  �  �  �  v  q  (   �	     
  h   .
  F   �
  2   �
  X     W  j     �  '   �       �    w  �  B  `  �   �     m     �  J   �  7   �  !     8   4   **URL к HTTP-методу** **Спецификация интерфейса ноды** REST API ноды Блокчейн-платформа Восток предоставляет возможность взаимодействия с блокчейном как в части получения данных (транзакции, блоки, балансы и др.), так и в части записи информации в блокчейн (подписание и отправка транзакций) при помощи RESTful API ноды. REST API позволяет пользователям удалённо взаимодействовать с нодой через запросы и ответы в формате JSON. Работа с API происходит по протоколу HTTPS. Удобным интерфейсом к API служит известный фреймворк Swagger. Все вызовы методов API — это GET, POST или DELETE HTTPS-запросы к URL ``https://yournetwork.com/node-N/api-docs/swagger.json`` с набором параметров. В интерфейсе Swagger выбираются нужные группы запросов и далее маршруты с точками доступа. Маршрут в Swagger это URL к HTTP-методу, а точка доступа (endpoint) - конечная часть маршрута, само обращение к методу. Пример: Генерация значения поля ``rest-api.api-key-hash`` выполняется с использованием метода :ref:`/utils/hash/secure <utils-hash>` REST API ноды. Для подписания запросов ключем из keystore ноды в поле ``password`` запроса ``POST /transaction/sign`` требуется указания пароля доступа к keystore. Для запросов, требующих нижеперечисленных действий, необходима обязательная передача параметра ``X-Api-Key`` со значением секретной фразы, hash которой указан в конфигурационном файле ноды (поле ``rest-api.api-key-hash``): Как использовать REST API Пример запроса: Примеры транзакций приведены на странице :ref:`transaction-example`. доступ к keystore ноды (например, метод sign); доступ к конфигурации ноды. изменение состояния ноды (например, метод broadcast); Project-Id-Version: Vostok master
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-05-14 11:15+0300
PO-Revision-Date: 2019-05-14 11:42+0300
Last-Translator: 
Language: en
Language-Team: 
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 **URL to the HTTP-method** **Specification of the node interface** REST API Node The Vostok blockchain platform provides an opportunity to interact with blockchain both in terms of receiving data (transactions, blocks, balances, etc.) and in terms of writing information to blockchain (signing and sending transactions) via RESTful API of the node. REST API allows users to interact remotely with the node using requests and responses in JSON format. HTTPS protocol is using to work with API and as an interface it is utilized the Swagger framework. All API methods are including GET, POST or DELETE HTTPS requests to URL ``https://yournetwork.com/node-N/api-docs/swagger.json`` using the set of parameters. The requests groups with routes and endpoints are selected in the Swagger interface. The route is the URL of the HTTP method, and the endpoint is the final part of the route, this is the access to the method. Example: The value of the field ``rest-api.api-key-hash`` is generated using the following method :ref:`/utils/hash/secure <utils-hash>` of REST API node. It is required to specify the access password to the keystore in the field ``password`` of the request ``POST /transaction/sign`` for signing requests by the node keystore key. For the followed below requests mandatory transfer of ``X-Api-Key`` parameter with the value of a secret phrase whose hash is specified in the node configuration file (field ``rest-api.api-key-hash``): How to use REST API Sample query: Examples of transactions are given on the page :ref:`transaction-example`. access to the node keystore (for example, sign method); access to the node configuration. changing the node state (for example, broadcast method); 