class Post < ActiveRecord::Base
  cattr_writer :admin
  attr_accessor :no_data

  def self.admin
    @@admin || false
  end
end
