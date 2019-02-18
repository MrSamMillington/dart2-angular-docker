# dart2 angular docker

An absolute bare-bones dart2 web app.

Adapted to be served up using webdev build & nginx in a docker container

Simply clone the repository and run

```
docker-compose up
```

To run in production, we need to specify the dev compose file

```
docker-compose -f docker-compose.dev.yml up --build
```

** `--build` optional.

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).
