# Cmdline

A series of examples of how to build executable ruby scripts that handle command line arguments.

## Definitions

Take the call `server start -e development`.

- Command-line file name is `server`
- Command is the first argument `start`
- Option is the argument pair `-e development`

## Pre-requisites

You'll need [Ruby](https://www.ruby-lang.org/en/) installed (ideally the latest version available) plus the [Bundler](http://bundler.io/) gem.

## Installation

First clone the project

```bash
git clone https://github.com/cruikshanks/cmdline
```

This will create a folder named `cmdline`. Navigate to that folder `cd cmdline` and then run the following command.

```bash
bundle install
```

[Bundler](http://bundler.io/) will download everything needed for the project. Once complete you're good to go!

## Execute

- `./argv_example.rb`
- `./optparse_example.rb`
- `./thor_example.rb`

## Making a script executable

Create your file and then add `#!/usr/bin/env ruby` to the top. `#!/usr/bin/env ruby` is similar to calling ruby from the command line (`ruby example.rb`). The individual entries in the `$PATH` environment variable are checked in order, and the **ruby** found first is used.

Make the file executable

```bash
chmod a+x example.rb
```

This means give e`x`ecute permission to `a`ll users for `example.rb`.

## Attributions

The majority of the content was taken from <http://rubylearning.com/blog/2011/01/03/how-do-i-make-a-command-line-tool-in-ruby/> by [Allen Wei](https://twitter.com/allenwei). Generally I've just corrected Rubycop violations and added additional comments.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cruikshanks/freakin.

## License

The code is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

> If you don't add a license it's neither free or open!
