require "rails_helper"

RSpec.describe Api::Tags::TranslationsPolicy do
  subject { described_class }

  context "as signed out user", context: :as_signed_out_user do
    permissions :show? do
      let(:tag) { create(:tag) }

      it { is_expected.to permit(current_user, tag) }
    end
  end

  context "as signed in user", context: :as_signed_in_user do
    permissions :show? do
      let(:tag) { create(:tag) }

      it { is_expected.to permit(current_user, tag) }
    end
  end
end
