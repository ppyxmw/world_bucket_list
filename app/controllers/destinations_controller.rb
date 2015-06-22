class DestinationsController < ApplicationController
  def new
    @destination = current_user.destinations.new
  end

  def create
    @destination = current_user.destinations.create(destination_params)
    redirect_to user_path current_user
  end

  def index

  end

  private

  def destination_params
    params.require(:destination).permit(
      :name
      )
  end

end
