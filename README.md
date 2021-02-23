# build-harness

## Usage

At the top of your Makefile add, the following...

```sh
-include $(shell curl -sSL -o .build-harness "https://gitlab.com/bhco/build-harness/-/raw/master/templates/Makefile.build-harness"; echo .build-harness)
```

This will download a Makefile called .build-harness and include it at run-time.

We recommend adding \*build-harness to your projects .gitignore file.

This automatically exposes many new targets that you can leverage throughout your build & CI/CD process.

use the command `make help/all` to see the available targets.
