class PatternsController < ApplicationController

	def index
		@patterns = Pattern.all
	end

	def show
  	@pattern = Pattern.find(params[:id])
	end

	def new
		@pattern = Pattern.new
	end

	def create
	  @pattern = Pattern.new(pattern_params)
	  if @pattern.save
	    redirect_to pattern_path(@pattern)
	  else
	    render 'new', status: 400
	  end
	end

	def edit
  	@pattern = Pattern.find(params[:id])
	end

	def update
	  @pattern = Pattern.find(params[:id])
	  if @pattern.update(pattern_params)
	    redirect_to @pattern
	  else
	    render 'edit', status: 400
	  end
	end

	private

  def pattern_params
    params.require(:pattern).permit(:name, :first, :second, :third)
  end
end
