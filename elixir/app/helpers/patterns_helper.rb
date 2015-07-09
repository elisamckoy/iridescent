module PatternsHelper

	def display
		@pattern = Pattern.find(params[:id])
	end
end
