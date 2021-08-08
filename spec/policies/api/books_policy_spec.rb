require "rails_helper"

RSpec.describe Api::BooksPolicy do
  subject { described_class }

  context "as signed out user", context: :as_signed_out_user do
    permissions :index? do
      it { is_expected.to permit(current_user) }
    end

    permissions :show? do
      let(:book) { create(:book) }

      it { is_expected.to permit(current_user, book: book) }
    end

    permissions :update?, :destroy? do
      let(:book) { create(:book) }

      it { is_expected.to_not permit(current_user, book: book) }
    end

    permissions :create? do
      it { is_expected.to_not permit(current_user) }
    end
  end

  context "as signed in user", context: :as_signed_in_user do
    permissions :index? do
      it { is_expected.to permit(current_user) }
    end

    permissions :create? do
      context "with manage books access right" do
        let(:current_user) { create(:user_with_manage_content_access_right) }

        it { is_expected.to permit(current_user) }
      end

      context "without manage books access right" do
        it { is_expected.to_not permit(current_user) }
      end
    end

    permissions :show? do
      let(:book) { create(:book) }

      it { is_expected.to permit(current_user, book: book) }
    end

    permissions :update?, :destroy? do
      let(:book) { create(:book) }

      context "with manage books access right" do
        let(:current_user) { create(:user_with_manage_content_access_right) }

        it { is_expected.to permit(current_user, book: book) }
      end

      context "without manage books access right" do
        it { is_expected.to_not permit(current_user, book: book) }
      end
    end
  end
end
