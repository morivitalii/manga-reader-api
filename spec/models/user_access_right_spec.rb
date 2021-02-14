require "rails_helper"

RSpec.describe UserAccessRight do
  describe "validations" do
    subject { create(:user_access_right) }

    it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:access_right_id) }
  end
end
