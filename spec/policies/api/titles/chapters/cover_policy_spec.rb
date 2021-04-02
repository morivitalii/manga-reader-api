require "rails_helper"

RSpec.describe Api::Titles::Chapters::CoverPolicy do
  subject { described_class }

  context "as signed out user", context: :as_signed_out_user do
    permissions :update?, :destroy? do
      let(:chapter) { create(:chapter) }

      it { is_expected.to_not permit(current_user, chapter: chapter) }
    end
  end

  context "as signed in user", context: :as_signed_in_user do
    permissions :update?, :destroy? do
      let(:chapter) { create(:chapter) }

      it { is_expected.to permit(current_user, chapter: chapter) }
    end
  end
end
