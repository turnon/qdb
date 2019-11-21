require "qdb/version"
require 'active_record'

module Qdb

  class << self
    def setup(path)
      ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: path)
    end

    def create_table(name, &block)
      ActiveRecord::Migration.new.create_table(name, &block)
      Class.new(ActiveRecord::Base).tap{ |model| model.table_name = name }
    rescue ActiveRecord::ConnectionNotEstablished => e
      new_e = ActiveRecord::ConnectionNotEstablished.new("#{e.message} (maybe you should call `Qdb.setup` first)")
      new_e.set_backtrace(e.backtrace)
      raise new_e
    end
  end

end
