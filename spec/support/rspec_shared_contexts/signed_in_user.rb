RSpec.shared_context "as signed in user" do
  before(:each, type: :request) do
    login_as(current_user)
  end

  let(:current_user) do
    create(:user)
  end
end

RSpec.configure do |config|
  config.include_context "as signed in user", context: :as_signed_in_user
end
