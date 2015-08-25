class RegistersController < ApplicationController
  def index
    @code = Code.find_by_id(params[:code_id])
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
