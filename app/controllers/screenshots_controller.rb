class ScreenshotsController < ApplicationController
  permits :name, :description, :image
  before_action :authenticate_user!
  load_and_authorize_resource :map
  load_and_authorize_resource :screenshot, through: :map

  def create
    @screenshot.save
    redirect_to @map
  end

  def update(id, screenshot)
    @screenshot.update(screenshot)
    redirect_to @map
  end
end