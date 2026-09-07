# topce/fq — Homebrew tap for fq

`fq` force-quits macOS GUI applications from the command line, like the
system Force Quit dialog (⌥⌘⎋). Written in OCaml, no third-party
dependencies.

## Install

```sh
brew install topce/fq/fq
```

or, to enable plain `brew install fq` afterwards:

```sh
brew tap topce/fq
brew install fq
```

> Note: the name `fq` is also used by an unrelated homebrew-core formula
> (circonus-labs/fq, a message broker). `brew install fq` without tapping
> installs that one. Always install from this tap as `topce/fq/fq`, or tap
> first so your tap shadows core.

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
