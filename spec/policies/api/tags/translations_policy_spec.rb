require "rails_helper"

RSpec.describe Api::Tags::TranslationsPolicy do
  subject { described_class }

  permissions :show? do
    let(:tag) { create(:tag) }

    it { is_expected.to permit(nil, tag) }
  end
end
