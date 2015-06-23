class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :destinations
  has_many :todos, through: :destinations

  def sorted_destination_names
    self.destinations.all.sort_by { |x| x.name.capitalize }
    #self.destinations.all.map(&:name).map(&:capitalize).sort
  end
end
