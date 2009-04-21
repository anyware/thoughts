class ThoughtsController < ResourceController::Base
  before_filter :require_user
end
