require "rails_helper"

RSpec.describe Api::InterfaceLanguagesPolicy do
  subject { described_class }

  permissions :index? do
    it { is_expected.to permit }
  end

  permissions :show? do
    let(:interface_language) { create(:interface_language) }

    it { is_expected.to permit(nil, interface_language) }
  end
end
