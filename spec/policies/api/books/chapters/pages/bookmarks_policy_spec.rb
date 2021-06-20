require "rails_helper"

RSpec.describe Api::Books::Chapters::Pages::BookmarksPolicy do
  subject { described_class }

  context "as signed out user", context: :as_signed_out_user do
    permissions :create?, :destroy? do
      it { is_expected.to_not permit(current_user) }
    end
  end

  context "as signed in user", context: :as_signed_in_user do
    permissions :create?, :destroy? do
      let(:bookmark) { create(:bookmark, user: current_user) }

      it { is_expected.to permit(current_user, bookmark: bookmark) }
    end
  end
end
