require "rails_helper"

RSpec.describe Translator do
  describe "validations" do
    subject { create(:translator) }

    it { is_expected.to validate_uniqueness_of(:artist) }
  end
end
