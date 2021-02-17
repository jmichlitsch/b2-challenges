class Professor < ApplicationRecord
  has_many :professor_students
  has_many :students, through: :professor_students
  def remove_student(student_id)
    students.delete(student_id)
  end
end
