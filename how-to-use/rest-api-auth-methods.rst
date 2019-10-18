
.. _rest-api-auth-methods:

Методы REST API для сервиса авторизации
=============================================

Подробно о работе с REST API можно почитать в :ref:`этом <rest-api-node>` разделе. Доступ к REST API сервиса авторизации осуществляется по протоколу HTTPS.

Методы авторизации auth
-----------------------------

.. _rest-api-auth-login:

POST ​/auth​/login
~~~~~~~~~~~~~~~~~~~~

Создание пары токенов - **access** и **refresh**.


POST ​/auth​/token
~~~~~~~~~~~~~~~~~~~~~~~~




POST ​/auth​/refresh
~~~~~~~~~~~~~~~~~~~~~~~


GET ​/auth​/publicKey
~~~~~~~~~~~~~~~~~~~~~~~~


Методы автризации user
----------------------------



GET ​/user​/doesEmailExist
~~~~~~~~~~~~~~~~~~~~~~~~~~~~



GET ​/user​/confirm​/{code}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


POST ​/user​/create
~~~~~~~~~~~~~~~~~~~~


POST ​/user​/resendEmail
~~~~~~~~~~~~~~~~~~~~~~~~~


POST ​/user​/password​/restore
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


POST ​/user​/password​/reset
~~~~~~~~~~~~~~~~~~~~~~~~~~~~


GET ​/user​/{id}
~~~~~~~~~~~~~~~~~~


POST ​/user​/{id}​/addresses
~~~~~~~~~~~~~~~~~~~~~~~~~~~~






