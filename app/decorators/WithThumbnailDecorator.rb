module WithThumbnailDecorator
  # implicit dependencies: [:image(:thumb), :name]
  def thumbnail
    if image.present?
      link_to image_tag(image_url(:thumb), alt: name), image_url
    end
  end
end