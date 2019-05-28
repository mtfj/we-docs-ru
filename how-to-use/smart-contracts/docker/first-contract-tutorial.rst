.. _first-contract-tutorial:

Пример запуска контракта
=========================

.. hint:: Техническое описание особенностей реализации контрактов приведено в разделе :ref:`Смарт-контракты Docker <docker>`.

Описание логики программы
-----------------------------------

В разделе рассматривается пример создания и запуска простого смарт-контракта. Контракт выполняет суммирование 2х чисел, переданных на вход контракта в :ref:`call-транзакции <first-contract-tutorial-call>`.

.. `Скачать <contracts-sample/sum-contract-kv_1.0.zip>`_ исходный код контракта.

Листинг программы ``contract.py`` на Python:

.. code:: python

    import json
    import sys
    import os

    def find_param_value(params, name):
        for param in params:
            if param['key'] == name: return param['value']
        return None

    if __name__ == '__main__':
        command = os.environ['COMMAND']
        tx = json.loads(os.environ['TX'])
        if command == 'CALL':
            a = find_param_value(tx['params'], 'a')
            b = find_param_value(tx['params'], 'b')
            if a is None or b is None: sys.exit(-1)
            print(json.dumps([{
                "key": '{0}+{1}'.format(a, b),
                "type": "integer",
                "value": a + b}], separators=(',', ':')))
        elif command == 'CREATE':
            sys.exit(0)
        else:
            sys.exit(-1)

**Описание работы**

- Программа ожидает получить структуру данных в формате json с полем "params".
- Считывает значение полей "а" и "b".
- Возвращает результат в виде значения поля "{a}+{b}" в формате json.

**Пример входящих параметров**

.. code:: js

    "params":[
        {
            "key":"a",
            "type":"integer",
            "value":1
        },
        {
            "key":"b",
            "type":"integer",
            "value":2
        }
    ]

Установка смарт-контракта
-----------------------------------

1. Скачать и установить `Docker for Developers <https://www.docker.com/get-started>`_ для вашей операционной системы.

.. hint:: Для операционной системы Windows в настройках Docker включить признак "Expose deamon on .... without TLS".

2. Подготовить образ контракта. В папке ``sum-contract-kv`` создать следующие файлы:

.. image:: ../../../img/sum-contract-structure.png

Листинг файла run.sh

.. code:: js

    #!/bin/sh

    python contract.py

Листинг файла Dockerfile

.. code:: js

    FROM python:alpine3.8
    ADD contract.py /
    ADD run.sh /
    RUN chmod +x run.sh
    RUN apk add --no-cache --update iptables
    CMD exec /bin/sh -c "trap : TERM INT; (while true; do sleep 1000; done) & wait"

3. Установить образ в Docker registry. Выполнить в терминале следующие команды:

.. code:: js

    docker run -d -p 5000:5000 --name registry registry:2
    cd contracts/sum-contract-kv
    docker build -t sum-contract-kv .
    docker image tag sum-contract-kv localhost:5000/sum-contract-kv
    docker start registry
    docker push localhost:5000/sum-contract-kv


4. Подписать транзакцию на создание смарт-контракта. В рассматриваемом примере транзакция подписывается ключом, сохраненным в keystore ноды.

.. hint:: Для создания ключевой пары и адреса участника используется утилита `generators.jar <https://github.com/vostokplatform/Vostok-Releases/releases>`_. Порядок действий создания ключевой пары приведен в подразделе :ref:`Генерирование ключевых пар  <generate-keys-pair>`. Правила формирования запросов к ноде приведены в разделе :ref:`REST API ноды <rest-api-node>`.

**Тело запроса**

.. code:: js

    {
        "type": 103,
        "sender":"3PKyW5FSn4fmdrLcUnDMRHVyoDBxybRgP58",
        "image":"localhost:5000/sum-contract-kv",
        "params":[],
        "imageHash": "930d18dacb4f49e07e2637a62115510f045da55ca16b9c7c503486828641d662",
        "fee":500000
    }

**Пример запроса**

