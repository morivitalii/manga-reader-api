require "rails_helper"

RSpec.describe Api::FormatsPolicy do
  subject { described_class }

  context "as signed out user", context: :as_signed_out_user do
    permissions :index? do
      it { is_expected.to permit(current_user) }
    end

    permissions :show? do
      let(:format) { create(:format) }

      it { is_expected.to permit(current_user, format: format) }
    end
  end

  context "as signed in user", context: :as_signed_in_user do
    permissions :index? do
      it { is_expected.to permit(current_user) }
    end

    permissions :show? do
      let(:format) { create(:format) }

      it { is_expected.to permit(current_user, format: format) }
    end
  end
end
