require "rails_helper"

RSpec.describe Api::GroupsPolicy do
  subject { described_class }

  context "as signed out user", context: :as_signed_out_user do
    permissions :index? do
      it { is_expected.to permit(current_user) }
    end

    permissions :create? do
      it { is_expected.to_not permit(current_user) }
    end

    permissions :show? do
      let(:group) { create(:group) }

      it { is_expected.to permit(current_user, group) }
    end
  end

  context "as signed in user", context: :as_signed_in_user do
    permissions :index?, :create? do
      it { is_expected.to permit(current_user) }
    end

    permissions :show? do
      let(:group) { create(:group) }

      it { is_expected.to permit(current_user, group) }
    end
  end
end
