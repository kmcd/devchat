class CommandRouter
  ALIASES = { msg: :message }
  attr_reader :command
    
  def initialize(input)
    substitue_aliases if @command = input.strip[/(?<=\/)[^\s]*/]
  end
  
  def route
    "/#{controller.pluralize}" if controller
  end
  
  private
  
  def acl
    %w[ message ]
  end
  
  def controller
    return 'message' unless command
    command if acl.include? command
  end
  
  def substitue_aliases
    ALIASES.each do |_alias,command| 
      @command.gsub! /^#{_alias.to_s}/, command.to_s 
    end
  end
end