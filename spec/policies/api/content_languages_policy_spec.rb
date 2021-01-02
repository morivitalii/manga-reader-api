require "rails_helper"

RSpec.describe Api::ContentLanguagesPolicy do
  subject { described_class }

  permissions :index? do
    it { is_expected.to permit }
  end

  permissions :show? do
    let(:content_language) { create(:content_language) }

    it { is_expected.to permit(nil, content_language) }
  end
end
