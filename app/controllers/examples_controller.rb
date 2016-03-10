class ExamplesController < ApplicationController
  def index
    @notes = Note.last(10)
  end

  def create
    @note = Note.create! content: params[:note][:content], user: @current_user
  end
end
