# NOTE: Controller for static pages. i.e. welcome, terms_of_service, about_us, etc.
class PagesController < ApplicationController

  # NOTE: Static pages should not require a signed in user.
  skip_before_action :authenticate_user!

  def welcome
  end

end # class PagesController
