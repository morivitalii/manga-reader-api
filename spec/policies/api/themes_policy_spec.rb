require "rails_helper"

RSpec.describe Api::ThemesPolicy do
  subject { described_class }

  context "as signed out user", context: :as_signed_out_user do
    permissions :index? do
      it { is_expected.to permit(current_user) }
    end

    permissions :create? do
      it { is_expected.to_not permit(current_user) }
    end

    permissions :show? do
      let(:theme) { create(:theme) }

      it { is_expected.to permit(current_user, theme: theme) }
    end

    permissions :update?, :destroy? do
      let(:theme) { create(:theme) }

      it { is_expected.to_not permit(current_user, theme: theme) }
    end
  end

  context "as signed in user", context: :as_signed_in_user do
    permissions :index? do
      it { is_expected.to permit(current_user) }
    end

    permissions :create? do
      context "with manage system content access right" do
        let(:current_user) { create(:user_with_manage_system_content_access_right) }

        it { is_expected.to permit(current_user) }
      end

      context "without manage system content access right" do
        it { is_expected.to_not permit(current_user) }
      end
    end

    permissions :show? do
      let(:theme) { create(:theme) }

      it { is_expected.to permit(current_user, theme: theme) }
    end

    permissions :update?, :destroy? do
      let(:theme) { create(:theme) }

      context "with manage system content access right" do
        let(:current_user) { create(:user_with_manage_system_content_access_right) }

        it { is_expected.to permit(current_user, theme: theme) }
      end

      context "without manage system content access right" do
        it { is_expected.to_not permit(current_user, theme: theme) }
      end
    end
  end
end
