class Task < ActiveRecord::Base
  attr_accessible :description, :done, :due_date, :name
  belongs_to :category
  scope :done, where(:done => true).order("due_date DESC")
  scope :undone, where(:done => false).order("due_date")
  scope :search, lambda { |query|
   where([ "name LIKE ?", "%#{query}%" ])
  }

  validates :name, :presence => true, :length => { :maximum => 20 }
  validates :description, :length => { :maximum => 200 }

end
