require "rails_helper"

RSpec.describe Api::SignIn do
  describe "validations" do
    context "when user with given username does not exist" do
      it "is invalid" do
        service = described_class.new(username: "riko", password: "password")
        service.validate

        expect(service).to_not be_valid
        expect(service).to have_error(:invalid).on(:username)
      end
    end

    context "when user with given username exists" do
      context "and password does not match" do
        it "is invalid" do
          create(:user, username: "riko", password: "password")
          service = described_class.new(username: "riko", password: "wrong_password")

          service.validate

          expect(service).to_not be_valid
          expect(service).to have_error(:invalid).on(:username)
        end
      end

      context "and password match" do
        it "is valid" do
          create(:user, username: "riko", password: "password")
          service = described_class.new(username: "riko", password: "password")

          expect(service).to be_valid
        end
      end
    end
  end
end
