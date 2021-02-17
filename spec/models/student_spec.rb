require "rails_helper"

RSpec.describe Student, type: :model do
  describe "relationships" do
    it { should have_many :professor_students}
    it { should have_many(:professors).through(:professor_students)}
  end
  describe "class methods" do
    it "should average ages" do
      @student1 = Student.create!(
        name: "John",
        age: 20
      )
      @student2 = Student.create!(
        name: "Emily",
        age: 11
      )
      @student3 = Student.create!(
        name: "Tim",
        age: 13
      )
      expected = Student.average_age
      expect(expected.round).to eq(15)
    end
  end
end
