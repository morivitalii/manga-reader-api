require "rails_helper"

RSpec.describe Api::Users::AccessRightsPolicy do
	subject { described_class }

	context "as signed out user", context: :as_signed_out_user do
		context "when user is not specified" do
			let(:user) { nil }

			permissions :show? do
				it { is_expected.to_not permit(current_user, user: user) }
			end
		end

		context "when user specified" do
			context "as other user" do
				let(:user) { create(:user) }

				permissions :show? do
					it { is_expected.to permit(current_user, user: user) }
				end

				permissions :update? do
					it { is_expected.to_not permit(current_user, user: user) }
				end
			end

			context "as current user" do
				let(:user) { current_user }

				permissions :show?, :update? do
					it { is_expected.to_not permit(current_user, user: user) }
				end
			end
		end
	end

	context "as signed in user", context: :as_signed_in_user do
		context "as current user" do
			let(:user) { create(:user) }

			permissions :show? do
				it { is_expected.to permit(current_user, user: user) }
			end

			permissions :update? do
				it { is_expected.to_not permit(current_user, user: user) }
			end
		end

		context "as other user" do
			context "with manage users access right" do
				let(:user) { create(:user) }
				let(:current_user) { create(:user_with_manage_users_access_right) }

				permissions :show?, :update? do
					it { is_expected.to permit(current_user, user: user) }
				end
			end

			context "without manage users access right" do
				let(:user) { create(:user) }

				permissions :show? do
					it { is_expected.to permit(current_user, user: user) }
				end

				permissions :update? do
					it { is_expected.to_not permit(current_user, user: user) }
				end
			end
		end
	end
end
