require "rails_helper"

RSpec.describe Professor, type: :model do
  describe "relationships" do
    it { should have_many :professor_students}
    it { should have_many(:students).through(:professor_students)}
  end
end
