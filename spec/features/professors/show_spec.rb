require "rails_helper"

RSpec.describe "As a visitor on a Professors show page" do
  before :each do
    @professor1 = Professor.create!(
      name: "Professor",
      age: 31,
      specialty: "Math"
    )
    @professor2 = Professor.create!(
      name: "Professor 2",
      age: 48,
      specialty: "English"
    )
    @professor3 = Professor.create!(
      name: "Next Prof",
      age: 100,
      specialty: "History"
    )
    @student1 = Student.create!(
      name: "John",
      age: 15
    )
    @student2 = Student.create!(
      name: "Emily",
      age: 14
    )
    @student3 = Student.create!(
      name: "Tim",
      age: 16
    )
    @professor1.students << [@student1, @student3]
    @professor2.students << [@student1, @student2, @student3]
  end

  describe "I see the professors name, age & specialty" do
    it "Shows all student names associated with this professor" do
      visit "/professors/#{@professor2.id}"
      expect(page).to have_content(@professor2.name)
      expect(page).to have_content(@professor2.age)
      expect(page).to have_content(@professor2.specialty)
      expect(page).to have_content(@student1.name)
      expect(page).to have_content(@student2.name)
      expect(page).to have_content(@student3.name)
      visit "/professors/#{@professor1.id}"
      save_and_open_page
      expect(page).to have_content(@professor1.name)
      expect(page).to have_content(@professor1.age)
      expect(page).to have_content(@professor1.specialty)
      expect(page).to have_content(@student1.name)
      expect(page).to have_content(@student3.name)
    end
  end
end
