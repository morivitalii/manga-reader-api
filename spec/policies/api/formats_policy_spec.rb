require "rails_helper"

RSpec.describe Api::FormatsPolicy do
  subject { described_class }

  permissions :index? do
    it { is_expected.to permit }
  end

  permissions :show? do
    let(:format) { create(:format) }

    it { is_expected.to permit(nil, format) }
  end
end
