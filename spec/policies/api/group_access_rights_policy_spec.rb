require "rails_helper"

RSpec.describe Api::GroupAccessRightsPolicy do
  subject { described_class }

  context "as signed out user", context: :as_signed_out_user do
    permissions :index? do
      it { is_expected.to permit(current_user) }
    end

    permissions :show? do
      let(:group_access_right) { create(:group_access_right) }

      it { is_expected.to permit(current_user, group_access_right: group_access_right) }
    end
  end

  context "as signed in user", context: :as_signed_in_user do
    permissions :index? do
      it { is_expected.to permit(current_user) }
    end

    permissions :show? do
      let(:group_access_right) { create(:group_access_right) }

      it { is_expected.to permit(current_user, group_access_right: group_access_right) }
    end
  end
end
