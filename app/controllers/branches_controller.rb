class BranchesController < ApplicationController
  before_action :set_branch, only: [:show, :update, :destroy]

  before_action :authenticate_person!, except: :show

  # GET /branches.json
  def index
    @branches = Branch.all
    render json: @branches
  end

  # GET /branches/1.json
  def show
    respond_to do |format|
      format.html
      format.json
    end
  end

  # POST /branches.json
  def create
    @branch = Branch.new(branch_params)
    authorize!(:create, @branch)
    respond_to do |format|
      if @branch.save
        format.json { render json: @branch, status: :created, location: @branch }
      else
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /branches/1.json
  def update
    authorize!(:update, @branch)
    respond_to do |format|
      if @branch.update(branch_params)
        format.json { head :no_content }
      else
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /branches/1.json
  def destroy
    authorize!(:destroy, @branch)
    @branch.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_branch
      @branch = Branch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def branch_params
      params.require(:branch).permit(:name, :parent_id)
    end

end
