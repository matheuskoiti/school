class Classroom < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  def student_name
    student.name
  end

  def course_name
    course.name
  end
end
