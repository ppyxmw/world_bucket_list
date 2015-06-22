class UsersController < ApplicationController
  def show
    @user = User.find(params['id'])
    render :show
  end

  def index
    render text: 'List of users'
  end
end
