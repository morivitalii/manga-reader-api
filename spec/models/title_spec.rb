require "rails_helper"

RSpec.describe Title do
  describe "validations" do
    subject { create(:title) }

    it { is_expected.to validate_presence_of(:title) }
  end
end
