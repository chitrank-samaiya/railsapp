class ApplicationController < ActionController::Base

  # --------- Filters ------------------------------------------------------
  skip_before_action :verify_authenticity_token
end
