class Screenshot < ApplicationRecord
  belongs_to :map
  mount_uploader :image, MapImageUploader
end
