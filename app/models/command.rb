class Command < ActiveRecord::Base
  before_create :set_type
  
  # TODO: use an object builder/factory which nicely handles aliases etc.
  # e.g. CommandBuilder.new attributes
  def self.create_and_become(attributes=nil, user_id=nil, room_id=nil, &block)
    attributes.merge! user_id:user_id, room_id:room_id
    command = create attributes, &block
    command.becomes command.type.constantize
  end
  
  def output
    ""
  end
  
  private
  
  def set_type
    # FIXME: prevent arbitrary command types; eg Foo
    self.type =  message? ? 'Message' : switch.capitalize
  end

  def switch
    input[/\/[a-z\_-]*/i][1..-1]
  end
  
  def message?
    !input.start_with? '/'
  end
end
