class CardsController < ApplicationController
	before_action :authenticate_user!
	def create
		@project = Project.find(params[:project_id])
		@card = Card.new(project: @project, title: "???", body: "Write something brilliant here...")
		respond_to do |format|
			if @card.save
			format.html {redirect_to @project, notice: "New card added."}
			format.js 
		else
			format.html {redirect_to @project, alert: "There was a problem"}

	end

	def update
  	@card = Card.find params[:id]
	  respond_to do |format|
	    if @card.update(params.require(:card).permit(:title, :body))
	      format.html { redirect_to(@card.project, :notice => 'Card was successfully updated.') }
	      format.json { respond_with_bip(@card) }
	    else
	      format.html { render :action => "edit" }
	      format.json { respond_with_bip(@card) }
	    end
	  end
	end

	def destroy
		@card = Card.find params[:id]
		respond_to do |format|
		if @card.destroy
		format.html { redirect_to @card.project, notice: "Card was deleted"}
		format.js { render nothing: true }
	else
		format.html { redirect_to @card.project, alert: "card could not be deleted. :(" }
		end
	end
end
end
end
end
