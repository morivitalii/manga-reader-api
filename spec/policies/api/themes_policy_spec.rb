require "rails_helper"

RSpec.describe Api::ThemesPolicy do
  subject { described_class }

  permissions :index? do
    it { is_expected.to permit }
  end

  permissions :show? do
    let(:theme) { create(:theme) }

    it { is_expected.to permit(nil, theme) }
  end
end
