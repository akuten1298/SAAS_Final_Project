class ContactsController < ApplicationController
	def index
    		@contact = Contact.new
  	end

	def create
	    @contact= Contact.new(contact_params)
  	#	respond_to do |format|
    	if @contact.save
      # Sends email to user when user is created.
      	ExampleMailer.sample_email(@contact).deliver
    #  	format.html { redirect_to @contact, notice: 'User was successfully created.' }
    #  	format.json { render :show, status: :created, location: @contact }
    else
    #  	format.html { render :new }
    #  	format.json { render json: @contact.errors, status: :unprocessable_entity }
    #end
  end
	  redirect_to :controller => 'static_pages', :action => 'index'
end
	private

  	def contact_params
    		params[:contact].permit(:name, :email, :feedback)
  	end
end
