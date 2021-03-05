require "rails_helper"

RSpec.describe Favorite do
  describe "validations" do
    subject { create(:favorite) }

    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:resource) }
    it { is_expected.to validate_uniqueness_of(:user).scoped_to(:resource_type, :resource_id) }
  end
end
