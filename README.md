# Qdb

Quickly build a DB.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'qdb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install qdb

## Usage

Specify the location of sqlite file, then use ActiveRecord::Migration syntax to create_table, you will get an ActiveRecord model.

```ruby
Qdb.setup('/path/to/sqlite.db')

User = Qdb.create_table(:users) do |t|
  t.string :name
end
```

