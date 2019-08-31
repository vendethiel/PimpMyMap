class Map < ApplicationRecord
  belongs_to :user
  has_many :ratings

  mount_uploader :image, MapImageUploader
  has_many :screenshots
  has_many :map_files

  def gather_stats
    {
      community_pos: Rating.positive.of_community,
      community_neg: Rating.negative.of_community,
      mapper_pos: Rating.positive.of_mappers,
      mapper_neg: Rating.negative.of_mappers,
      pro_pos: Rating.positive.of_pros,
      pro_neg: Rating.negative.of_pros,
    }
  end
end
