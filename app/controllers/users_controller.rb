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

    private

    def user_params
        params.require(:user).permit(
            :email,
            :name, 
            :password,
            :password_confirmation,
            :age,
            :bio,
            :birth_date
        )
    end
end