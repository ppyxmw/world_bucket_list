require 'rails_helper'

RSpec.describe Todo, type: :model do

  let (:user) { User.new( email: 'albert@einstein.com', password: '12345678')}
  let (:destination) { user.destinations.new(name: 'Japan')}
  let (:todo)  {destination.todos.new(task: 'Eat sushi', location: 'Tokyo')}
  let (:todo1) {destination.todos.new(location: 'Tokyo')}
  let (:todo2) {destination.todos.new(task: 'Eat sushi')}
  let (:todo3) {Todo.new(task: 'Eat sushi', location: 'Tokyo')}

  describe 'validation' do
    it 'is created given all right inputs' do
      expect(todo).to be_valid
    end

    it 'requires a location' do
      expect(todo1).to be_invalid
    end

    it 'requires a task' do
      expect(todo2).to be_invalid
    end

    it 'requires a destination' do
      expect(todo3).to be_invalid
    end
  end

  describe 'Geocoding works' do
    it 'has a latitude' do
      expect(todo).
    end

    it 'has a longitude' do
      skip
    end
  end
end
