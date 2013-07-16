class Entry < ActiveRecord::Base

  attr_accessible :day, :description, :event

  validates :event, :presence => true
end
