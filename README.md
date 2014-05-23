# flappinator

A command-line utility to help debug flapping processes, including tests.

## Installation

```bash
gem install flappinator
```

## Usage

The flappinator repeats any given command a number of times (25 by default). When it fails, the command's output is displayed.

```bash
flappinator [ --repetitions=TIMES ] COMMAND
```

For example:

```bash
flappinator rspec spec/models/flapping_spec.rb
```
