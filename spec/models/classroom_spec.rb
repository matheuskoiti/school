require 'rails_helper'

RSpec.describe Classroom, type: :model do
	describe "associations" do
		it { is_expected.to belong_to(:student) }
    	it { is_expected.to belong_to(:course) }
	end

	describe "methods" do
		let(:student) { FactoryGirl.create(:student) }
  		let(:course) { FactoryGirl.create(:course) }
  		let!(:classroom) { FactoryGirl.create(:classroom, student_id: student.id, course_id: course.id) }
  
		context "student_name" do
			it { expect(classroom.student_name).to eq(student.name) }
		end
		
		context "student_name" do
			it { expect(classroom.course_name).to eq(course.name) }
		end
	end
end