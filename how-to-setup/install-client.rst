.. _install-client:

Установка клиента
==============================

**Последовательность действий для установки клиентской части приложения и необходимых для его запуска сервисов**

1. Скачать и установить дистрибутивы `Docker CE <https://docs.docker.com/install/linux/docker-ce/ubuntu/>`_ и `Docker-compose <https://docs.docker.com/compose/install/>`_
2. Скачать и разархивировать файл `frontend-deployment.zip <https://github.com/vostokplatform/Vostok-Releases/releases>`_
3. Скачать docker-образы ``vostok-data-service``, ``vostok-frontend``, ``crawler``
4. Импортировать docker-образы следующими командами:

    .. code:: js

        docker image import vostok-data-service
        docker image import vostok-frontend
        docker image import crawler

5. В конфигурационном файле приоложения ``frontend-deployment/config/nginx-proxy.env`` указать путь до REST API ноды

    .. code:: js 
        
        // nginx-proxy.env listing 
        
        VOSTOK_NODE_ADDRESS = http://3.partner-net.vostoknodes.com:6864

6. Запустить скрипт ``./deploy.sh``

.. note:: Ознакомиться с подробным описанием компонентов установленного приложение возможно в разделе :ref:`"Описание клиента" <client>`.