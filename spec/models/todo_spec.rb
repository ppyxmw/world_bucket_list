require 'rails_helper'
RSpec.describe Todo, type: :model do

  let (:user) { User.create( email: 'albert@einstein.com', password: '12345678')}
  let (:destination) { user.destinations.create(name: 'Ny')}
  let (:todo)  {destination.todos.create(task: 'Eat sushi', location: 'New York')}
  let (:todo1) {destination.todos.new(location: 'New York')}
  let (:todo2) {destination.todos.new(task: 'Eat sushi')}
  let (:todo3) {Todo.new(task: 'Eat sushi', location: 'New York')}

  describe 'validation' do
    it 'is created given all right inputs' do
      expect(todo).to be_valid
    end

    it 'requires a task' do
      expect(todo1).to be_invalid
    end

    it 'requires a location' do
      expect(todo2).to be_invalid
    end

    it 'requires a destination' do
      expect(todo3).to be_invalid
    end
  end

  describe 'Geocoding works' do
    it 'has a latitude' do
      expect(todo.latitude).to eq(40.7143528)
    end

    it 'has a longitude' do
      expect(todo.longitude).to eq(-74.0059731)
    end
  end
end
