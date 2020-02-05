class ProblemsController < ApplicationController
before_action :logged_in_user, only: [:index, :create, :destroy]
before_action :correct_user, only: :destroy

  def index
    @problems = Problem.paginate(page: params[:page])
    time = Time.new.strftime("%Y%m%d%H%M%S")
    filename = "Collection_at_" + time + ".csv"
    respond_to do |format|
      format.html
      format.csv { send_data @problems.to_csv, filename: filename }
    end
  end

  def create
    @problem = current_user.problems.build(problem_params)
    if @problem.save
      flash[:success] = "Problem created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end
  
  def destroy
    @problem.destroy
    flash[:success] = "Problem deleted"
    redirect_to request.referrer || root_url
  end
  
  
  private
    def problem_params
      params.require(:problem).permit(:ProductID,:ProductName,:content,:Description,:Status,:link,:BoL,:Detected_at)
    end
    
    def correct_user
      @problem = current_user.problems.find_by(id: params[:id])
      redirect_to root_url if @problem.nil?
    end
end