require "rails_helper"

RSpec.describe Web::HomePolicy do
	subject { described_class }

	context "as signed in user", context: :as_signed_in_user do
		permissions :index? do
			it { is_expected.to permit(current_user) }
		end
	end

	context "as signed in user", context: :as_signed_out_user do
		permissions :index? do
			it { is_expected.to permit(current_user) }
		end
	end
end