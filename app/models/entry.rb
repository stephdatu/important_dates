class Entry < ActiveRecord::Base
  attr_accessible :day, :description, :event

  validates :event, :day, :presence => true
end
