class MapFileController < ApplicationController
  permits :name, :description, :file
  before_action :authenticate_user!, except: :download
  load_and_authorize_resource :map
  load_and_authorize_resource :map_file, through: :map

  def create
    @map_file.save
    redirect_to @map
  end

  def update(id, map_file)
    @map_file.update(map_file)
    redirect_to @map
  end

  def download
    send_file @map_file.file.current_path, filename: @map_file.name
  end
end