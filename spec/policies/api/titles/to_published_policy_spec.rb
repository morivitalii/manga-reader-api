require "rails_helper"

RSpec.describe Api::Titles::ToPublishedPolicy do
  subject { described_class }

  context "as signed out user", context: :as_signed_out_user do
    let(:title) { create(:review_title) }

    permissions :update? do
      it { is_expected.to_not permit(current_user, title: title) }
    end
  end

  context "as signed in user", context: :as_signed_in_user do
    let(:title) { create(:review_title) }

    permissions :update? do
      it { is_expected.to permit(current_user, title: title) }
    end
  end
end
