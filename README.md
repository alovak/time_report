# TimeReport

## Usage

To track time I spend on taks I use plain text file and Vim. My report file looks
like this:

```
27.06

6:20 - 7:30 Do this
7:30 - 8:50 Do that

26.06

...

```

after you run time_report in directory when you have your time report file
(tasks.todo by default) you get calculated duration for each day:

```

02:30 # 27.06
01:10 # 6:20 - 7:30 Do this
01:20 # 7:30 - 8:50 Do that

04:40 # 26.06
...

```


## Installation

Add this line to your application's Gemfile:

    gem 'time_report'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install time_report


## Contributing

1. Fork it ( https://github.com/alovak/time_report/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
