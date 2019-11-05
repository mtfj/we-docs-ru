.. _install-client:

Установка дополнительных сервисов
======================================

Для полноценной работы необходимо установить дополнительно приложения `Docker CE <https://docs.docker.com/install/>`_ и `Docker-compose <https://docs.docker.com/compose/install/>`_. Полные требования к окружению для блокчейн-платформы Waves Enterprise вы можете посмотреть в разделе :ref:`Системные требования <system-requirements>`.

Пакет дополнительных сервисов поставляется в виде Docker-контейнера, в котором содержатся следующие сервисы:

* Корпоративный клиент.
* Дата-сервис.
* Дата-краулер.
* Сервис авторизации.
* БД PostgreSQL.

Выполните следующие действия для установки клиентской версии:

1. Скачайте и установите дистрибутив `Docker CE <https://docs.docker.com/install/>`_. Для скачивания потребуется регистрация на сайте.

    | 1.2. После установки убедитесь, что успешно установились приложения `Docker CE <https://docs.docker.com/install/>`_ и `Docker-compose <https://docs.docker.com/compose/install/>`_ (часть дистрибутива Docker CE):

     .. image:: img/docker_check_linuxMac.png
        :scale: 70 %
    
    | Для операционных систем семейств Linux и macOS используются команды ``docker --version`` и ``docker-compose --version``.

2. Скачайте и разархивируйте файл `frontend-deployment.zip <https://github.com/waves-enterprise/WE-releases/releases>`_.
3. В конфигурационном файле приложения ``frontend-deployment/config/nginx-proxy.env`` укажите путь до REST API и hostname ноды:

    .. code:: js
        
        // nginx-proxy.env listing 
        
        VOSTOK_NODE_ADDRESS=http://yournet.wavesenterprise.com:6862
        VOSTOK_NODE_HOST=yournet.wavesenterprise.com:6862

4. В конфигурационном файле приложения ``frontend-deployment/config/postgres.env`` в параметрах ``POSTGRES_USER`` и ``POSTGRES_PASSWORD`` укажите логин и пароль для пользователя соответственно. Рекомендуется использовать сложные комбинации букв, цифр и символов для повышения уровня безопасности.

    .. code:: js
        
        // postgres.env listing 
        
        POSTGRES_HOST=crawler-db
        POSTGRES_DB=blockchain
        POSTGRES_USER=user login
        POSTGRES_PASSWORD=user password

5. Запустите скрипт развертывания командой ``bash ./deploy.sh``.
6. Откройте браузер и перейдите по адресу ``localhost``, чтобы убедиться, что клиент системы успешно развернут.




