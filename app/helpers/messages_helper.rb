module MessagesHelper
  URL_REGEX = /(
    (?:ed2k|ftp|http|https|irc|mailto|news|gopher|nntp|telnet|webcal|xmpp|
    callto|feed|svn|urn|aim|rsync|tag|ssh|sftp|rtsp|afs|file)
    \S+)/ix
  
  def markup(text)
    return convert_single_image(text) if convert_single_image text
    return preformat(text)            if multiline? text
    
    text.split(URL_REGEX).each do |line|
      concat auto_link(line).blank? ? line : auto_link(line).html_safe
    end
    nil
  end
  
  def convert_single_image(text)
    return unless image = single_image(text)
    link_to(image) { image_tag image }
  end
  
  def single_image(text)
    text[/^(http\S+(?:jpe?g|gif|png))(\?.*)?$/i]
  end
  
  def preformat(text)
    concat content_tag :pre, text
    nil
  end
  
  def multiline?(text)
    text =~ /\n/
  end
end
