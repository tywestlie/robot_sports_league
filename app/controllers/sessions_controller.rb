class SessionsController < ApplicationController
  def new
    @team ||= Team.new
  end
end