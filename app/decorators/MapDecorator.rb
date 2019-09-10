module MapDecorator
  include WithThumbnailDecorator

  def author_name
    if user.present?
      link_to user.display_name, user
    else
      '<unknown author>'
    end
  end
end
