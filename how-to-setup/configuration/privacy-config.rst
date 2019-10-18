.. _privacy-config:

Настройка групп доступа к конфиденциальным данным
=========================================================

При использовании методов :ref:`privacy <privacy-api>` активируйте функциональность и заполните блок ``storage`` параметрами настройки БД для хранения конфиденциальных данных:

    ::

        privacy {
          storage {
          enabled = true
          url = "jdbc:postgresql://"${POSTGRES_ADDRESS}":"${POSTGRES_PORT}"/"${POSTGRES_DB}
          driver = "org.postgresql.Driver"
          profile = "slick.jdbc.PostgresProfile$"  
          user = ${POSTGRES_USER}
          password = ${POSTGRES_PASSWORD}
          connectionPool = HikariCP
          connectionTimeout = 5000
          connectionTestQuery = "SELECT 1"
          queueSize = 10000
          numThreads = 20
          schema = "public"
          migration-dir = "db/migration"
          }
         }

**Описание параметров**

* ``enabled`` - активация опции 
* ``url`` - адрес БД PostgreSQL.
* ``driver`` - имя драйвера JDBC.
* ``profile`` - имя профиля для доступа к JDBC.
* ``user`` - имя пользователя для доступа к БД.
* ``password`` - пароль для доступа к БД.
* ``connectionPool`` - имя пула соединений. По умолчанию ``HikariCP``.
* ``connectionTimeout`` - таймаут для соединения.
* ``connectionTestQuery`` - имя тестового запроса.
* ``queueSize`` - размер очереди запросов.
* ``numThreads`` - количество одновременных подключений
* ``schema`` - схема взаимодействия.
* ``migration-dir`` - директория для миграции данных.

Для хранения конфиденциальных данных используется `БД PostgreSQL <https://www.postgresql.org/>`_. База данных устанавливается на машину с нодой, также создается аккаунт доступа к БД. Вы можете воспользоваться справочной документацией на `PostgreSQL <http://www.postgresqltutorial.com/install-postgresql/>`_ для скачивания и установки версии, которая соответствует вашему типу операционной системы.

Во время установки БД система предложит создать аккаунт для доступа к БД. Эти логин и пароль для доступа необходимо внести в соответствующие параметры ``user/password``.

Внесите URL подключения к PostgreSQL в параметр ``url``. В URL входят следующие параметры:

* POSTGRES_ADDRESS - адрес хоста PostgreSQL.
* POSTGRES_PORT - номер порта хоста PostgreSQL.
* POSTGRES_DB - наименование БД PostgreSQL.

Можно указывать URL до БД PostgreSQL в одной строке с данными аккаунта. Пример представлен ниже, где ``user=user_privacy_node_0@vst-dev`` это логин пользователя, ``password=7nZL7Jr41qOWUHz5qKdypA&sslmode=require`` - пароль с опцией требования его ввода при авторизации.

**Пример**

    ::

        privacy.storage.url = "jdbc:postgresql://vostk-dev.postgres.database.azure.com:5432/privacy_node_0?user=user_privacy_node_0@vst-dev&password=7nZL7Jr41qOWUHz5qKdypA&sslmode=require"





