module MessagesHelper
  def markup(text)
    return convert_single_image(text) if single_image(text)
    auto_link text
  end
  
  def convert_single_image(text)
    return unless image = single_image(text)
    link_to(image) { image_tag image }
  end
  
  def single_image(text)
    text[/^(http\S+(?:jpe?g|gif|png))(\?.*)?$/i]
  end
end
