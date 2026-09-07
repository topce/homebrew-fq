# topce/fq — Homebrew tap for fq

`fq` force-quits macOS GUI applications from the command line, like the
system Force Quit dialog (⌥⌘⎋). Written in OCaml, no third-party
dependencies.

## Install

```sh
brew install topce/fq/fq
```

That's it — no manual tap needed; the fully qualified name pulls the
formula straight from this tap.

> **Name clash:** an unrelated message broker is also published as `fq` in
> homebrew-core. homebrew-core outranks third-party taps, so plain
> `brew install fq` installs *that* broker. Always use the fully qualified
> `brew install topce/fq/fq` to get this tool.

## Usage

```
fq [OPTIONS] [APP]

  fq                       pick an application interactively
  fq "Safari"              force quit Safari (asks for confirmation)
  fq -y firefox            non-interactive force quit
  fq --list                list running apps as "pid name"
  fq --all                 force quit every app except protected system ones
  fq --others              force quit every other app except this terminal
  fq -p 1234               force quit by PID
```

See the upstream README for the full option list and safety notes:
https://github.com/topce/fq
