.. _install-client:

Установка клиента
==============================

Для полноценной работы необходимо установить дополнительно приложения `Docker CE <https://docs.docker.com/install/>`_ и `Docker-compose <https://docs.docker.com/compose/install/>`_. Выполните следующие действия для установки клиентской версии:

1. Скачайте и установите дистрибутив `Docker CE <https://docs.docker.com/install/>`_. Для скачивания потребуется регистрация на сайте.

    | 1.1. При возникновении следующего окна с ошибкой установки включите аппаратную поддержку виртуализации в BIOS:

     .. image:: img/virt_error.png
        :height: 150
     
    | 1.2. После установки убедитесь, что успешно установились приложения `Docker CE <https://docs.docker.com/install/>`_ и `Docker-compose <https://docs.docker.com/compose/install/>`_ (часть дистрибутива Docker CE):

     .. image:: img/docker_check.png
        :height: 80
    

2. Скачайте и разархивируйте файл `frontend-deployment.zip <https://github.com/vostokplatform/Vostok-Releases/releases>`_.ч
3. В конфигурационном файле приложения ``frontend-deployment/config/nginx-proxy.env`` укажите путь до REST API и hostname ноды:

    .. code:: js 
        
        // nginx-proxy.env listing 
        
        VOSTOK_NODE_ADDRESS=http://yournet.vostoknodes.com:6862
        VOSTOK_NODE_HOST=yournet.vostoknodes.com:6862

4. Запустите скрипт развертывания командой ``bash ./deploy.sh``.
5. Откройте браузер и перейдите по адресу ``localhost``, чтобы убедиться, что клиент системы успешно развернут.

.. note:: Ознакомиться с подробным описанием компонентов установленного приложение можно в разделе :ref:`Описание клиента <client>`.