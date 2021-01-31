require "rails_helper"

RSpec.describe Cleaner do
  describe "validations" do
    subject { create(:cleaner) }

    it { is_expected.to validate_uniqueness_of(:artist) }
  end
end
