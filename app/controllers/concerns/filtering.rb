module Filtering
  extend ActiveSupport::Concern

  included do
    rescue_from Api::InvalidParams, with: :filter_param_error
  end

  private

  def filter_param_error(exception)
    render json: {parameter: exception.parameter, error: exception.message}, status: 422
  end
end
