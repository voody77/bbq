class ApplicationController < ActionController::Base
  add_flash_types :notice, :error, :success, :alert
end
