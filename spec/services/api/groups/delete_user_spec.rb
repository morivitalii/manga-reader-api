require "rails_helper"

RSpec.describe Api::Groups::DeleteUser do
  describe ".call" do
    it "does what it should" do
      group_user = create(:group_user)

      service = described_class.new(
        group_user: group_user
      )

      response = service.call

      expect(response).to be_truthy
    end
  end
end
