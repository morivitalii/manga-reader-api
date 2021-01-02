require "rails_helper"

RSpec.describe Api::GenresPolicy do
  subject { described_class }

  permissions :index? do
    it { is_expected.to permit }
  end

  permissions :show? do
    let(:genre) { create(:genre) }

    it { is_expected.to permit(nil, genre) }
  end
end
