require "rails_helper"

RSpec.describe Api::ArtistsPolicy do
  subject { described_class }

  context "as signed out user", context: :as_signed_out_user do
    permissions :index? do
      it { is_expected.to permit(current_user) }
    end

    permissions :create? do
      it { is_expected.to_not permit(current_user) }
    end

    permissions :show? do
      let(:artist) { create(:artist) }

      it { is_expected.to permit(current_user, artist: artist) }
    end

    permissions :update?, :destroy? do
      let(:artist) { create(:artist) }

      it { is_expected.to_not permit(current_user, artist: artist) }
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
      let(:artist) { create(:artist) }

      it { is_expected.to permit(current_user, artist: artist) }
    end

    permissions :update?, :destroy? do
      let(:artist) { create(:artist) }

      context "with manage system settings access right" do
        let(:current_user) { create(:user_with_manage_system_settings_access_right) }

        it { is_expected.to permit(current_user, artist: artist) }
      end

      context "without manage system settings access right" do
        it { is_expected.to_not permit(current_user, artist: artist) }
      end
    end
  end
end
