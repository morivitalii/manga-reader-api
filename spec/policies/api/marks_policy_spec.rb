require "rails_helper"

RSpec.describe Api::MarksPolicy do
  subject { described_class }

  permissions :index? do
    it { is_expected.to permit }
  end

  permissions :show? do
    let(:mark) { create(:mark) }

    it { is_expected.to permit(nil, mark) }
  end
end
