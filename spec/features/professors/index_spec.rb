require "rails_helper"

RSpec.describe "As a visitor on the Professor Index page" do
  before :each do
    @professor1 = Professor.create!(
      name: "Professor",
      age: 31,
      specialty: "Math"
    )
    @professor2 = Professor.create!(
      name: "Professor2",
      age: 48,
      specialty: "History"
    )
    @professor3 = Professor.create!(
      name: "Prof",
      age: 100,
      specialty: "English"
    )
    @student1 = Student.create!(
      name: "John",
      age: 18
    )
    @student2 = Student.create!(
      name: "Emily",
      age: 15
    )
    @student3 = Student.create!(
      name: "Tim",
      age: 16
    )
    @professor1.students << [@student1, @student3]
    @professor2.students << [@student1, @student2, @student3]
  end

  describe "I see the name of each professor in the page" do
    it "Has a link to 'Update' next to each professor" do
      visit "/professors"
      expect(page).to have_content(@professor1.name)
      expect(page).to have_content(@professor2.name)
      within("#index-prof-#{@professor1.id}") do
        expect(page).to have_link("Update")
        click_link("Update")
      end
      expect(current_path).to eq("/professors/#{@professor1.id}/update")
      expect(page).to have_button("Update Professor")
      fill_in "name", :with => "New Prof"
      fill_in "age", :with => 55
      fill_in "specialty", :with => "Arts"
      click_button("Update Professor")
      expect(current_path).to eq("/professors")
      within("#index-#{@professor1.id}") do
        expect(page).to have_content("New Prof")
        expect(page).to have_content("55")
        expect(page).to have_content("Art")
      end
    end
  end
end