.. code:: js

    curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'X-API-Key: vostok' -d '    { \ 
            "type": 103, \ 
            "sender":"3PKyW5FSn4fmdrLcUnDMRHVyoDBxybRgP58", \ 
            "image":"localhost:5000/sum-contract-kv", \ 
            "params":[], \ 
            "imageHash": "930d18dacb4f49e07e2637a62115510f045da55ca16b9c7c503486828641d662", \ 
            "fee":500000 \ 
        }' 'http://localhost:6862/transactions/sign'

**Пример ответа**

.. code:: js

    {
    "type": 103,
    "id": "2sqPS2VAKmK77FoNakw1VtDTCbDSa7nqh5wTXvJeYGo2",
    "sender": "3PKyW5FSn4fmdrLcUnDMRHVyoDBxybRgP58",
    "senderPublicKey": "2YvzcVLrqLCqouVrFZynjfotEuPNV9GrdauNpgdWXLsq",
    "fee": 500000,
    "timestamp": 1549443811183,
    "proofs": [
        "YSomSCKBhQWHKHR8f8ZMp7EzuA6Uouu1oq5WA5VDiZ8o2adL4XMQP3jgccketjGCEpnTnCjm5bABZG486CVR5ZM"
    ],
    "version": 1,
    "image": "localhost:5000/sum-contract-kv",
    "imageHash": "930d18dacb4f49e07e2637a62115510f045da55ca16b9c7c503486828641d662",
    "params": []
    }

5. Отправить подписанную транзакцию в блокчейн. Ответ от метода sign необходимо передать на вход для метода broadcast.

**Пример запроса**

.. code:: js

    curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'X-API-Key: vostok' -d '{ \ 
    "type": 103, \ 
    "id": "2sqPS2VAKmK77FoNakw1VtDTCbDSa7nqh5wTXvJeYGo2", \ 
    "sender": "3PKyW5FSn4fmdrLcUnDMRHVyoDBxybRgP58", \ 
    "senderPublicKey": "2YvzcVLrqLCqouVrFZynjfotEuPNV9GrdauNpgdWXLsq", \ 
    "fee": 500000, \ 
    "timestamp": 1549443811183, \ 
    "proofs": [ \ 
        "YSomSCKBhQWHKHR8f8ZMp7EzuA6Uouu1oq5WA5VDiZ8o2adL4XMQP3jgccketjGCEpnTnCjm5bABZG486CVR5ZM" \ 
    ], \ 
    "version": 1, \ 
    "image": "localhost:5000/sum-contract-kv", \ 
    "imageHash": "930d18dacb4f49e07e2637a62115510f045da55ca16b9c7c503486828641d662", \ 
    "params": [] \ 
    }' 'http://localhost:6862/transactions/broadcast'

5. По id транзакции убедиться, что транзакция с инициализацией контракта размещена в блокчейне.

http://localhost:6862/transactions/info/2sqPS2VAKmK77FoNakw1VtDTCbDSa7nqh5wTXvJeYGo2

**Пример ответа**

.. code:: js

    {
    "type": 103,
    "id": "2sqPS2VAKmK77FoNakw1VtDTCbDSa7   nqh5wTXvJeYGo2",
    "sender": "3PKyW5FSn4fmdrLcUnDMRHVyoDBxybRgP58",
    "senderPublicKey": "2YvzcVLrqLCqouVrFZynjfotEuPNV9GrdauNpgdWXLsq",
    "fee": 500000,
    "timestamp": 1549365501462,
    "proofs": [
        "2ZK1Y1ecfQXeWsS5sfcTLM5W1KA3kwi9Up2H7z3Q6yVzMeGxT9xWJT6jREQsmuDBcvk3DCCiWBdFHaxazU8pbo41"
    ],
    "version": 1,
    "image": "localhost:5000/contract256",
    "imageHash": "930d18dacb4f49e07e2637a62115510f045da55ca16b9c7c503486828641d662",
    "params": [],
    "height": 1256
    }

Исполнение смарт-контракта
-----------------------------------

.. _first-contract-tutorial-call:

1. Подписать call-транзакцию на вызов (исполнение) смарт-контракта.

В поле ``contractId`` указать идентификатор транзакции инициализации контракта.

**Тело запроса**

