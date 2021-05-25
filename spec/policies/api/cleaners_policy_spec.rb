require "rails_helper"

RSpec.describe Api::CleanersPolicy do
  subject { described_class }

  context "as signed out user", context: :as_signed_out_user do
    permissions :show? do
      let(:cleaner) { create(:cleaner) }

      it { is_expected.to permit(current_user, cleaner: cleaner) }
    end
  end

  context "as signed in user", context: :as_signed_in_user do
    permissions :show? do
      let(:cleaner) { create(:cleaner) }

      it { is_expected.to permit(current_user, cleaner: cleaner) }
    end
  end
end
