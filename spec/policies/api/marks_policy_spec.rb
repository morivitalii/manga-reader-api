require "rails_helper"

RSpec.describe Api::MarksPolicy do
  subject { described_class }

  permissions :index? do
    it { is_expected.to permit }
  end
end
