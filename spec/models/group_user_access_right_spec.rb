require "rails_helper"

RSpec.describe GroupUserAccessRight do
  describe "validations" do
    subject { create(:group_user_access_right) }

    it { is_expected.to validate_uniqueness_of(:group_access_right_id).scoped_to(:group_user_id) }
  end
end
