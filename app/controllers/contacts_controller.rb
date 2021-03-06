class ContactsController < ApplicationController

	def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    
    if @contact.valid?
      ContactMailer.new_contact(@contact).deliver_now
      redirect_to root_path
      flash[:notice] = "Your message has been sent."
    else
      flash[:alert] = "An error occurred while delivering your message."
      render :new
    end
  end

private

  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end

end
