.. _first-contract-tutorial:

Пример запуска контракта
=========================

.. hint:: Техническое описание особенностей реализации контрактов приведено в разделе :ref:`docker`.

Описание логики программы
-----------------------------------

В разделе рассматривается пример создания и запуска простого смарт-контракта. Контракт выполняет суммирование 2х значений полей "а" и "b", которые поступают на вход контракта в call-транзакции.

Листинг программы ``contract.py`` на Python:

.. code:: python

    import json
    import sys
    
    
    def find_param_value(params, name):
        for param in params:
            if param['key'] == name: return param['value']
        return None
    
    
    if __name__ == '__main__':
        request = json.loads(sys.argv[1])
        if request['command'] == 'execute':
            if not request['params']: sys.exit(-1)
            a = find_param_value(request['params'], 'a')
            b = find_param_value(request['params'], 'b')
            if a is None or b is None: sys.exit(-1)
            print(json.dumps([{
                "key": 'sum',
                "type": "integer",
                "value": a + b}], separators=(',', ':')))
        elif request['command'] == 'init':
            sys.exit(0)
        else:
            sys.exit(-1)

**Описание работы**

- Программа ожидает получить структуру данных в формате json с полем "params"
- Считывает значение полей "а" и "b"
- Возвращает результат в виде значения поля sum в формате json

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

1. Скачать и установить `Docker for Developers <https://www.docker.com/get-started>`_

.. hint:: В настройках Docker включить признак "Expose deamon on .... without TLS"

2. Подготовить образ контракта. В папке ``sum-contract-kv`` создать следующие файлы:

.. image:: ../../../img/sum-contract-structure.png

Листинг файла run.sh

.. code:: js

    #!/bin/sh
    python contract.py $1

Листинг файла Dockerfile

.. code:: js

    FROM python:alpine3.8
    ADD contract.py /
    ADD run.sh /
    RUN chmod +x run.sh
    CMD ["/bin/sleep", "6000"]

3. Установить образ в Docker registry и запустить registry. Выполнить в терминале следующие команды:

.. code:: js

    docker run -d -p 5000:5000 --name registry registry:2
    cd contracts/sum-contract-kv
    docker build -t sum-contract-kv .
    docker image tag sum-contract-kv localhost:5000/sum-contract-kv
    docker push localhost:5000/sum-contract-kv
    docker start registry

4. Подписать транзакцию на создание смарт-контракта. Для упрощения процесса демонстрации подписание транзакций будем производиться ключом, сохраненным в keystore ноды.

.. hint:: Правила формирования запросов к ноде приведены в разделе :ref:`rest-api-node`.

Тело запроса

.. code:: js

    {
        "type": 103,
        "sender":"3FQyQ1nSXtyEfBrFr6GxfNtEKWdtVNKWdPu",
        "image":"localhost:5000/sum-contract-kv",
        "params":[],
        "fee":500000
    }

Пример запроса

.. code:: js

    curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'X-API-Key: 1' -d ' \ 
    { \ 
        "type": 103, \ 
        "sender":"3FQyQ1nSXtyEfBrFr6GxfNtEKWdtVNKWdPu", \ 
        "image":"localhost:5000/sum-contract-kv", \ 
        "params":[], \ 
        "fee":500000 \ 
    }' 'http://localhost:6862/transactions/sign'

Пример ответа

.. code:: js

    {
        "type": 103,
        "id": "sjqEHZzo57c9Mnrxi8V3LbyQxxLCUfBt1B9asL1pPNX",
        "sender": "3FQyQ1nSXtyEfBrFr6GxfNtEKWdtVNKWdPu",
        "senderPublicKey": "5LiQqduJQWCHNP9qvFhCHYi2tvCQP8Pv4LVWt2p5vYzBWXcEGQLJCaWiJwkt95EtLssb1byhWB3bZ3G1d66ToyxU",
        "fee": 500000,
        "timestamp": 1545915704290,
        "proofs": [
            "2byc9emJV5Qn6qeiqqt8bVNbYdsfgqVwUkB3zd8pnJbx9ni2tpS785r4JFz1XJpQN8jCrPhrmGBvRaPNm2QR8MTN"
        ],
        "version": 1,
        "image": "localhost:5000/sum-contract-kv",
        "params": []
    }

5. Отправить подписанную транзакцию в блокчейн. Ответ от метода sign необходимо передать на вход для метода broadcast.

Пример запроса

.. code:: js

    curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'X-API-Key: 1' -d '{ \ 
    "type": 103, \ 
    "id": "sjqEHZzo57c9Mnrxi8V3LbyQxxLCUfBt1B9asL1pPNX", \ 
    "sender": "3FQyQ1nSXtyEfBrFr6GxfNtEKWdtVNKWdPu", \ 
    "senderPublicKey": "5LiQqduJQWCHNP9qvFhCHYi2tvCQP8Pv4LVWt2p5vYzBWXcEGQLJCaWiJwkt95EtLssb1byhWB3bZ3G1d66ToyxU", \ 
    "fee": 500000, \ 
    "timestamp": 1545915704290, \ 
    "proofs": [ \ 
        "2byc9emJV5Qn6qeiqqt8bVNbYdsfgqVwUkB3zd8pnJbx9ni2tpS785r4JFz1XJpQN8jCrPhrmGBvRaPNm2QR8MTN" \ 
    ], \ 
    "version": 1, \ 
    "image": "localhost:5000/sum-contract-kv", \ 
    "params": [] \ 
    }' 'http://localhost:6862/transactions/broadcast'