.. code:: js

    {
        "contractId": "2sqPS2VAKmK77FoNakw1VtDTCbDSa7nqh5wTXvJeYGo2",
        "fee": 10,
        "sender": "3PKyW5FSn4fmdrLcUnDMRHVyoDBxybRgP58",
        "type": 104,
        "version": 1,
        "params": [
            {
                "type": "integer",
                "key": "a",
                "value": 1
            },
            {
                "type": "integer",
                "key": "b",
                "value": 100

            }
        ]
    }

**Пример запроса**

.. code:: js

    curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'X-API-Key: vostok' -d '{ \ 
        "contractId": "2sqPS2VAKmK77FoNakw1VtDTCbDSa7nqh5wTXvJeYGo2", \ 
        "fee": 10, \ 
        "sender": "3PKyW5FSn4fmdrLcUnDMRHVyoDBxybRgP58", \ 
        "type": 104, \ 
        "version": 1, \ 
        "params": [ \ 
            { \ 
                "type": "integer", \ 
                "key": "a", \ 
                "value": 1 \ 
            }, \ 
            { \ 
                "type": "integer", \ 
                "key": "b", \ 
                "value": 100 \ 
    \ 
            } \ 
        ] \ 
    }' 'http://localhost:6862/transactions/sign'

**Пример ответа**

.. code:: js

    {
        "type": 104,
        "id": "9fBrL2n5TN473g1gNfoZqaAqAsAJCuHRHYxZpLexL3VP",
        "sender": "3PKyW5FSn4fmdrLcUnDMRHVyoDBxybRgP58",
        "senderPublicKey": "2YvzcVLrqLCqouVrFZynjfotEuPNV9GrdauNpgdWXLsq",
        "fee": 10,
        "timestamp": 1549365736923,
        "proofs": [
            "2q4cTBhDkEDkFxr7iYaHPAv1dzaKo5rDaTxPF5VHryyYTXxTPvN9Wb3YrsDYixKiUPXBnAyXzEcnKPFRCW9xVp4v"
        ],
        "version": 1,
        "contractId": "2sqPS2VAKmK77FoNakw1VtDTCbDSa7nqh5wTXvJeYGo2",
        "params": [
            {
            "key": "a",
            "type": "integer",
            "value": 1
            },
            {
            "key": "b",
            "type": "integer",
            "value": 100
            }
        ]
    }

2. Отправить подписанную транзакцию в блокчейн. Ответ от метода sign необходимо передать на вход для метода broadcast.

**Пример запроса**

.. code:: js

    curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'X-API-Key: vostok' -d '{ \ 
    "type": 104, \ 
    "id": "9fBrL2n5TN473g1gNfoZqaAqAsAJCuHRHYxZpLexL3VP", \ 
    "sender": "3PKyW5FSn4fmdrLcUnDMRHVyoDBxybRgP58", \ 
    "senderPublicKey": "2YvzcVLrqLCqouVrFZynjfotEuPNV9GrdauNpgdWXLsq", \ 
    "fee": 10, \ 
    "timestamp": 1549365736923, \ 
    "proofs": [ \ 
        "2q4cTBhDkEDkFxr7iYaHPAv1dzaKo5rDaTxPF5VHryyYTXxTPvN9Wb3YrsDYixKiUPXBnAyXzEcnKPFRCW9xVp4v" \ 
    ], \ 
    "version": 1, \ 
    "contractId": "2sqPS2VAKmK77FoNakw1VtDTCbDSa7nqh5wTXvJeYGo2", \ 
    "params": [ \ 
        { \ 
        "key": "a", \ 
        "type": "integer", \ 
        "value": 1 \ 
        }, \ 
        { \ 
        "key": "b", \ 
        "type": "integer", \ 
        "value": 100 \ 
        } \ 
    ] \ 
    }' 'http://localhost:6862/transactions/broadcast'

3. Получить результат выполнения смарт-контракта по его идентификатору.

http://localhost:6862/contracts/2sqPS2VAKmK77FoNakw1VtDTCbDSa7nqh5wTXvJeYGo2

**Пример ответа**

.. code:: js

    [
        {
            "key": "1+100",
            "type": "integer",
            "value": 101
        }
    ]