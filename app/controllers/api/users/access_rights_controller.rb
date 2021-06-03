class Api::Users::AccessRightsController < Api::ApplicationController
	skip_after_action :verify_policy_scoped, only: [:show, :update]

	before_action :set_user, only: [:show, :update]
	before_action -> { authorize(Api::Users::AccessRightsPolicy, user: @user) }, only: [:show, :update]

	def show
		access_rights = access_rights_scope.order(id: :asc).all

		access_rights = Api::AccessRightDecorator.decorate(access_rights)
		access_rights = Api::AccessRightSerializer.serialize(access_rights)

		render json: access_rights, status: 200
	end

	def update
		service = Api::Users::UpdateAccessRights.new(update_params)

		if service.call
			access_rights = Api::AccessRightDecorator.decorate(service.user.access_rights)
			access_rights = Api::AccessRightSerializer.serialize(access_rights)

			render json: access_rights, status: 200
		else
			render json: service.errors, status: 422
		end
	end

	private

	def update_params
		permitted_attributes(Api::Users::AccessRightsPolicy, :update).merge!(user: @user)
	end

	def set_user
		@user = params[:user_id].present? ? User.find(params[:user_id]) : Current.user
	end

	def access_rights_scope
		policy_scope(Api::Users::AccessRightsPolicy, @user.access_rights)
	end
end
