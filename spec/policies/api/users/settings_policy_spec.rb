require "rails_helper"

RSpec.describe Api::Users::SettingsPolicy do
  subject { described_class }

  context "as signed out user", context: :as_signed_out_user do
    permissions :show?, :update? do
      it { is_expected.to_not permit(current_user) }
    end
  end

  context "as signed in user", context: :as_signed_in_user do
    permissions :show?, :update? do
      it { is_expected.to permit(current_user) }
    end
  end
end
