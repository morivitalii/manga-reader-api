require "rails_helper"

RSpec.describe Api::WritersPolicy do
  subject { described_class }

  context "as signed out user", context: :as_signed_out_user do
    permissions :show? do
      let(:writer) { create(:writer) }

      it { is_expected.to permit(current_user, writer: writer) }
    end
  end

  context "as signed in user", context: :as_signed_in_user do
    permissions :show? do
      let(:writer) { create(:writer) }

      it { is_expected.to permit(current_user, writer: writer) }
    end
  end
end
