class DestinationsController < ApplicationController
  def new
    @destination = destination.new
  end

  def show
    @destination = destination.find(params['id'])
  end

  def create
    @destination = destination.create(destination_params)
    redirect_to user_path current_user
  end

  def index
  end

  private

  def destination
    current_user.destinations
  end

  def destination_params
      params.require(:destination).permit(
      :name
      )
  end
end
