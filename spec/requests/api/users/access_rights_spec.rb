require "rails_helper"

RSpec.describe Api::Users::AccessRightsController do
	describe ".show", context: :as_signed_in_user do
		context "as current user" do
			it "returns valid response" do
				first_access_right = create(:access_right)
				_user_first_access_right = create(:user_access_right, access_right: first_access_right, user: current_user)
				second_access_right = create(:access_right)
				_user_second_access_right = create(:user_access_right, access_right: second_access_right, user: current_user)

				get "/api/users/access_rights.json"

				expect(response).to have_http_status(200)
				expect(response).to match_json_schema("controllers/api/users/access_rights_controller/show/200")
				expect(response).to have_objects_collection(first_access_right, second_access_right)
			end
		end

		context "for other user" do
			it "returns valid response" do
				user = create(:user)
				first_access_right = create(:access_right)
				_user_first_access_right = create(:user_access_right, access_right: first_access_right, user: user)
				second_access_right = create(:access_right)
				_user_second_access_right = create(:user_access_right, access_right: second_access_right, user: user)

				get "/api/users/#{user.to_param}/access_rights.json"

				expect(response).to have_http_status(200)
				expect(response).to match_json_schema("controllers/api/users/access_rights_controller/show/200")
				expect(response).to have_objects_collection(first_access_right, second_access_right)
			end
		end
	end

	describe ".update", context: :as_signed_in_user do
		it "returns valid response" do
			user = create(:user)
			access_rights = create_list(:access_right, 2)
			manage_users_access_right = create(:manage_users_access_right)
			_user_access_right = create(:user_access_right, access_right: manage_users_access_right, user: current_user)

			params = {
				access_right_ids: access_rights.map(&:id)
			}

			put "/api/users/#{user.to_param}/access_rights.json", params: params

			expect(response).to have_http_status(200)
			expect(response).to match_json_schema("controllers/api/users/access_rights_controller/update/200")
		end
	end
end
