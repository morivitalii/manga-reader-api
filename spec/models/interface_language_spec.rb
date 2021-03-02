require "rails_helper"

RSpec.describe InterfaceLanguage do
  describe "validations" do
    subject { create(:interface_language) }

    it { is_expected.to validate_uniqueness_of(:locale) }
  end
end
