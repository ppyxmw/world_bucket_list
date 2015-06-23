class Todo < ActiveRecord::Base
  belongs_to :destination
  validates_presence_of :task
  validates_presence_of :location
  validates_presence_of :destination
end

