# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :set_default_response_format
  rescue_from ActiveRecord::RecordNotFound, with: :raise_bad_request

  def raise_bad_request
    render json: { error: 'Record not found' }, status: :not_found
  end

  def set_default_response_format
    request.format = :json
  end
end
