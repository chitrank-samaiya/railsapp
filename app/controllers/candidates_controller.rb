class CandidatesController < ApplicationController
  before_action :set_candidate, only: %i[ show edit update destroy ]

  # GET /candidates or /candidates.json
  def index
    @candidates = Candidate.includes(:skill_sets).order(updated_at: :desc)
  end

  # GET /candidates/1 or /candidates/1.json
  def show
  end

  # GET /candidates/new
  def new
    @candidate = Candidate.new
  end

  # GET /candidates/1/edit
  def edit
  end

  # POST /candidates or /candidates.json
  def create
    @candidate = Candidate.new(candidate_params)

    respond_to do |format|
      if @candidate.save
        format.html { redirect_to candidate_url(@candidate), notice: "Candidate was successfully created." }
        format.json { render :show, status: :created, location: @candidate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidates/1 or /candidates/1.json
  def update
    respond_to do |format|
      if @candidate.update(candidate_params)
        format.html { redirect_to candidate_url(@candidate), notice: "Candidate was successfully updated." }
        format.json { render :show, status: :ok, location: @candidate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidates/1 or /candidates/1.json
  def destroy
    @candidate.destroy

    respond_to do |format|
      format.html { redirect_to candidates_url, notice: "Candidate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def reports
    return unless params[:job_id]

    if params[:report_type] == "avg_skill_ratings_above_3"
      @candidates = Candidate.avg_skill_ratings_above_3(params[:job_id])
    elsif params[:report_type] == "avg_skill_ratings_above_3_and_no_rating_below_2"
      @candidates = Candidate.avg_skill_ratings_above_3_and_no_rating_below_2(params[:job_id])
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate
      @candidate = Candidate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def candidate_params
      params.require(:candidate).permit(:name, :email, :dob, :experience, skill_set_attributes: [:id, :name])
    end
end
