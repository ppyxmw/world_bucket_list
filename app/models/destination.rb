class Destination < ActiveRecord::Base
  belongs_to :user
  has_many :todos

  after_create :capitalize
  def capitalize
    self.name = self.name.capitalize
    self.save!
  end
end
