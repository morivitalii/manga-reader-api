require "rails_helper"

RSpec.describe Api::TagsPolicy do
  subject { described_class }

  context "as signed out user", context: :as_signed_out_user do
    permissions :index? do
      it { is_expected.to permit(current_user) }
    end

    permissions :create? do
      it { is_expected.to_not permit(current_user) }
    end

    permissions :show? do
      let(:tag) { create(:tag) }

      it { is_expected.to permit(current_user, tag: tag) }
    end

    permissions :update?, :destroy? do
      let(:tag) { create(:tag) }

      it { is_expected.to_not permit(current_user, tag: tag) }
    end
  end

  context "as signed in user", context: :as_signed_in_user do
    permissions :index? do
      it { is_expected.to permit(current_user) }
    end

    permissions :create? do
      context "with manage system settings access right" do
        let(:current_user) { create(:user_with_manage_system_settings_access_right) }

        it { is_expected.to permit(current_user) }
      end

      context "without manage system settings access right" do
        it { is_expected.to_not permit(current_user) }
      end
    end

    permissions :show? do
      let(:tag) { create(:tag) }

      it { is_expected.to permit(current_user, tag: tag) }
    end

    permissions :update?, :destroy? do
      let(:tag) { create(:tag) }

      context "with manage system settings access right" do
        let(:current_user) { create(:user_with_manage_system_settings_access_right) }

        it { is_expected.to permit(current_user, tag: tag) }
      end

      context "without manage system settings access right" do
        it { is_expected.to_not permit(current_user, tag: tag) }
      end
    end
  end
end
