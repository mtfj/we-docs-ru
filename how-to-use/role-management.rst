.. _role-management:

Управление полномочиями участников
====================================

.. important:: Обязательным условием для изменения полномочий участников (добавления или удаления ролей) является наличие приватного ключа участника с ролью "permissioner" в keystore ноды, с которой осуществляется запрос (вариант 1 или 2).


Вариант №1 (через REST API)
-----------------------------
Управление полномочиями ноды выполняется путем подписания (метод sign) и рассылки (метод broadcast) permission-транзакций через стандартное API ноды (раздел :ref:`rest-api-node`).

Объект запроса для метода sign:

.. code:: js

    {
        # Тип транзакции
        "type":102, 
        
        # Нода, обладающая правами на подписание permission-транзакций
        "sender":"3HYW75PpAeVukmbYo9PQ3mzSHdKUgEytUUz", 
        
        # Нода, для которой выполняется операция
        "target":"3HSVTtjim3FmV21HWQ1LurMhFzjut7Aa1Ac",
        
        # Тип полномочий, которые требуется установить или удалить. Возможные значения: "miner", "issuer", "dex", "permissioner", "blacklister", "banned" 
        "role":"miner",
        
        # Тип операции "add" (добавить полномочия) или "remove" (удалить полномочия)
        "opType”:"add", 
        
        # Дата действия permission в формате timestamp
        "dueTimestamp":1528975127294
    }

Полученный ответ от ноды передать методу broadcast.

Вариант №2 (через утилиту)
--------------------------------
Используя приложение GrantRolesApp возможно автоматизировать процесс.

Пример запуска из консоли: 

.. code:: js

    java -jar generators.jar GrantRolesApp [configfile]

Пример конфига:

.. code:: js

    permission-granter {
    gost-crypto = no
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
Поля nodes, roles - обязательные/

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
