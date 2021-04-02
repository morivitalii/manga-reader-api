require "rails_helper"

RSpec.describe Api::PaintersPolicy do
  subject { described_class }

  context "as signed out user", context: :as_signed_out_user do
    permissions :index? do
      it { is_expected.to permit(current_user) }
    end

    permissions :show? do
      let(:painter) { create(:painter) }

      it { is_expected.to permit(current_user, painter: painter) }
    end
  end

  context "as signed in user", context: :as_signed_in_user do
    permissions :index? do
      it { is_expected.to permit(current_user) }
    end

    permissions :show? do
      let(:painter) { create(:painter) }

      it { is_expected.to permit(current_user, painter: painter) }
    end
  end
end
