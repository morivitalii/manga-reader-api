require "rails_helper"

RSpec.describe UserSetting do
  describe "validations" do
    subject { create(:user_setting) }

    it { is_expected.to validate_uniqueness_of(:user) }
    it { is_expected.to validate_length_of(:name).is_at_least(1).is_at_most(25).allow_blank }
    it { is_expected.to validate_length_of(:surname).is_at_least(1).is_at_most(25).allow_blank }
  end
end
