require "rails_helper"

RSpec.describe Api::SignUp do
  describe ".call" do
    it "does what it should" do
      service = described_class.new(
        username: "riko",
        email: "riko@example.com",
        password: "password"
      )

      service.call

      expect(User.count).to eq(1)
      expect(UserSetting.count).to eq(1)
    end
  end
end
