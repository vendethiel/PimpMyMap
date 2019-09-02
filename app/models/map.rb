class Map < ApplicationRecord
  belongs_to :user
  has_many :ratings

  mount_uploader :image, MapImageUploader
  has_many :screenshots
  has_many :map_files

  def gather_stats
    {
      community_pos: Rating.positive.of_community.count,
      community_neg: Rating.negative.of_community.count,
      mapper_pos: Rating.positive.of_mappers.count,
      mapper_neg: Rating.negative.of_mappers.count,
      pro_pos: Rating.positive.of_pros.count,
      pro_neg: Rating.negative.of_pros.count,
    }
  end
end
