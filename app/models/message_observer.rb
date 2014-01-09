class MessageObserver < ActiveRecord::Observer
  def after_create(message)
    # message.cache_last 
  end
end
