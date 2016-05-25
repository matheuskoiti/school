require 'rails_helper'

RSpec.describe Course, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :status }
  end

  describe "associations" do
    it { is_expected.to have_many(:classrooms) }
    it { is_expected.to have_many(:students).through(:classrooms) }
  end
end
