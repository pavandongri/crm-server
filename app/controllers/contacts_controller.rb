class ContactsController < ApplicationController
    before_action :authenticate_user!
  
    def current_user_contacts
      contacts = current_user.contacts
      render json: contacts, status: 200
    end
  
    def contact_details
      contact = current_user.contacts.find_by(id: params[:id])
    
      if contact
        render json: contact
      else
        render json: { error: 'Contact not found' }, status: :not_found
      end
    end
  
    def create
      contact = current_user.contacts.build(contact_params)

      if contact.save
        render json: contact
      else
        render json: contact.errors, status: :unprocessable_entity
      end
    end

  
    def update
      contact = current_user.contacts.find_by(id: params[:id])
    
      if contact
        if contact.update(contact_params)
          render json: contact
        else
          render json: contact.errors, status: :unprocessable_entity
        end
      else
        render json: { error: 'Contact not found' }, status: :not_found
      end
    end
    
  
    def destroy
      contact = current_user.contacts.find_by(id: params[:id])
    
      if contact
        if contact.destroy
          render json: { message: 'Contact successfully destroyed' }, status: :ok
        else
          render json: { error: 'Failed to destroy contact' }, status: :unprocessable_entity
        end
      else
        render json: { error: 'Contact not found' }, status: :not_found
      end
    end
    
  


    private

    def contact_params
      params.require(:contact).permit(:name, :email, :mobile, :company, :role)
    end

  end
  