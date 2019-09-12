��          �      |      �     �  9   	  �   C    �  g   �  3   a  t   �  q   
  e   |  m   �  g   P  l   �  ]   %  o   �  l   �  o   `  �   �  z   Z	  `   �	  (   6
  �   _
  r       �  /   �  t   �  �   ;  @   �  -   "  J   P  A   �  =   �  K     7   g  1   �  C   �  9     I   O  B   �  U   �  <   2  :   o     �  q   �                            
                                                              	       **Параметры:** ``allow-net-access`` - доступ к сети (yes/no). ``check-registry-auth-on-startup`` - обязательность проверки авторизации к репозиториям при запуске ноды (yes/no). ``contract-execution-messages-cache`` - секция настройки кеш-памяти Docker-контракта. При достижении лимита буфера нода обработает все сообщения в пакетном режиме: ``docker-auth`` - секция базовой авторизации по логину и паролю. ``docker-host`` - URL-адрес Docker-хоста. ``enable`` - включение обработки транзакций для docker-контрактов (yes/no). ``execution-limits`` - секция ограничений на выполнение Docker-контрактов: ``expire-after`` - время жизни сообщений в кеш-памяти в минутах; ``integration-tests-mode-enable`` - режим тестирования Docker-контрактов (yes/no). ``max-buffer-size`` - максимальное количество сообщений в буфере; ``max-buffer-time`` - максимальное время для буфера в миллисекундах. ``memory-swap`` - файл подкачки памяти для контракта (в Мб). ``memory`` - ограничение по памяти для контейнера контракта (в Мб); ``node-rest-api`` - URL-адрес к REST API ноды при использовании Docker-хоста. ``remote-registries`` - адреса удаленных репозиториев и доступов к ним. ``remove-container-after`` - обязательность удаления контейнера после исполнения (yes/no). ``reuse-containers`` - повторное использование существующего Docker-контракта. ``timeout`` - таймаут на выполнение контракта (в секундах); Запуск docker-контрактов Установка и исполнение docker-контрактов задается объектом ``docker-engine`` в конфигурационном файле ноды. Project-Id-Version: Vostok master
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-09-12 17:06+0300
PO-Revision-Date: 2019-09-12 17:06+0300
Last-Translator: 
Language: en
Language-Team: 
Plural-Forms: nplurals=2; plural=(n != 1);
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.7.0
X-Generator: Poedit 2.2.1
 **Parameters:** ``allow-net-access`` - network access (yes/no). ``check-registry-auth-on-startup`` - mandatory verification of authorization for registry upon node launch (yes/no). ``contract-execution-messages-cache`` - memory-cached  Docker-smart contract options limits.Node runs in a packedge-data if  memory-cache of smart contract are full: ``docker-auth`` - basic authorization section by login+password. ``docker-host`` - URL-address of Docker-host. ``enable`` - enables transaction processing for Docker contracts (yes/no). ``execution-limits`` - section  limitsfor runing smart contracts: ``expire-after`` -  time-to-live per minutes in memory-cache; ``integration-tests-mode-enable`` - Docker contracts testing mode (yes/no). ``max-buffer-size`` - max counter of buffered messages; ``max-buffer-time`` - max time for buffer per ms. ``memory-swap`` - memory swap limit for contract container (in MB). ``memory`` - memory limit for contract container (in MB); ``node-rest-api`` - URL-address for node's REST API of Docker-host using. ``remote-registries`` - addresses and access to remote registries. ``remove-container-after`` - mandatory removal of container after execution (yes/no). ``reuse-containers`` - using existing docker smart contract. ``timeout`` - timeout for contract execution (in seconds); Launching Docker Contracts Installation and execution of Docker contracts is set by object ``docker-engine`` in the node configuration file. 