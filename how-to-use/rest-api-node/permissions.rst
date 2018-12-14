Permissions
=================

.. sidebar:: REST API

   Правила формирования запросов к ноде приведены в разделе :ref:`rest-api-node`.
   
GET /permissions/{address}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Возвращает роли (permissions), назначенные на указанный адрес {address}, действительные на текущий момент времени.

**Ответ метода:**

.. code:: js

    {
        "roles": [
            {
            "role": "miner"
            },
            {
            "role": "permissioner"
            }
        ],
        "timestamp": 1544703449430
    }


GET /permissions/{address}/at/{timestamp}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Возвращает роли (permissions), назначенные на указанный адрес {address}, действительные на момент времени {timestamp}.

**Ответ метода:**

.. code:: js

    {
        "roles": [
            {
            "role": "miner"
            },
            {
            "role": "permissioner"
            }
        ],
        "timestamp": 1544703449430
    }



POST /permissions/addresses
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Возвращает роли (permissions), назначенные на список адресов, действительные на текущий момент времени.

**Запрос метода:**

.. code:: js

    {
        "addresses": [
            "3N2cQFfUDzG2iujBrFTnD2TAsCNohDxYu8w", "3Mx5sDq4NXef1BRzJRAofa3orYFxLanxmd7"
        ],
        "timestamp": 1544703449430
    }

**Ответ метода:**

.. code:: js

    {
        "addressToRoles": [
            {
            "address": "3N2cQFfUDzG2iujBrFTnD2TAsCNohDxYu8w",
            "roles": [
                {
                "role": "miner"
                },
                {
                "role": "permissioner"
                }
            ]
            },
            {
            "address": "3Mx5sDq4NXef1BRzJRAofa3orYFxLanxmd7",
            "roles": [
                {
                "role": "miner"
                }
            ]
            }
        ],
        "timestamp": 1544703449430
    }