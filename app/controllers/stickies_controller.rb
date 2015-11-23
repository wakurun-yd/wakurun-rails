class StickiesController < ApplicationController
  before_action :set_sticky, only: [:show, :edit, :update, :destroy]
  before_action :set_board, only: [:new, :create, :destroy]

  # GET /stickies
  # GET /stickies.json
  def index
    @stickies = Sticky.all
  end

  # GET /stickies/new
  def new
    @sticky = Sticky.new
    @sticky.board = @board
  end

  def update
    set_sticky
    set_board
    if params[:like_btn]
      @sticky.increment :like
      @sticky.save
    end
    redirect_to @board
  end

  # POST /stickies
  # POST /stickies.json
  def create
    @sticky = Sticky.new(sticky_params)
    @sticky.board = @board

    session[:author] = @sticky.author
    session[:group] = @sticky.group

    respond_to do |format|
      if @sticky.save
        format.html { redirect_to @board, notice: 'Sticky was successfully created.' }
        format.json { render :show, status: :created, location: @sticky }
      else
        format.html { render 'boards/show' }
        format.json { render json: @sticky.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stickies/1
  # DELETE /stickies/1.json
  def destroy
    @sticky.destroy

    respond_to do |format|
      format.html { redirect_to @board, notice: 'Sticky was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sticky
      @sticky = Sticky.find(params[:id])
    end

    def set_board
      @board = Board.find(params[:board_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sticky_params
      params.require(:sticky).permit(:group, :comment, :author, :boards_id)
    end
end
