class UsersController < ApplicationController
    before_action :authenticate_user!

    def profile
        render json: {name: current_user.name, email: current_user.email}, status: :ok
    end

    def update
        if current_user.update(name: params[:name], email: params[:email])
          render json: { name: current_user[:name], email: current_user[:email] }, status: :ok
        else
          render json: { error: current_user.errors }, status: :unprocessable_entity
        end
    end

    def destroy
        if current_user.delete
            current_user = nil
            render json: {message: "user deleted successfully"}, status: :ok
        else
            render json: { error: current_user.errors }, status: :unprocessable_entity
        end
    end
        
  
    private

    def user_params
      params.require(:contact).permit(:name, :email)
    end

  end
  