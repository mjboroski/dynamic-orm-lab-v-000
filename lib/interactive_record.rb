require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord
  
  def self.table_name
    self.class.to_s.downcase.pluralize
  end

  def self.column_names
    DB[:conn].results_as_hash = true
    sql="PRAGMA table_info(?)"
    table_info=DB[:conn].execute(sql, self.table_name)
    column_names=[]
    table_info.each do |column|
      column_names << column["name"]
    end
    column_names.compact
  end

  

end