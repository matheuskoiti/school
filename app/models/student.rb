class Student < ActiveRecord::Base
	extend EnumerateIt
  	
  	has_enumeration_for :status, with: AttributeStatus

	has_many :classrooms
  	has_many :courses, through: :classrooms

	validates :name, presence: true
  	validates :register_number, presence: true
  	validates :status, presence: true
end
