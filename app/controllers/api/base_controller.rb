class Api::BaseController < ApplicationController
  before_action :authenticate_by_token!

  private

  def authenticate_by_token!
    authenticate_or_request_with_http_token do |token, options|
      sign_in User.find_by_api_key!(token), store: false
    end
  end
end
