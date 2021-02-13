require "rails_helper"

RSpec.describe Api::Titles::CoversPolicy do
  subject { described_class }

  context "as signed out user", context: :as_signed_out_user do
    permissions :index? do
      it { is_expected.to permit(current_user) }
    end

    permissions :show? do
      let(:cover) { create(:cover) }

      it { is_expected.to permit(current_user, cover) }
    end
  end

  context "as signed in user", context: :as_signed_in_user do
    permissions :index? do
      it { is_expected.to permit(current_user) }
    end

    permissions :show? do
      let(:cover) { create(:cover) }

      it { is_expected.to permit(current_user, cover) }
    end
  end
end