5. По id транзакции убедиться, что транзакция с инициализацией контракта размещена в блокчейне

http://localhost:6862/transactions/info/sjqEHZzo57c9Mnrxi8V3LbyQxxLCUfBt1B9asL1pPNX

Пример ответа

.. code:: js

    {
        "type": 103,
        "id": "sjqEHZzo57c9Mnrxi8V3LbyQxxLCUfBt1B9asL1pPNX",
        "sender": "3FQyQ1nSXtyEfBrFr6GxfNtEKWdtVNKWdPu",
        "senderPublicKey": "5LiQqduJQWCHNP9qvFhCHYi2tvCQP8Pv4LVWt2p5vYzBWXcEGQLJCaWiJwkt95EtLssb1byhWB3bZ3G1d66ToyxU",
        "fee": 500000,
        "timestamp": 1545915704290,
        "proofs": [
            "2byc9emJV5Qn6qeiqqt8bVNbYdsfgqVwUkB3zd8pnJbx9ni2tpS785r4JFz1XJpQN8jCrPhrmGBvRaPNm2QR8MTN"
        ],
        "version": 1,
        "image": "localhost:5000/sum-contract-kv",
        "params": [],
        "height": 1943
    }

Исполнение смарт-контракта
-----------------------------------

1. Подписать транзакцию на выполнение смарт-контракта.

В поле ``contractId`` указать идентификатор транзакции инициализации контракта.

Тело запроса

.. code:: js

    {
        "type": 104,
        "sender":"3FQyQ1nSXtyEfBrFr6GxfNtEKWdtVNKWdPu",
        "contractId":"sjqEHZzo57c9Mnrxi8V3LbyQxxLCUfBt1B9asL1pPNX",
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
        ],
        "fee": 500000
    }

Пример ответа

.. code:: js

    {
        "type": 104,
        "id": "CrfVjMhxzcrygcBAFeF8GkhWFvB4bRD5eWj637cUjadt",
        "sender": "3FQyQ1nSXtyEfBrFr6GxfNtEKWdtVNKWdPu",
        "senderPublicKey": "5LiQqduJQWCHNP9qvFhCHYi2tvCQP8Pv4LVWt2p5vYzBWXcEGQLJCaWiJwkt95EtLssb1byhWB3bZ3G1d66ToyxU",
        "fee": 500000,
        "timestamp": 1545918488726,
        "proofs": [
            "4sLTUH3NMAG7hUmVKz9aKcLKRaUT2hWEcLnKN5mXL6w9WziXnGgEvAxyKEavwvjjUXvxBvN6QXxpqpWJf7GfEdMF"
        ],
        "version": 1,
        "contractId": "sjqEHZzo57c9Mnrxi8V3LbyQxxLCUfBt1B9asL1pPNX",
        "params": [
            {
            "key": "a",
            "type": "integer",
            "value": 1
            },
            {
            "key": "b",
            "type": "integer",
            "value": 2
            }
        ]
    }

2. Отправить подписанную транзакцию в блокчейн. Ответ от метода sign необходимо передать на вход для метода broadcast.

Пример запроса

.. code:: js

    curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'X-API-Key: 1' -d '{ \ 
    "type": 104, \ 
    "id": "CrfVjMhxzcrygcBAFeF8GkhWFvB4bRD5eWj637cUjadt", \ 
    "sender": "3FQyQ1nSXtyEfBrFr6GxfNtEKWdtVNKWdPu", \ 
    "senderPublicKey": "5LiQqduJQWCHNP9qvFhCHYi2tvCQP8Pv4LVWt2p5vYzBWXcEGQLJCaWiJwkt95EtLssb1byhWB3bZ3G1d66ToyxU", \ 
    "fee": 500000, \ 
    "timestamp": 1545918488726, \ 
    "proofs": [ \ 
        "4sLTUH3NMAG7hUmVKz9aKcLKRaUT2hWEcLnKN5mXL6w9WziXnGgEvAxyKEavwvjjUXvxBvN6QXxpqpWJf7GfEdMF" \ 
    ], \ 
    "version": 1, \ 
    "contractId": "sjqEHZzo57c9Mnrxi8V3LbyQxxLCUfBt1B9asL1pPNX", \ 
    "params": [ \ 
        { \ 
        "key": "a", \ 
        "type": "integer", \ 
        "value": 1 \ 
        }, \ 
        { \ 
        "key": "b", \ 
        "type": "integer", \ 
        "value": 2 \ 
        } \ 
    ] \ 
    }' 'http://localhost:6862/transactions/broadcast'

3. Получить результат выполнения смарт-контракта по его идентификатору

http://localhost:6862/contracts/sjqEHZzo57c9Mnrxi8V3LbyQxxLCUfBt1B9asL1pPNX

Пример ответа

.. code:: js

    [ {
    "key" : "sum",
    "type" : "integer",
    "value" : 3
    } ]