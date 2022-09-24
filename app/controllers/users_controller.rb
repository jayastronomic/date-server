class UsersController < ApplicationController

    def create
        @user = User.new(user_params)
        if @user.save
          login!
          render json: @user, logged_in: logged_in?
        else 
          render json: { status: 500, errors: @user.errors.full_messages }
        end
    end 

    def update
      user = current_user
      if user_params[:avatar] == "remove_photo"
        user.avatar.purge
        user.update(bio: user_params[:bio])
        render json: user, logged_in: logged_in?
      else
        user.update(user_params)
        render json: user, logged_in: logged_in?
      end
    end

    def show
      user = current_user
      render json: user, logged_in: logged_in?
    end

    private

    def user_params
        params.require(:user).permit(
            :email,
            :name, 
            :password,
            :password_confirmation,
            :gender,
            :age,
            :bio,
            :birth_date,
            :avatar
        )
    end
end