require "rails_helper"

RSpec.describe Api::SignUpPolicy do
  subject { described_class }

  context "as signed out user", context: :as_signed_out_user do
    permissions :create? do
      it { is_expected.to permit(current_user) }
    end
  end

  context "as signed in user", context: :as_signed_in_user do
    permissions :create? do
      it { is_expected.to_not permit(current_user) }
    end
  end

  describe ".permitted_attributes_for_create" do
    it "contains attributes" do
      policy = described_class.new(nil)

      expect(policy.permitted_attributes_for_create).to contain_exactly(:username, :email, :password)
    end
  end
end
