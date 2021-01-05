require "rails_helper"

RSpec.describe GroupUser do
  describe "validations" do
    subject { create(:group_user) }

    it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:group_id) }
  end
end
