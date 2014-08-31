class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy, :singlesearch]
  before_filter :authenticate_user!, except: [:index, :show, :search, :singlesearch]
  load_and_authorize_resource
  
  # GET /books
  # GET /books.json
  def index
    if params[:tag]
      @search = Book.active?.search(tags_name_eq: params[:tag])
    else
      @search = Book.active?.search(params[:q])
    end
      @books = @search.result.includes(:reviews, :tags).paginate(:page => params[:page]).order(rating: :desc)
      @search.build_condition
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @search = Review.where(book_id: @book.id).search(params[:q])
    @reviews = @search.result.paginate(:page => params[:page]).order(rating: :desc)
    @search.build_condition
  end

  def search
    index
    render :index
  end

  def singlesearch
    show
    render :show
  end


  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to_creative :created, 'Book was successfully created.', :new

  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to_creative :ok, 'Book was successfully updated.', :edit  
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
      @book.destroy
      respond_to_destructive
  end

  def disable
    @book = Book.find(params[:book_id])
    @book.update(active: false)
    respond_to_destructive
  end

  def manage
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    def respond_to_creative status, notice, action
      respond_to do |format|
        if @book.update(book_params)
          format.html { redirect_to @book, notice: notice }
          format.json { render :show, status: status, location: @book }
        else
          format.html { render action }
          format.json { render json: @book.errors, status: :unprocessable_entity }
        end
      end
    end


    def respond_to_destructive
      respond_to do |format|
        format.html { redirect_to books_path, notice: "Book was successfully removed." }
        format.json { head :no_content }
      end
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :active, :author, :isbn, :tag_list, :cover, :rating, :user_id)
    end
end
