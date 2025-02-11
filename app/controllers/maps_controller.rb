class MapsController < ApplicationController
  permits :name, :description, :size, :mode, :category, :image
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource

  # GET /maps
  def index
    @total = Map.count
    if user_signed_in? && params[:only_unrated]
      @maps = @maps.where_not_exists(:ratings, {user: current_user})
    end
    @maps = @maps.page(params[:page])
  end

  # GET /maps/1
  def show
    @stats = @map.gather_stats

    if user_signed_in?
      @current_rating = Rating.find_by(user: current_user, map: @map)
    end
  end

  # GET /maps/new
  def new
  end

  # GET /maps/1/edit
  def edit
  end

  # POST /maps
  def create
    @map.user = current_user
    @map.latest = Time.now
    if @map.save
      redirect_to @map, notice: 'Map was successfully created.'
    else
      render :new
    end
  end

  # PUT /maps/1
  def update(id, map)
    @map.latest = Time.now
    if @map.update(map)
      redirect_to @map, notice: 'Map was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /maps/1
  def destroy(id)
    @map.destroy

    redirect_to maps_url, notice: 'Map was successfully destroyed.'
  end
end
