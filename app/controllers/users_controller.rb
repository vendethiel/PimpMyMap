class UsersController < ApplicationController
  def show(id)
    @user = User.find(id)
  end
end
