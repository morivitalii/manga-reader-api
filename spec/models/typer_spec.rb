require "rails_helper"

RSpec.describe Typer do
  describe "validations" do
    subject { create(:typer) }

    it { is_expected.to validate_uniqueness_of(:artist) }
  end
end
