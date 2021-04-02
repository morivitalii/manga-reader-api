require "rails_helper"

RSpec.describe Api::InterfaceLanguagesPolicy do
  subject { described_class }

  context "as signed out user", context: :as_signed_out_user do
    permissions :index? do
      it { is_expected.to permit(current_user) }
    end

    permissions :show? do
      let(:interface_language) { create(:interface_language) }

      it { is_expected.to permit(current_user, interface_language: interface_language) }
    end
  end

  context "as signed in user", context: :as_signed_in_user do
    permissions :index? do
      it { is_expected.to permit(current_user) }
    end

    permissions :show? do
      let(:interface_language) { create(:interface_language) }

      it { is_expected.to permit(current_user, interface_language: interface_language) }
    end
  end
end
