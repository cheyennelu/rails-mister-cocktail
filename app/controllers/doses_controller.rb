class DosesController < ApplicationController

  def index
  end

  def new
  end

  def create

  end

  def destroy

  end

  private

  def strong_params
    params.require(:dose).require(:description)
  end
end
