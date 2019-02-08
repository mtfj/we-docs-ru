.. _install-client:

Установка клиента
==============================

**Последовательность действий для установки клиентской части приложения и необходимых для его запуска сервисов**

1. Скачать и установить дистрибутивы `Docker CE <https://docs.docker.com/install/linux/docker-ce/ubuntu/>`_ и `Docker-compose <https://docs.docker.com/compose/install/>`_
2. Скачать и разархивировать файл `frontend-deployment.zip <https://github.com/vostokplatform/Vostok-Releases/releases>`_
3. В конфигурационном файле приложения ``frontend-deployment/config/nginx-proxy.env`` указать путь до REST API и hostname ноды

    .. code:: js 
        
        // nginx-proxy.env listing 
        
        VOSTOK_NODE_ADDRESS=http://2.testnet-pos.vostoknodes.com:6862
        VOSTOK_NODE_HOST=2.testnet-pos.vostoknodes.com:6862

4. Запустить скрипт ``./deploy.sh``

.. note:: Ознакомиться с подробным описанием компонентов установленного приложение возможно в разделе :ref:`"Описание клиента" <client>`.