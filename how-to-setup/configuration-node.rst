.. _configuration:

Конфигурация ноды
====================

Подключение к существующей сети
----------------------------------------------------

Для подключения к существующей блокчейн-сети участнику необходимо:

1. Получить конфигурационный файл ноды с параметрами блокчейн-сети, к которой планируется подключение. Для упрощения подключения рекомендуется запросить готовый конфигурационный файл ноды у одного из участников сетевого взаимодействия. 

.. note:: Часть параметров конфигурационного файла описывают параметры блокчейн-сети к которой осуществляется подключение и не должны изменяться. Параметры, которые описывают конфигурацию нового узла и шаги по их настройке приведены ниже. 

| Для подключения к существующим общедоступным сетям Восток воспользуйтесь конфигурационным файлом из таблицы ниже.

==== ================================== ========================
#    Название сети                      Конфигурационный файл
==== ================================== ========================
1    PartnerNet                         `скачать <https://github.com/vostokplatform/Vostok-Releases/blob/master/configs/partnerNet.conf>`_
==== ================================== ========================

2. С помощью утилиты `generators-x.x.x+VST-x.x.x.jar <https://github.com/vostokplatform/Vostok-Releases/releases>`_ создать хотя бы одного участника сети на ноде (см. п. :ref:`1 <address-creation>` раздела :ref:`"Создание новой сети" <creation-new-net>`). Внести публичный ключ созданного участника в блок ``network-participants`` конфигурационного файла ноды и задать для него роли.

.. note:: При использовании :ref:`криптографии Waves <crypto-waves>` пользователь может быть создан автоматически при запуске ноды и предыдущий шаг можно пропустить. Для :ref:`ГОСТ-криптографии <crypto-gost>` ввиду необходимости использования биологического датчика случайных чисел, автоматическое создание пары ключей невозможно. 

3. Внести путь к хранилищу закрытых ключей участников сети, созданных на ноде, в блок ``wallet`` конфигурационного файла ноды. Путь к хранилищу задается в ``accounts.conf`` при создании участников сети (см. п. :ref:`1 <address-creation>` раздела :ref:`"Создание новой сети" <creation-new-net>`).
4. При необходимости активации :ref:`REST API интерфейса <rest-api-node>` на настраиваемом узле, необходимо с помощью утилиты `generators-x.x.x+VST-x.x.x.jar <https://github.com/vostokplatform/Vostok-Releases/releases>`_ создать ``api-key-hash`` для доступа к API (см. п. :ref:`2.10.-2.11. <configuration-rest-api>` раздела :ref:`"Создание новой сети" <creation-new-net>`). Полученный ключ необходимо внести в конфигурационный файл ноды.
5. Внести сетевые параметры ноды - IP-адрес/порт ноды (см. п. :ref:`2.7. <configuration-network>` раздела :ref:`"Создание новой сети" <creation-new-net>`) и IP-адрес/порт интерфейса REST API.
6. Если нода ранее работала с другой сетью блокчейна Vostok, то удалить данные из папки, указанной в параметре "data-directory" (по умолчанию, для ОС Ubuntu используется путь ``${user.home}/vostok``, для ОС Windows используется путь ``C:\Users\<username>\vostok``).
7. :ref:`Запустить ноду <install-node>`



.. _creation-new-net:

Создание новой сети
----------------------------------------------------

Для создания новой блокчейн-сети необходимо выполнить следующие действия:

.. _address-creation:

