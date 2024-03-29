module Authorization
  extend ActiveSupport::Concern

  included do
    # Catch endpoints without authorization on development phase
    after_action :verify_authorized

    # Catch database queries without authorization on development phase
    after_action :verify_policy_scoped

    rescue_from Pundit::NotAuthorizedError, with: :authorization_error
  end

  def authorization_error
    if pundit_user.present?
      render json: {error: "Forbidden"}, status: 403
    else
      render json: {error: "Unauthorized"}, status: 401
    end
  end

  private

  def authorize(policy_class, options = {})
    super(options, policy_class: policy_class)
  end

  def policy_scope(policy_class, scope)
    super(scope, policy_scope_class: "#{policy_class}::Scope".constantize)
  end

  def permitted_attributes(policy_class, action, wrapper = nil)
    method_name = "permitted_attributes_for_#{action}"
    attributes = policy_class.new(pundit_user).public_send(method_name)

    if wrapper.present?
      params.require(wrapper).permit(attributes)
    else
      params.permit(attributes)
    end
  end

  def pundit_user
    Current.user
  end
end
