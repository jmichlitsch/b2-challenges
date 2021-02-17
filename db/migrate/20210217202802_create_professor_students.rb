class CreateProfessorStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :professor_students do |t|
      t.references :student, foreign_key: true
      t.references :professor, foreign_key: true

      t.timestamps
    end
  end
end
