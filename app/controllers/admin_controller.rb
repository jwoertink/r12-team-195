class AdminController < ApplicationController
  layout 'admin'
  USERNAME, PASSWORD = 'admin', 'ha9w8fb34iwu3aseo8fha3'
  
  before_filter :authenticate
  
  private

    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == USERNAME && password == PASSWORD
      end
      
      warden.custom_failure! if performed?
    end
  
end
