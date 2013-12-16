class Command < ActiveRecord::Base
  SUB_COMMANDS = []
  before_create :set_type # TODO: create virtual attr instead of callback
  
  # TODO: use an object builder/factory which nicely handles aliases etc.
  # e.g. CommandBuilder.new attributes
  def self.create_and_become(attributes=nil, user_id=nil, room_id=nil, &block)
    attributes.merge! user_id:user_id, room_id:room_id
    command = create attributes, &block
    command.becomes command.type.constantize
  end
  
  def self.inherited(klass)
    SUB_COMMANDS << klass
    super
  end
  
  def set_type
    self.type =  message? ? 'Message' : switch.capitalize
  end
  
  def action
    type.downcase
  end

  def switch
    input[/\/[a-z\_-]*/i][1..-1]
  end
  
  def message?
    return true unless input.start_with? '/'
    !SUB_COMMANDS.map(&:to_s).include?(switch)
  end
end
