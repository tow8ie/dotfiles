An always growing, always improving, never ending collection of my
configuration files.


# Prerequisites

You need to have [chezmoi] installed.

# Setup a new machine

```bash
chezmoi init tow8ie --ssh --apply
```

To later sync upstream changes and apply them if conflict-free run

```bash
chezmoi update
```

[chezmoi]: https://www.chezmoi.io/

