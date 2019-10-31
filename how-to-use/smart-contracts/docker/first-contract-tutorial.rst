.. _first-contract-tutorial:

Пример запуска контракта
=========================

.. hint:: Техническое описание особенностей реализации контрактов приведено в разделе :ref:`Смарт-контракты Docker <docker>`.

Описание логики программы
-----------------------------------

В разделе рассматривается пример создания и запуска простого смарт-контракта. Контракт выполняет суммирование 2х чисел, переданных на вход контракта в :ref:`call-транзакции <first-contract-tutorial-call>`.

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

.. important:: В контейнер со смарт-контрактом необходимо установить `iptables <https://en.wikipedia.org/wiki/Iptables>`_.

3. Установить образ в Docker registry. Выполнить в терминале следующие команды:

.. code:: js

    docker run -d -p 5000:5000 --name registry registry:2
    cd contracts/sum-contract-kv
    docker build -t sum-contract-kv .
    docker image tag sum-contract-kv localhost:5000/sum-contract-kv
    docker start registry
    docker push localhost:5000/sum-contract-kv

4. Для получения информации о контейнере выполнить в терминале следующую команду:

.. code:: js

    docker inspect 57c2c2d2643d
    [
    {
        "Id": "sha256:57c2c2d2643da042ef8dd80010632ffdd11e3d2e3f85c20c31dce838073614dd",
        "RepoTags": [
            "wenode:latest"
        ],
        "RepoDigests": [],
        "Parent": "sha256:d91d2307057bf3bb5bd9d364f16cd3d7eda3b58edf2686e1944bcc7133f07913",
        "Comment": "",
        "Created": "2019-10-25T14:15:03.856072509Z",
        "Container": "",
        "ContainerConfig": {
            "Hostname": "",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,

Идентификатор смарт-контракта ``Id`` является значением поля ``imageHash`` для использования в транзакциях с созданным смарт-контрактом.

5. Подписать транзакцию на создание смарт-контракта. В рассматриваемом примере транзакция подписывается ключом, сохраненным в keystore ноды.

.. hint:: Для создания ключевой пары и адреса участника используется утилита `generators.jar <https://github.com/waves-enterprise/WE-releases>`_. Порядок действий создания ключевой пары приведен в подразделе :ref:`Генерирование ключевых пар  <generate-keys-pair>`. Правила формирования запросов к ноде приведены в разделе :ref:`REST API ноды <rest-api-node>`.

**Тело запроса**

.. code:: js

    {
      "fee": 100000000,
      "image": "stateful-increment-contract:latest",
      "imageHash": "7d3b915c82930dd79591aab040657338f64e5d8b842abe2d73d5c8f828584b65",
      "contractName": "stateful-increment-contract",
      "sender": "3PudkbvjV1nPj1TkuuRahh4sGdgfr4YAUV2",
      "password": "",
      "params": [],
      "type": 103,
      "version": 1
     }

**Пример запроса**

.. code:: js

    curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'X-API-Key: key word' -d '    { \ 
            "fee": 100000000, \
            "image": "stateful-increment-contract:latest", \
            "imageHash": "7d3b915c82930dd79591aab040657338f64e5d8b842abe2d73d5c8f828584b65", \
            "contractName": "stateful-increment-contract", \
            "sender": "3PudkbvjV1nPj1TkuuRahh4sGdgfr4YAUV2", \
            "password": "", \
            "params": [], \
            "type": 103, \
            "version": 1 \
        }' 'http://localhost:6862/transactions/sign'

**Пример ответа**

.. code:: js

    {
        "type": 103,
        "id": "ULcq9R7PvUB2yPMrmBdxoTi3bcRmQPT3JDLLLZVj4Ky",
        "sender": "3N3YTj1tNwn8XUJ8ptGKbPuEFNa9GFnhqew",
        "senderPublicKey": "3kW7vy6nPC59BXM67n5N56rhhAv38Dws5skqDsjMVT2M",
        "fee": 500000,
        "timestamp": 1550591678479,
        "proofs": [ "yecRFZm9iBLyDy93bDVaNo1PR5Qkkic7196GAgUt9TNH1cnQphq4yGQQ8Fxj4BYA4TaqYVw5qxtWzGMPQyVeKYv" ], 
        "version": 1, 
        "image": "stateful-increment-contract:latest", 
        "imageHash": "7d3b915c82930dd79591aab040657338f64e5d8b842abe2d73d5c8f828584b65",
        "contractName": "stateful-increment-contract",
        "params": [], 
        "height": 1619 
    }

6. Отправить подписанную транзакцию в блокчейн. Ответ от метода sign необходимо передать на вход для метода broadcast.

**Пример запроса**

.. code:: js

    curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'X-API-Key: key word' -d '{ \ 
    {
        "type": 103, \
        "id": "ULcq9R7PvUB2yPMrmBdxoTi3bcRmQPT3JDLLLZVj4Ky", \
        "sender": "3N3YTj1tNwn8XUJ8ptGKbPuEFNa9GFnhqew", \
        "senderPublicKey": "3kW7vy6nPC59BXM67n5N56rhhAv38Dws5skqDsjMVT2M", \
        "fee": 500000, \
        "timestamp": 1550591678479, \
        "proofs": [ "yecRFZm9iBLyDy93bDVaNo1PR5Qkkic7196GAgUt9TNH1cnQphq4yGQQ8Fxj4BYA4TaqYVw5qxtWzGMPQyVeKYv" ], \
        "version": 1, \
        "image": "stateful-increment-contract:latest", \
        "imageHash": "7d3b915c82930dd79591aab040657338f64e5d8b842abe2d73d5c8f828584b65", \
        "contractName": "stateful-increment-contract", \
        "params": [], \
        "height": 1619 \
    }
    }' 'http://localhost:6862/transactions/broadcast'

7. По id транзакции убедиться, что транзакция с инициализацией контракта размещена в блокчейне.


**Пример ответа**

.. code:: js

    {
        "type": 103,
        "id": "ULcq9R7PvUB2yPMrmBdxoTi3bcRmQPT3JDLLLZVj4Ky",
        "sender": "3N3YTj1tNwn8XUJ8ptGKbPuEFNa9GFnhqew",
        "senderPublicKey": "3kW7vy6nPC59BXM67n5N56rhhAv38Dws5skqDsjMVT2M",
        "fee": 500000,
        "timestamp": 1550591678479,
        "proofs": [ "yecRFZm9iBLyDy93bDVaNo1PR5Qkkic7196GAgUt9TNH1cnQphq4yGQQ8Fxj4BYA4TaqYVw5qxtWzGMPQyVeKYv" ], 
        "version": 1, 
        "image": "stateful-increment-contract:latest", 
        "imageHash": "7d3b915c82930dd79591aab040657338f64e5d8b842abe2d73d5c8f828584b65",
        "contractName": "stateful-increment-contract",
        "params": [], 
        "height": 1619 
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

    curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'X-API-Key: key word' -d '{ \ 
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

    curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'X-API-Key: key word' -d '{ \ 
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

**Пример ответа**

.. code:: js

    [
        {
            "key": "1+100",
            "type": "integer",
            "value": 101
        }
    ]