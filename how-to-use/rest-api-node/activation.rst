Activation
=============

.. sidebar:: REST API

   Правила формирования запросов к ноде приведены в разделе :ref:`rest-api-node`.


GET /activation/status
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Возвращает статус активации нового функционала в ноде/нодах.

**Ответ метода:**

.. code:: js

    {
    "height": 47041,
    "votingInterval": 1,
    "votingThreshold": 1,
    "nextCheck": 47041,
    "features": [
        {
        "id": 1,
        "description": "Minimum Generating Balance of 1000 VST",
        "blockchainStatus": "ACTIVATED",
        "nodeStatus": "IMPLEMENTED",
        "activationHeight": 0
        },
        {
        "id": 2,
        "description": "NG Protocol",
        "blockchainStatus": "ACTIVATED",
        "nodeStatus": "IMPLEMENTED",
        "activationHeight": 0
        },
        {
        "id": 3,
        "description": "Mass Transfer Transaction",
        "blockchainStatus": "ACTIVATED",
        "nodeStatus": "IMPLEMENTED",
        "activationHeight": 0
        },
        {
        "id": 4,
        "description": "Smart Accounts",
        "blockchainStatus": "ACTIVATED",
        "nodeStatus": "IMPLEMENTED",
        "activationHeight": 0
        },
        {
        "id": 5,
        "description": "Data Transaction",
        "blockchainStatus": "ACTIVATED",
        "nodeStatus": "IMPLEMENTED",
        "activationHeight": 0
        },
        {
        "id": 6,
        "description": "Burn Any Tokens",
        "blockchainStatus": "ACTIVATED",
        "nodeStatus": "IMPLEMENTED",
        "activationHeight": 0
        },
        {
        "id": 7,
        "description": "Fee Sponsorship",
        "blockchainStatus": "ACTIVATED",
        "nodeStatus": "IMPLEMENTED",
        "activationHeight": 0
        },
        {
        "id": 8,
        "description": "Fair PoS",
        "blockchainStatus": "ACTIVATED",
        "nodeStatus": "IMPLEMENTED",
        "activationHeight": 0
        },
        {
        "id": 9,
        "description": "Smart Assets",
        "blockchainStatus": "VOTING",
        "nodeStatus": "IMPLEMENTED",
        "supportingBlocks": 0
        },
        {
        "id": 10,
        "description": "Smart Account Trading",
        "blockchainStatus": "ACTIVATED",
        "nodeStatus": "IMPLEMENTED",
        "activationHeight": 0
        }
    ]
    }