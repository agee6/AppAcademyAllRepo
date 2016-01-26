class ContactsController < ApplicationController

  def index
    # render text: "I'm in the index action!"
    user = User.find_by_id(params[:user_id])
    render json: [user.contacts, user.shared_contacts]
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save!
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    render json: Contact.find_by_id(params[:id])
  end

  def update
    contact = Contact.find_by_id(params[:id])
    if contact.update!(contact_params)
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    contact = Contact.find_by_id(params[:id])
    if contact.destroy
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
