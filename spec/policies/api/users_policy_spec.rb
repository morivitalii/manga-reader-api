require "rails_helper"

RSpec.describe Api::UsersPolicy do
  subject { described_class }

  permissions :index? do
    it { is_expected.to permit }
  end

  permissions :show? do
    let(:user) { create(:user) }

    it { is_expected.to permit(nil, user) }
  end
end
