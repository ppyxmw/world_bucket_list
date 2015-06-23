class Todo < ActiveRecord::Base
  belongs_to :destination
  validates_presence_of :task
  validates_presence_of :location
  validates_presence_of :destination

  after_save :geocode, if: :valid?

  geocoded_by :full_address

  def full_address
    "#{location}, #{destination.name}"
  end
end
