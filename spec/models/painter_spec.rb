require "rails_helper"

RSpec.describe Painter do
  describe "validations" do
    subject { create(:painter) }

    it { is_expected.to validate_uniqueness_of(:artist) }
  end
end
