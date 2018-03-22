class UsersController < ApplicationController

  def show
    # @user = User.find(params[:id])
    @user = current_user

    if @user.nil?
      redirect_to_new_user_registration_path
    end
  end

end
