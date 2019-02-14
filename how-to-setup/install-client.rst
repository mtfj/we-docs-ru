.. _install-client:

Установка клиента
==============================

**Последовательность действий для установки клиентской части приложения и необходимых для его запуска сервисов**

1. Скачать и установить дистрибутив `Docker CE <https://docs.docker.com/install/>`_. Для скачивания потребуется регистрация на сайте.
    | 1.1. При возникновении следующего окна с ошибкой установки необходимо включить аппаратную поддержку виртуализации в BIOS:

     .. image:: img/virt_error.png
        :height: 150
     
    | 1.2. После установки необходимо убедиться что успешно установились приложения `Docker CE <https://docs.docker.com/install/>`_ и `Docker-compose <https://docs.docker.com/compose/install/>`_ (часть дистрибутива Docker CE):

     .. image:: img/docker_check.png
        :height: 80
    

2. Скачать и разархивировать файл `frontend-deployment.zip <https://github.com/vostokplatform/Vostok-Releases/releases>`_
3. В конфигурационном файле приложения ``frontend-deployment/config/nginx-proxy.env`` указать путь до REST API и hostname ноды

    .. code:: js 
        
        // nginx-proxy.env listing 
        
        VOSTOK_NODE_ADDRESS=http://2.testnet-pos.vostoknodes.com:6862
        VOSTOK_NODE_HOST=2.testnet-pos.vostoknodes.com:6862

4. Запустить скрипт развертывания командой ``bash ./deploy.sh``
5. Открыть браузер и перейдя по адресу ``localhost`` убедиться что клиент системы успешно развернут.

.. note:: Ознакомиться с подробным описанием компонентов установленного приложение возможно в разделе :ref:`"Описание клиента" <client>`.