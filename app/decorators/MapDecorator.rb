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
      image_tag image_url(:thumb)
    end
  end
end
