require "rails_helper"

RSpec.describe Api::TitlesPolicy do
  subject { described_class }

  permissions :index? do
    it { is_expected.to permit }
  end

  permissions :show? do
    let(:title) { create(:title) }

    it { is_expected.to permit(nil, title) }
  end
end
