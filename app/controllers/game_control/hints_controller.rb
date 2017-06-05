class GameControl::HintsController < ApplicationController
    authorize_actions_for Hint
    before_action :set_game_control_hint, only: [:show, :edit, :update, :destroy]
    before_action :set_game_control_puzzle_set_and_puzzle
    add_breadcrumb "<i class='fa fa-question-sign'></i> Hint".html_safe, :game_control_hint_path

  # GET /game_control/hints
  # GET /game_control/hints.json
  def index
    @game_control_hints = Hint.all
  end

  # GET /game_control/hints/1
  # GET /game_control/hints/1.json
  def show
  end

  # GET /game_control/hints/new
  def new
    @game_control_hint = Hint.new
  end

  # GET /game_control/hints/1/edit
  def edit
  end

  # POST /game_control/hints
  # POST /game_control/hints.json
  def create
    @game_control_hint = Hint.new(game_control_hint_params)

    respond_to do |format|
      if @game_control_hint.save
        format.html { redirect_to @game_control_hint, notice: 'Hint was successfully created.' }
        format.json { render :show, status: :created, location: @game_control_hint }
      else
        format.html { render :new }
        format.json { render json: @game_control_hint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_control/hints/1
  # PATCH/PUT /game_control/hints/1.json
  def update
    respond_to do |format|
      if @game_control_hint.update(game_control_hint_params)
        format.html { redirect_to @game_control_hint, notice: 'Hint was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_control_hint }
      else
        format.html { render :edit }
        format.json { render json: @game_control_hint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_control/hints/1
  # DELETE /game_control/hints/1.json
  def destroy
    @game_control_hint.destroy
    respond_to do |format|
      format.html { redirect_to game_control_hints_url, notice: 'Hint was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_game_control_puzzle_set_and_puzzle
      @puzzle_set = PuzzleSet.find(params[:puzzle_set_id])
      @puzzle = PuzzleSet.find(params[:puzzle_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_game_control_hint
      @game_control_hint = Hint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_control_hint_params
      params.require(:game_control_hint).permit(:title)
    end
end
