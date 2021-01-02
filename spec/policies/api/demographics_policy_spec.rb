require "rails_helper"

RSpec.describe Api::DemographicsPolicy do
  subject { described_class }

  permissions :index? do
    it { is_expected.to permit }
  end

  permissions :show? do
    let(:demographic) { create(:demographic) }

    it { is_expected.to permit(nil, demographic) }
  end
end
