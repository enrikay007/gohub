class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

	def edit
	  @user = User.find(params[:id])
	end

	def update
		 @user = User.find(params[:id])
	  if @user.update(user_params)
	  	UserMailer.changepass_email(@user).deliver_now
	    redirect_to new_user_session_path, notice: 'Password was successfully updated.'
	  else
	    redirect_to edit_user_path(current_user.id), alert: 'Password should contain at least 6 characters, one upper case, one lower case and one numeric'
	  end
	end

	private
	  def user_params
	    params.require(:user).permit(:password, :password_confirmation)
	  end


end



