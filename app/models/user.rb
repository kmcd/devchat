class User < ActiveRecord::Base
  has_many :messages
  has_many :rooms
  
  def name
    RecursiveOpenStruct.new(info).extra.raw_info.login
  end
end
