class Map < ApplicationRecord
  belongs_to :user
  has_many :ratings
  has_many :screenshots
  has_many :map_files

  mount_uploader :image, MapImageUploader

  validates :version do
    presence
    format with: /\Av?[1-9]\d+(\.\d+){0,3}\z/
    length maximum: 100
  end

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
