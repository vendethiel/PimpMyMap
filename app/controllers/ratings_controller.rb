class RatingsController < ApplicationController
  permits :positive
  before_action :authenticate_user!
  load_and_authorize_resource :map

  # TODO reply JS(?)
  # TODO authenticity
  def create
    unless current_user.can_rate?(@map) # XXX flash
      redirect_to @map
      return
    end

    Rating.create!(user: current_user, map: @map, positive: params[:positive])
    redirect_to @map
  end
end
