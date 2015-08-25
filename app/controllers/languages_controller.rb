class LanguagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @languages = Language.all

  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
