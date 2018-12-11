REST API ноды
=================

Блокчейн-платформа Восток предоставляет возможность взаимодействия с блокчейном, как в части получения данных (транзакции, блоки, балансы и др.), так и в части записи инфомрации в блокчейн (подписание и отправка транзакций).

**Интерфейс ноды**

.. toctree::
   :maxdepth: 4

   rest-api-node/address.rst
   rest-api-node/alias.rst
   rest-api-node/assets.rst
   rest-api-node/blocks.rst
   rest-api-node/leasing.rst
   rest-api-node/peers.rst
   rest-api-node/transactions.rst
   rest-api-node/utils.rst


All private functions below require API Key to be provided in every HTTP
request using ``X-Api-Key`` header. The default value is
``ridethewaves!``. Securely hashed header value is stored in
``rest-api.api-key-hash`` setting in the waves.conf configuration file.
See
`/utils/hash/secure </development-and-api/waves-node-rest-api/utils.md>`__
for more information on how to obtain a secure hash.