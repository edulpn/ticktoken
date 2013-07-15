class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  def authorize
    case request.format
    when Mime::JSON, Mime::XML, Mime::ATOM
      authenticate_or_request_with_http_token do |token, options|
        user = User.find(params[:user_id])
        if user
          user.api_keys.exists?(access_token: token)
        end
      end
    else
      redirect_to signin_url, alert: "Not authorized." if current_user.nil?
    end
  end
end
