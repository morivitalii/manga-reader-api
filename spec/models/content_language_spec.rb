require "rails_helper"

RSpec.describe ContentLanguage do
  describe "validations" do
    subject { create(:content_language) }

    it { is_expected.to validate_uniqueness_of(:locale) }
  end
end
