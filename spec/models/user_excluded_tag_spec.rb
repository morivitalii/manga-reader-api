require "rails_helper"

RSpec.describe UserExcludedTag do
  describe "validations" do
    subject { create(:user_excluded_tag) }

    it { is_expected.to validate_uniqueness_of(:user).scoped_to(:tag_id) }
  end
end
