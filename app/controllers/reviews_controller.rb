class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_book
  after_action :set_rating
  load_and_authorize_resource


  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    if @review.save
      UserMailer.new_rating_email(@review).deliver 
      UserMailer.new_review_email(@review).deliver if @review.review_text.length > 0
      UserMailer.new_rating_and_review_email(@review).deliver
    respond_to_creative :created, 'Review was successfully created.', :new
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to_creative :ok, 'Review was successfully updated.', :edit
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to @book, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end


    def respond_to_creative status, notice, action
      respond_to do |format|
        if @review.update(review_params)
          format.html { redirect_to @book, notice: notice }
          format.json { render :show, status: status, location: @review }
        else
          format.html { render action }
          format.json { render json: @review.errors, status: :unprocessable_entity }
        end
      end
    end

    def set_book
      @book = Book.approved?(@user).find(params[:book_id])
    end

    def set_rating
      @book.update(rating: @book.average_rating)
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rating, :review_text, :book_id, :user_id)
    end
end
