class Api::ApiController < ApplicationController
    skip_before_action :verify_authenticity_token
    #skip_before_action :verify_authenticity_token!
    before_action :set_default_format
    before_action :authenticate_user!

    private
    #Request format will always set up to json
        def set_default_format
            request.format = :json
        end
end
