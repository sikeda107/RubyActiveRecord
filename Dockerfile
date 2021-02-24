# https://qiita.com/gatapon/items/4cb543e84e7fcc9238b6
FROM mysql:5.6

RUN apt-get update && \
    apt-get install -y locales vim && \
    rm -rf /var/lib/apt/lists/* && \
    echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8

RUN { \
    echo '[mysqld]'; \
    echo 'character-set-server=utf8mb4'; \
    echo 'collation-server=utf8mb4_general_ci'; \
    echo '[client]'; \
    echo 'default-character-set=utf8mb4'; \
    } > /etc/mysql/conf.d/charset.cnf