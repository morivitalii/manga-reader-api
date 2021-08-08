require "rails_helper"

RSpec.describe Web::ArtistsPolicy do
	subject { described_class }

	context "as signed in user", context: :as_signed_in_user do
		context "with granted access" do
			before do
				grant_access_right(current_user, :manage_content)
			end

			permissions :new?, :create? do
				it { is_expected.to permit(current_user) }
			end
		end

		context "without granted access" do
			permissions :new?, :create? do
				it { is_expected.to_not permit(current_user) }
			end
		end
	end

	context "as signed out user", context: :as_signed_out_user do
		permissions :new?, :create? do
			it { is_expected.to_not permit(current_user) }
		end
	end
end