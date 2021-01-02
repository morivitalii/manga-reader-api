module Authorization
  extend ActiveSupport::Concern

  included do
    private

    # Catch endpoints without authorization on development phase
    after_action :verify_authorized

    rescue_from Pundit::NotAuthorizedError, with: :authorization_error

    def authorization_error
      if pundit_user.present?
        render json: {error: "Forbidden"}, status: :forbidden
      else
        render json: {error: "Unauthorized"}, status: :unauthorized
      end
    end

    def authorize(policy_class, record = nil)
      super(record, policy_class: policy_class)
    end

    def policy_scope(policy_class, scope)
      super(scope, policy_scope_class: "#{policy_class}::Scope".constantize)
    end

    def pundit_user
      nil
    end
  end
end
