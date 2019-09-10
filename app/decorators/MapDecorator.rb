module MapDecorator
  def author_name
    if user.present?
      link_to user.display_name, user
    else
      '<unknown author>'
    end
  end

  def thumbnail
    if image.present?
      link_to image_tag(image_url(:thumb)), image_url
    end
  end
end
