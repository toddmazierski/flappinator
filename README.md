# flappinator

A command-line utility to help debug flapping* processes, including tests. It repeats any given command a number of times. When it fails, the command's output is displayed. May be useful for reproducing failures caught in CI (ex. Jenkins) locally, and also confirming that they're fixed.

\* _Tests that fail intermittently are known as "flappers", "flapping", "flaky", or "flakey"._

## Installation

```bash
gem install flappinator
```

## Usage

```bash
flappinator [ --repetitions=TIMES ] COMMAND
```

  * `--repetitions=TIMES`: number of times to repeat the command (25 by default)
  * `COMMAND`: command to run (if it contains option flags (ex. `-l56`), prepend entire command with `--`)

## Examples

  * RSpec

    ```bash
    flappinator rspec spec/models/flapping_spec.rb
    ```

  * Cucumber

    ```bash
    flappinator -- cucumber features/flapping.feature -l56
    ```
