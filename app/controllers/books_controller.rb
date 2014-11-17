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

  # BOOK DETAILS
  def details
    @book_details=Book.find(params[:id])
    words = @book_details.name.strip.split
    words.map! { |word| "name LIKE '%#{word}%'" }
    sql = words.join(" OR ")
    @other_books=Book.where(sql)
  end



  def author_details
    @this_book=Author.find_by_book_id(params[:id])
    @book_image=Image.find_by_book_id(params[:id])
    @author=Author.where(" author_name like ? ", params[:name]).includes(:book)
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
                                 author_attributes: [:author_name ],image_attributes: [:img ])
  end


end

