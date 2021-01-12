class ExamplesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index]

  def index
    @current_account = current_account
  end

  def show
    @current_account = current_account
  end

end # class ExamplesController
