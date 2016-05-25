require 'rails_helper'

RSpec.describe Student, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :register_number }
    it { is_expected.to validate_presence_of :status }
  end

  describe "associations" do
    it { is_expected.to have_many(:classrooms) }
    it { is_expected.to have_many(:courses).through(:classrooms) }
  end
end