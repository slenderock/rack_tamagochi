class ErrorsController < ApplicationController
  def not_found
    respond_with(404, error: true, message: 'Not Found')
  end
end