1. Создать участников сети (сгенерировать ключевые пары и адреса)

  .. important:: Для начала функционирования сети должен быть создан как минимум один участник с полномочиями :ref:`"permissioner" <authorization>` (назначает роли другим участникам). Если в вашей сети будет использован Proof-of-Stake алгоритм консенсуса, то также должен быть определен участник, который хранит первоначальный баланс активов создаваемой блокчейн-сети. 
  
  .. tip:: Советуем не использовать один адрес для хранения всего баланса сети. Безопаснее разделить его между несколькими участниками!

  | 1.1. Ключевая пара создается с использованием утилиты  `generators-x.x.x+VST-x.x.x.jar <https://github.com/vostokplatform/Vostok-Releases/releases>`_. Для запуска утилиты необходимо в качестве одного из параметров указать файл ``accounts.conf``, в котором определяются параметры генерации ключей. Команда для запуска: ``java -jar generators-x.x.x+VST-x.x.x.jar AccountsGeneratorApp accounts.conf``

  ::

    // accounts.conf listing

    accounts-generator {
      waves-crypto = yes
      chain-id = W
      amount = 1
      wallet = "c:/nodes/testnet-pos.vostoknodes.com/keystore.dat"
      wallet-password = "some string as password"
      reload-node-wallet {
        enabled = false
        url = "http://localhost:6869/utils/reload-wallet"
      }
    }

  **Описание параметров:**

| При указании пути необходимо использовать символ "прямого слэша" - ``/`` как разделитель уровней иерархии директорий. Пример конфигурационного файла приведен для ОС Windows. При работе в ОС Linux значение ``wallet`` должно соответствовать структуре каталогов операционной системы, например ``/home/contract/vostok/keystore.dat``. При настройке ноды не допускается использование кириллических символов при указании путей до рабочей директории, хранилища ключей и т.д.   
    
    - waves-crypto – выбор криптографического алгоритма ("yes" - использовать криптографию :ref:`Waves <crypto-waves>`, "no" - использовать :ref:`ГОСТ-криптографию <crypto-gost>`);
    - chain-id – идентифицирующий байт сети, потребуется дальше для внесения в параметр ``address-scheme-character`` в конфигурационный файл ноды;
    - amount – количество генерируемых адресов;
    - wallet – путь до каталога хранения ключей на ноде, потребуется дальше для внесения в параметр ``wallet > file`` в конфигурационный файл ноды. Для криптографии Waves указывается путь до файла ``keystore.dat`` (пример, ``${user.home}/vostok/keystore.dat``), для ГОСТ-криптографии - путь до директории (``${user.home}/vostok/keystore/``);
    - wallet-password – пароль для доступа к закрытым ключам ноды, потребуется дальше для внесения в параметр ``wallet > password`` в конфигурационный файл ноды;
    - reload-node-wallet - опция для обновления keyStore ноды без перезапуска приложения, по умолчанию - выключено (false). В параметре ``url`` указывается путь до метода ``/utils/reload-wallet`` REST API ноды. 

  | 1.2. При использовании :ref:`ГОСТ-криптографии <crypto-gost>` после запуска команды создания участников на экран будет выведено окно КриптоПро инициализации биологического датчика случайных чисел.

     .. image:: img/bio_rng.png
        :height: 250
 
  | После выполнения утилиты в папке, определенной параметром ``wallet``, будут сохранены закрытые ключи участников, а на экране отобразятся адреса и открытые ключи в виде строк:
  | ``[main] accounts-generator - Address: 3PCKG8vUUQhbqyQnKuokEXmje5FByPHWiBt; public key: 6GffUw1XkAnpM7upBu7RPkWfBZSGfDKpPDUY5TygvrL6`` 
  | 1.3. Сгенерированные адреса необходимо сохранить для указания в конфигурационном файле ноды. Информация по возможным ролям участников платформы приведена на странице :ref:`"Авторизация участников" <authorization>`.

    Начальный состав участников может быть следующим:
    
    ============  ============= ===========================================
    № участника   Роль          Назначение участника
    ============  ============= ===========================================
    1             permissioner  Выдача разрешений для других участников
    2             miner         Валидация и включение транзакций в блоки
    3             нет           Владелец первоначального баланса сети
    4             нет           Владелец первоначального баланса сети
    ============  ============= ===========================================

.. _configuration-node:

