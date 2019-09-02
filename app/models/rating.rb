class Rating < ApplicationRecord
  belongs_to :map
  belongs_to :user

  scope :positive, -> { where(positive: true) }
  scope :negative, -> { where(positive: false) }

  scope :of_community, -> { where({}) }
  scope :of_mappers, -> { where({}) }
  scope :of_pros, -> { where({}) }
end
