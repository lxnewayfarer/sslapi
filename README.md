Запуск:

```
docker-compose up   # запускает в контейнерах postgres и redis
rails db:migrate    # только в первый раз для миграции
rails db:seed       # если нужно чем-то заполнить БД
bundle exec sidekiq     # запускает проверку каждые 20 мин, первый раз сразу (config/sidekiq.yml)
bundle exec rails server    # запускает сервер rails
```

Доступные запросы:
```
GET /domain     # просмотр всех доменов. без параметров

POST /domain    # добавление домена. пример { "domain": "https://change.org" }

PUT /domain     # изменение домена. пример { "id": 5, "https://github.com/"}

DELETE /domain  # удаление домена. пример { "id": 3 }


GET /status     # просмотр всей информации. без параметров


web: /sidekiq   # панель sidekiq. пароль и логин "admin" 

```

Пример ответа на /status:
```
[
    {
        "id": 8,
        "domain": "https://youtube.com",
        "created_at": "2020-02-21T17:38:22.027Z",
        "updated_at": "2020-02-21T17:48:17.587Z",
        "status_is_fine": true,
        "current_state": "all fine",
        "expire_days": 61
    },
    {
        "id": 7,
        "domain": "https://thissitedoesneventexist.com/",
        "created_at": "2020-02-21T17:25:14.954Z",
        "updated_at": "2020-02-21T17:42:44.283Z",
        "status_is_fine": false,
        "current_state": "Non-SSL error",
        "expire_days": -1
    },
    {
        "id": 6,
        "domain": "https://untrusted-root.badssl.com/",
        "created_at": "2020-02-21T17:25:14.942Z",
        "updated_at": "2020-02-21T17:48:17.761Z",
        "status_is_fine": false,
        "current_state": "certificate verify failed (self signed certificate in certificate chain)",
        "expire_days": -1
    }
]
```

Rubocop настроен в .rubocop.yml: отключены пара метрик комплексности, увеличена максимальная длина метода
до 50 строк, включая комменты и выключена метрика "use ascii comments only".
