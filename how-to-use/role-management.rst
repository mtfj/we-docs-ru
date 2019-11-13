.. _role-management:

Управление полномочиями участников
====================================

Список возможных ролей в блокчейн-платформе приведен в разделе :ref:`"Авторизация участников" <authorization>`.

.. important:: Обязательным условием для изменения полномочий участников (добавления или удаления ролей) является наличие приватного ключа участника с ролью "permissioner" в keystore ноды, с которой осуществляется запрос.
          
Вариант №1 (через REST API)
-----------------------------
Управление полномочиями участника выполняется путем подписания (метод sign) и рассылки (метод broadcast) permission-транзакций через :ref:`REST API ноды <rest-api-node>`.

Объект запроса для метода sign:

.. code:: js

    {
      "type":102,
      "sender":3GLWx8yUFcNSL3DER8kZyE4TpyAyNiEYsKG,
      "senderPublicKey":4WnvQPit2Di1iYXDgDcXnJZ5yroKW54vauNoxdNeMi2g,
      "fee":0,
      "proofs":[""],
      "target":3GPtj5osoYqHpyfmsFv7BMiyKsVzbG1ykfL,
      "opType":"add",
      "role":"contract_developer",
      "dueTimestamp":null
    }

**Поля запроса:**

- type - тип транзакции для управления полномочиями участников (type = 102);
- sender - адрес участника с полномочиями на выпуск permission-транзакций;
- proofs - подпись транзакции;
- target - адрес участника, для которого требуется установить или удалить полномочия;
- role - полономочия участника, которые требуется установить или удалить. Возможные значения: "miner", "issuer", "dex", "permissioner", "blacklister", "banned", "contract_developer", "connection_manager";
- opType - тип операции "add" (добавить полномочия) или "remove" (удалить полномочия);
- dueTimestamp - дата действия permission в формате timestamp. Поле является опциональным.

Полученный ответ от ноды передать методу broadcast.

Вариант №2 (через утилиту)
--------------------------------
Используя утилиту Generators возможно автоматизировать процесс.

Пример запуска из консоли: 

.. code:: js

    java -jar generators.jar GrantRolesApp [configfile]

Пример конфига:

.. code:: js

    permission-granter {
    waves-crypto = no
    chain-id = T
    account = {
        addresses = [
        "3N2cQFfUDzG2iujBrFTnD2TAsCNohDxYu8w"
        ]
        storage = ${user.home}"/vostok/wallet/wallet.dat"
        password = "some string as password"
    }
    send-to = [
        "devnet-aws-fr-2.vostok.wavesnodes.com:6864"
    ]
    grants = [
        {
        address: "3N2cQFfUDzG2iujBrFTnD2TAsCNohDxYu8w"
        assigns = [
            {
            permission = "miner",
            operation = "add",
            due-timestamp = 1527698744623
            },
            {
            permission = "issuer",
            operation = "add",
            due-timestamp = 1527699744623
            },
            {
            permission = "blacklister",
            operation = "add"
            },
            {
            permission = "permissioner",
            operation = "remove"
            }
        ]
        }
    ]
    txs-per-bucket = 10
    }

Поле "due-timestamp" ограничивает время действия роли;
Поля nodes, roles - обязательные.

Если у ноды уже задана какая-либо из ролей, которая задана в конфиге, то ситуация обрабатывается в соответствии с правилами:

=============================       ======================================  =============================================================================================
Текущее состояние ноды	            Состояние полученное из транзакции	    Результат обработки
=============================       ======================================  =============================================================================================
Роль не назначена	                Новая роль	                            Success - назначается роль
Назначена роль без dueDate	        Роль c dueDate	                        Проверка dueDate, если меньше текущей, то IncorrectDatetime, иначе Success - назначается роль с duedate
Назначена роль с dueDate	        Роль с dueDate	                        Проверка dueDate, если меньше текущей, то IncorrectDatetime, иначе Success - обновление dueDate
Назначена роль с dueDate	        Роль без dueDate	                    Success - назначается роль без dueDate
Назначена роль с/без dueDate	    Удаление роли	                        Проверка адреса ноды, если <> адресу генезиса, то Success - удаляется роль
=============================       ======================================  =============================================================================================
