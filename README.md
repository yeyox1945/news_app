# news_app

A new basic Flutter project to show a basic list of Articles from newsapi.org
using Dio for remote and Isar database for local data persistence.

# Dev

1. Create copy of `.env.template` file and rename it to `.env`
2. Add your own `NEWS_API_KEY` in the environment variables

3. For any change on the database entities run

```
dart run build_runner build
```
