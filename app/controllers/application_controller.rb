class ApplicationController < ActionController::Base
  before_action :authenticate_item!, except: :index
  before_action :authenticate_item!
  before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'kabuki' && password == '0009'
    end
  end
end
