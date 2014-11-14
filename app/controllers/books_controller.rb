class BooksController < ApplicationController

  def index
    @books=Book.all
    @images=Image.all
  end

  def new
    @book=Book.new
    @book.build_author
    @book.build_image
  end

  def create

    @book=Book.new(book_params)
    if @book.save!
      logger.info"sssssssssssssssssssssssssssss#{@book.inspect}"
      @book.update(author_id:  @book.author.id )

      flash[:notice]="Added new BOOK"
      redirect_to :action => 'index'
    end
  end

  def show
    @book=Book.search(params[:query])


    respond_to do |format|
      format.js
      format.html
      end

  end

  def destroy
    @book=Book.find_by_id(params[:id])
    @author=Author.find_by_book_id(params[:id])
    @image=Image.find_by_book_id(params[:id])
    @book.destroy
    @author.destroy
    @image.destroy
    redirect_to :action => 'index'
  end



  private
  def book_params
    params.require(:book).permit(:name, :published_by, :price,
                                 author_attributes: [:name ],image_attributes: [:img ])
  end


end

