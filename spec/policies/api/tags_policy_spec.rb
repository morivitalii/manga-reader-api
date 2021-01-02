require "rails_helper"

RSpec.describe Api::TagsPolicy do
  subject { described_class }

  permissions :index? do
    it { is_expected.to permit }
  end

  permissions :show? do
    let(:tag) { create(:tag) }

    it { is_expected.to permit(nil, tag) }
  end
end
