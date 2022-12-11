class SeachesController < ApplicationController
  def seach
    @model = params[:model]
    @search = params[:search]
    @content = params[:content]
    if @model = "user"
      @users = User.search_for(@content, @search)
    else
      @books = Book.search_for(@content,@search)
    end
  end
end
