class TodosController < ApplicationController
  def new
    @destination = Destination.find(params['destination_id'])
    @todo = @destination.todos.build
    render :new
  end

  def create
    @destination = Destination.find(params['destination_id'])
    @destination.todos.create(todos_params)
    redirect_to user_path(current_user)
  end

  private
  def todos_params
    params.require(:todo).permit(
      :task,
      :location
    )
  end
end

