class RatingsController < ApplicationController
  permits :positive, :comment
  before_action :authenticate_user!
  load_and_authorize_resource :map
  load_and_authorize_resource :rating, through: :map

  # TODO reply JS(?)
  # TODO authenticity

  def create
    @rating.save
    redirect_to @map
  end

  def update(id, rating)
    @rating.update(rating)
    redirect_to @map
  end
end
