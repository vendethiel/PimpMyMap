class MapFile < ApplicationRecord
  belongs_to :map
  mount_uploader :file, MapFileUploader
end
