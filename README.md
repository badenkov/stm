Simple Task Manager
===================

* Develop:
  [![Build Status](https://travis-ci.org/badenkov/stm.png?branch=develop)](https://travis-ci.org/badenkov/stm)
  [![Coverage Status](https://coveralls.io/repos/badenkov/stm/badge.png?branch=develop)](https://coveralls.io/r/badenkov/stm)
* Master
  [![Build Status](https://travis-ci.org/badenkov/stm.png?branch=master)](https://travis-ci.org/badenkov/stm)
  [![Coverage Status](https://coveralls.io/repos/badenkov/stm/badge.png?branch=master)](https://coveralls.io/r/badenkov/stm)

Установка и развертывание
-------------------------

```sh

Приготовления

  git clone http://github.com/badenkov/stm
  cd stm
  bundle install
  bin/rake db:create db:migrate db:seed
  
Скопировать файл с переменными окружения, и подредактировать под свои нужды

  cp ./example.env ./.env
  
Запускаем
  
  bin/foreman start
```

