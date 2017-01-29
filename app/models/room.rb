class Room < ActiveRecord::Base

  validates :room_number, :presence => {:message => "Please enter room number"} , uniqueness: true
  validates :building, :presence => {:message => "Please enter building name"}
  validates :size, :presence => {:message => "Please enter size of the room"}
end
