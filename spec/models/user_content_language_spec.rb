require "rails_helper"

RSpec.describe UserContentLanguage do
  describe "validations" do
    subject { create(:user_content_language) }

    it { is_expected.to validate_uniqueness_of(:user).scoped_to(:content_language_id) }
  end
end
