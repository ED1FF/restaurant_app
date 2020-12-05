class ProfileController < ApplicationController
  def show
    current_user.build_address unless current_user.address
  end

  def update
    current_user.update(user_params)
    flash[:notice] = "Profile has been updated"
    redirect_to profile_path
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :email,
                                 :first_name, :last_name, :phone_number,
                                 address_attributes: %i[id street city_id notes phone_number])
  end
end
