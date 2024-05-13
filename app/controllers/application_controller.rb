
class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  
  before_action :set_headers

  def set_headers
    response.headers['Content-Type'] = 'application/vnd.api+json'
  end

  def ensure_json_request
    if request.get? || request.delete?
      return if request.headers['Accept'] =~ /vnd\.api\+json/
      render nothing: true, status: 406
    else
      if (request.headers['Content-Type'] =~ /vnd\.api\+json/) &&
         (request.headers['Accept'] =~ /vnd\.api\+json/)
        return
      end
   
      render nothing: true, status: 415
    end
  end
end