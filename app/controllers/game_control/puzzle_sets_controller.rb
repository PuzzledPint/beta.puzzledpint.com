class GameControl::PuzzleSetsController < ApplicationController
  authorize_actions_for PuzzleSet
  add_breadcrumb "<i class='fa fa-calendar'></i> Puzzle Sets".html_safe, :game_control_puzzle_sets_path

  # GET /game_control/puzzle_sets
  # GET /game_control/puzzle_sets.json
  def index
    @game_control_puzzle_sets = PuzzleSet.all
  end

  # GET /game_control/puzzle_sets/1
  # GET /game_control/puzzle_sets/1.json
  def show
  end

  # GET /game_control/puzzle_sets/new
  def new
    @game_control_puzzle_set = PuzzleSet.new
  end

  # GET /game_control/puzzle_sets/1/edit
  def edit
  end

  # POST /game_control/puzzle_sets
  # POST /game_control/puzzle_sets.json
  def create
    @game_control_puzzle_set = PuzzleSet.new(game_control_puzzle_set_params)

    respond_to do |format|
      if @game_control_puzzle_set.save
        format.html { redirect_to @game_control_puzzle_set, notice: 'Puzzle set was successfully created.' }
        format.json { render :show, status: :created, location: @game_control_puzzle_set }
      else
        format.html { render :new }
        format.json { render json: @game_control_puzzle_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_control/puzzle_sets/1
  # PATCH/PUT /game_control/puzzle_sets/1.json
  def update
    respond_to do |format|
      if @game_control_puzzle_set.update(game_control_puzzle_set_params)
        format.html { redirect_to @game_control_puzzle_set, notice: 'Puzzle set was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_control_puzzle_set }
      else
        format.html { render :edit }
        format.json { render json: @game_control_puzzle_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_control/puzzle_sets/1
  # DELETE /game_control/puzzle_sets/1.json
  def destroy
    @game_control_puzzle_set.destroy
    respond_to do |format|
      format.html { redirect_to game_control_puzzle_sets_url, notice: 'Puzzle set deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_control_puzzle_set
      @game_control_puzzle_set = PuzzleSet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_control_puzzle_set_params
      params.require(:game_control_puzzle_set).permit(:Puzzles_id, :theme)
    end
end
