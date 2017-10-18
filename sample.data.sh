#!/bin/bash
php ./bin/console doctrine:database:drop --force --env=test
php ./bin/console doctrine:database:create --env=test
php ./bin/console doctrine:schema:update --force --env=test

php ./bin/console doctrine:query:sql --env=test "insert into member values (null, 'sensorario');"
php ./bin/console doctrine:query:sql --env=test "insert into member values (null, 'deadpool');"
php ./bin/console doctrine:query:sql --env=test "insert into member values (null, 'doctor strange');"

php ./bin/console doctrine:query:sql --env=test "insert into card_type values (null, 'task');"
php ./bin/console doctrine:query:sql --env=test "insert into card_type values (null, 'bug');"

php ./bin/console doctrine:query:sql --env=test "insert into status values (null, 'backlog', 1, null);"
php ./bin/console doctrine:query:sql --env=test "insert into status values (null, 'todo', 2, null);"
php ./bin/console doctrine:query:sql --env=test "insert into status values (null, 'in progress', 3, 1);"
php ./bin/console doctrine:query:sql --env=test "insert into status values (null, 'done', 4, null);"

php ./bin/console doctrine:query:sql --env=test "insert into card values (null, 'release version 1.0.0', 'add lot of features and tag version 1.0.0', 'in progress', 'sensorario', 'task', '2017-12-31');"
php ./bin/console doctrine:query:sql --env=test "insert into card values (null, 'save magic', 'save the magic from Empirikul', 'todo', 'doctor strange', 'task', null);"
php ./bin/console doctrine:query:sql --env=test "insert into card values (null, 'missing arm', 'there is no arm after the battle with doctor strnage', 'in progress', 'deadpool', 'bug', null);"