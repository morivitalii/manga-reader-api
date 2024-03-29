require "rails_helper"

RSpec.describe User do
  subject { described_class }

  describe "validations" do
    subject { create(:user) }

    it { is_expected.to have_secure_password }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username).case_insensitive }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_length_of(:password).is_at_least(6).is_at_most(24) }
  end
end