2. Скачать `шаблон <https://github.com/vostokplatform/Vostok-Releases/blob/master/configs/example.conf>`_ конфигурационного файла ноды и отредактировать его:

  | 2.1. Указать тип используемой криптографии (см. раздел :ref:`Криптография <cryptography>`)

    ::

      waves-crypto = yes
  
  | 2.2. Указать байт сети, с которым генерировались адреса участников сети (параметр ``chain-id`` в accounts.conf)
  
    ::

      address-scheme-character: "W"

  | 2.3. Указать общий баланс активов сети 
  
    ::

      genesis {
        initial-balance: 100000000000
  
  | 2.4. Указать :ref:`адреса участников <address-creation>` – владельцев начального баланса сети

    ::
   
      transactions = [
      {recipient: "3P9nhmAEec4bDKsmLEZy2raimNJTVqedu43", amount: 100000000000} ]

  | 2.5. Указать :ref:`публичные ключи участников сети <address-creation>` в блоке ``network-participants``

    ::

      network-participants = [ 
        {  public-key: "HaL7GYu5hKwkc64PGcByi2Hoe2VH2Uf2ueoD75rsf7SF", roles: [permissioner]  },
        {  public-key: "HaL7GYu5hKwkc64PGcByi2Hoe2VH2Uf2ueoD75rsf7SF", roles: [miner]  },
        {  public-key: "HaL7GYu5hKwkc64PGcByi2Hoe2VH2Uf2ueoD75rsf7SF", roles: [miner, contract_developer]  }
      ]


.. _configuration-network:

  | 2.7. Указать сетевые параметры настраиваемой ноды

    ::

      network {
        # Network address
        bind-address = "0.0.0.0"
        # Port number
        port = 6864


  | 2.8. Указать сетевые адреса (hostname) нод, которые будут подключены к сети 
  
    ::

      known-peers = [
        "privatenet-1.example.net:6864",
        "privatenet-2.exemple.net:6864" ]
  
  | В случае, если адреса дополнительных узлов сети не определены, допустимо указать пустое значение ``known-peers = [ ]``

  | 2.9. Указать путь и пароль от keystore - места хранения закрытых ключей участников сети, созданных на ноде (параметры ``wallet``, ``wallet-password`` в accounts.conf). Для криптографии Waves указывается путь до файла ``keystore.dat`` (пример, ``${user.home}/vostok/keystore.dat``), для ГОСТ-криптографии - путь до директории (``${user.home}/vostok/keystore/``)

    ::

      wallet {
        file = "c:/nodes/testnet-pos.vostoknodes.com/keystore.dat"
        password = "some string as password" }

.. _configuration-rest-api:

  | 2.10. Указать доступ к :ref:`интерфейсу REST API <rest-api-node>` ноды

    ::
 
      rest-api {
      enable = yes
      bind-address = "0.0.0.0"
      port = 6862

  | 2.11. Используя утилиту  `generators-x.x.x+VST-x.x.x.jar <https://github.com/vostokplatform/Vostok-Releases/release>`_ создать ``api-key-hash`` для доступа к REST API ноды. Для запуска утилиты требуется в качестве одного из параметров указать файл ``api-key-hash.conf``, в котором определяются параметры создания ``api-key-hash``. Команда для запуска утилиты:
  | ``java -jar generators-x.x.x+VST-x.x.x.jar ApiKeyHash api-key-hash.conf`` 
  | Полученное в результате исполнения утилиты значение, указать в параметре ``api-key-hash`` конфигурационного файла ноды.

  ::

    // api-key-hash.conf listing

    apikeyhash-generator {
      waves-crypto = no
      api-key = "some string"
    }

  **Описание параметров:**

    - waves-crypto – выбор криптографического алгоритма ("yes" - использовать криптографию :ref:`Waves <crypto-waves>`, "no" - использовать :ref:`ГОСТ-криптографию <crypto-gost>`);
    - api-key – ключ, который необходимо придумать. Значение данного ключа потребуется указать в запросах к REST API ноды (подробнее на странице :ref:`REST API ноды <rest-api-node>`).
 
3. Подписать genesis-блок утилитой `generators-x.x.x+VST-x.x.x.jar <https://github.com/vostokplatform/Vostok-Releases/release>`_. Команда для подписания: ``java -jar generators-x.x.x+VST-x.x.x.jar GenesisBlockGenerator private-blockchain.conf``, где private-blockchain.conf, отредактированный в :ref:`в п. 2 <configuration-node>` конфигурационный файл ноды. После подписания поля ``genesis-public-key-base-58`` и ``signature`` конфигурационного файла будут заполнены значениями открытого ключа и подписи genesis-блока. 

  | Пример:

  ::

    genesis-public-key-base-58: "4ozcAj...penxrm"
    signature: "5QNVGF...7Bj4Pc"

  .. important:: Если нода ранее работала с другой сетью блокчейна Vostok, то удалить данные из папки, указанной в параметре "data-directory" (по умолчанию, для ОС Ubuntu используется путь ``${user.home}/vostok``, для ОС Windows используется путь ``C:\Users\<username>\vostok``)


4. :ref:`Запустить ноду <install-node>`


.. _configuration-private:

Создание приватной сети
----------------------------------------------------

На платформе Vostok существует возможность запуска не публичной блокчейн-сети, т.е. такой сети, подключение к которой нового узла требует согласования с администратором сети. Участник сети в роли connection-manager публикует в сети RegisterNode транзакцию с параметрами добавляемого узла (публичный ключ владельца ноды и ее имя). При получении от пиров авторизованного handshake сообщения узлы проверяют, что оно отправлено известным участником сети.

При создании приватной сети необходимо установить в конфигурационном файле значение параметра ``privacy.allow-all-nodes = false``. В такой сети взаимодействие узлов может происходить только после получения и валидации :ref:`авторизованного handshake<network-message-auth-handshake>` сообщения.

Так же необходимо указать публичный ключ владельца ноды в параметре ``privacy.owner-address`` и пароль к keystore ноды ``privacy.owner-password``.

::

    vostok {
        ...
        privacy.allow-all-nodes = false
        privacy.owner-address = "C1ADP1tNGuSLTiQrfNRPhgXx59nCrwrZFRV4AHpfKBpZ"
        privacy.owner-password = "gR42fGQweh56"
        ...
    }

Дополнительно необходимо создать пользователя с правами "connection-manager". Пользователь может быть указан в ``genesis`` блоке конфигурационного файла в поле ``network-participants`` при создании сети, либо позднее - пользователь "permissioner" должен опубликовать в сети :ref:`Permit<PermitTransaction>` транзакцию:

.. code:: js

   {
      "type":102,
      "sender":"3LWg4n6VmN6DKBSwGF1hwnaCzXdjMkQCFrn",
      "target":"3LMKWgu7cZFPiVewYZDBn54HdVT86RfREGc",
      "role":"issuer",
      "opType":"add",
      "dueTimestamp":1528975127294
   }

Где:

 - type - тип транзакции по добавлению/редактированию permissions;
 - sender - нода, обладающая правами на подписание permission-транзакций;
 - target - адрес ноды, которая добавляется в сеть;
 - role - роль пользователя, в данном случае это "connection-manager";
 - opType -  тип операции "add" (добавить полномочия) или "remove" (удалить полномочия);
 - dueTimestamp - дата действия permission в формате timestamp.


Для регистрации нового узла в блокчейн-сети, его владелец должен сообщить имя ноды и свой публичный ключ администратору сети. После чего "connection-manager" имеет возможность опубликовать в сети :ref:`RegisterNode<RegisterNodeTransaction>` транзакцию, означающую что к сети подключен новый авторизованный участник:

.. code:: js

   {
      "type":111,
      "sender":"3LWg4n6VmN6DKBSwGF1hwnaCzXdjMkQCFrn",
      "targetPubKey":"C1ADP1tNGuSLTiQrfNRPhgXx59nCrwrZFRV4AHpfKBpZ",
      "nodeName":"miner-node-3",
      "opType":"add"
   }

