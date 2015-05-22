class CardsController < ApplicationController
	def create
		@project = Project.find(params[:project_id])
		@card = Card.create(project: @project, title: "???", body: "Write something brilliant here...")
		redirect_to @project, notice: "New card added."
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
	end
end
