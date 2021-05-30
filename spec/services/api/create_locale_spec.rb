require "rails_helper"

RSpec.describe Api::CreateLocale do
  describe ".call" do
    it "does what it should" do
      service = described_class.new(
        key: "uk"
      )

      expect { service.call }.to change { Locale.count }.by(1)
    end
  end
end
