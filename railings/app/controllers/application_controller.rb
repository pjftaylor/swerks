class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def helloes
    render html: "hello, world!"
  end
end