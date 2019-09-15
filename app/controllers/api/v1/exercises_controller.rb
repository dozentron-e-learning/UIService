class Api::V1::ExercisesController < ApplicationController
  before_action :set_api_v1_exercise, only: [:show, :edit, :update, :destroy]

  # GET /api/v1/exercises
  # GET /api/v1/exercises.json
  def index
    @api_v1_exercises = Api::V1::Exercise.all
  end

  # GET /api/v1/exercises/1
  # GET /api/v1/exercises/1.json
  def show
  end

  # GET /api/v1/exercises/new
  def new
    @api_v1_exercise = Api::V1::Exercise.new
  end

  # GET /api/v1/exercises/1/edit
  def edit
  end

  # POST /api/v1/exercises
  # POST /api/v1/exercises.json
  def create
    @api_v1_exercise = Api::V1::Exercise.new(api_v1_exercise_params)

    respond_to do |format|
      if @api_v1_exercise.save
        format.html { redirect_to @api_v1_exercise, notice: 'Exercise was successfully created.' }
        format.json { render :show, status: :created, location: @api_v1_exercise }
      else
        format.html { render :new }
        format.json { render json: @api_v1_exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/exercises/1
  # PATCH/PUT /api/v1/exercises/1.json
  def update
    respond_to do |format|
      if @api_v1_exercise.update(api_v1_exercise_params)
        format.html { redirect_to @api_v1_exercise, notice: 'Exercise was successfully updated.' }
        format.json { render :show, status: :ok, location: @api_v1_exercise }
      else
        format.html { render :edit }
        format.json { render json: @api_v1_exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/exercises/1
  # DELETE /api/v1/exercises/1.json
  def destroy
    @api_v1_exercise.destroy
    respond_to do |format|
      format.html { redirect_to api_v1_exercises_url, notice: 'Exercise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_exercise
      @api_v1_exercise = Api::V1::Exercise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_exercise_params
      params.require(:api_v1_exercise).permit(:title, :description, :deadline, :visible_date, :do_plagiarism_check, :exercise_test, :exercise_hidden_test, :exercise_stub)
    end
end
