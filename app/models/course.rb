class Course < ActiveRecord::Base
	extend EnumerateIt
  	
  	has_enumeration_for :status, with: AttributeStatus

	has_many :classrooms
  	has_many :students, through: :classrooms

  	validates :name, presence: true
  	validates :description, presence: true
  	validates :status, presence: true
end
