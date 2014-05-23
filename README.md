# flappinator

A command-line utility to help debug flapping processes, including tests. It repeats any given command a number of times (25 by default). When it fails, the command's output is displayed.

## Installation

```bash
gem install flappinator
```

## Usage

```bash
flappinator [ --repetitions=TIMES ] COMMAND
```

For example:

```bash
flappinator bundle exec rspec spec/models/flapping_spec.rb
```
