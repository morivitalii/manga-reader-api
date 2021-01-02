require "rails_helper"

RSpec.describe Locale do
  describe "validations" do
    subject { create(:locale) }

    it { is_expected.to validate_presence_of(:key) }
    it { is_expected.to validate_uniqueness_of(:key).case_insensitive }
  end
end
