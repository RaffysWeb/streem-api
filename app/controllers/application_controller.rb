class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing do |exception|
    missing_param = exception.param.to_s
    render json: { errors: { missing_param => 'missing' } }, status: :bad_request
  end
end
