class GameControl::PuzzlesController < GameControlController
    authorize_actions_for Puzzle
    before_action :set_game_control_puzzle, only: [:show, :edit, :update, :destroy]
    before_action :set_game_control_puzzle_set
    add_breadcrumb "<i class='fa fa-puzzle'></i> Puzzle".html_safe, :game_control_puzzle_path

  # GET /game_control/puzzles
  # GET /game_control/puzzles.json
  def index
    @puzzles = Puzzle.all
  end

  # GET /game_control/puzzles/1
  # GET /game_control/puzzles/1.json
  def show
  end

  # GET /game_control/puzzles/new
  def new
    @puzzle = Puzzle.new
  end

  # GET /game_control/puzzles/1/edit
  def edit
  end

  # POST /game_control/puzzles
  # POST /game_control/puzzles.json
  def create
    @puzzle = Puzzle.new(game_control_puzzle_params)

    respond_to do |format|
      if @puzzle.save
        format.html { redirect_to @puzzle, notice: 'Puzzle was successfully created.' }
        format.json { render :show, status: :created, location: @puzzle }
      else
        format.html { render :new }
        format.json { render json: @puzzle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_control/puzzles/1
  # PATCH/PUT /game_control/puzzles/1.json
  def update
    respond_to do |format|
      if @puzzle.update(game_control_puzzle_params)
        format.html { redirect_to @puzzle, notice: 'Puzzle was successfully updated.' }
        format.json { render :show, status: :ok, location: @puzzle }
      else
        format.html { render :edit }
        format.json { render json: @puzzle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_control/puzzles/1
  # DELETE /game_control/puzzles/1.json
  def destroy
    @puzzle.destroy
    respond_to do |format|
      format.html { redirect_to game_control_puzzles_url, notice: 'Puzzle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_control_puzzle_set
      @puzzle_set = PuzzleSet.find(params[:puzzle_set_id])
    end

    def set_game_control_puzzle
      @puzzle = Puzzle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_control_puzzle_params
      params.require(:puzzle).permit(:title)
    end
end
