require "rails_helper"

RSpec.describe Api::Books::VolumesPolicy do
  subject { described_class }

  context "as signed out user", context: :as_signed_out_user do
    permissions :index? do
      it { is_expected.to permit(current_user) }
    end

    permissions :create? do
      it { is_expected.to_not permit(current_user) }
    end

    permissions :show? do
      let(:volume) { create(:volume) }

      it { is_expected.to permit(current_user, volume: volume) }
    end

    permissions :update?, :destroy? do
      let(:volume) { create(:volume) }

      it { is_expected.to_not permit(current_user, volume: volume) }
    end
  end

  context "as signed in user", context: :as_signed_in_user do
    permissions :index? do
      it { is_expected.to permit(current_user) }
    end

    permissions :create? do
      context "with manage system settings access right" do
        let(:current_user) { create(:user_with_manage_books_access_right) }

        it { is_expected.to permit(current_user) }
      end

      context "without manage system settings access right" do
        it { is_expected.to_not permit(current_user) }
      end
    end

    permissions :show? do
      let(:volume) { create(:volume) }

      it { is_expected.to permit(current_user, volume: volume) }
    end

    permissions :update?, :destroy? do
      let(:volume) { create(:volume) }

      context "with manage system settings access right" do
        let(:current_user) { create(:user_with_manage_books_access_right) }

        it { is_expected.to permit(current_user, volume: volume) }
      end

      context "without manage system settings access right" do
        it { is_expected.to_not permit(current_user, volume: volume) }
      end
    end
  end
end
