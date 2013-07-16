class Entry < ActiveRecord::Base
  has_many :entries
  attr_accessible :day, :description, :event

  validates :event, :presence => true
end
