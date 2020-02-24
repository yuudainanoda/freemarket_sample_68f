# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end
  def new 
    @user = User.new
    @user.build_street_address
  end

  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    if  @user.save

       @user
    else
    redirect_to new_path
    end
    # session ["devise.regist_data"] = {user:@user.attributes}
    # session ["devise.regist_data"] [:user]["password"]= params[:user][:password]
    # @telephone = @user.build_telephone
    # render = :new_telephone
  end

  # def create_telephone
  #   @user = User.new(session["devise.regist_data"]["user"])
  #   @telephone = Telephone.new(telephone_params)
  #   unless @telephone.valid?
  #     flash.now[:alert] = @telephone.errors.full_messages
  #     render :new_telephone and return
  #   end
  #   @user.build_telephone(@telephone.attributes)
  #   @user.save
  #   sign_in(:user, @user)
  # end


  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  private
  def sign_up_params
    params.require(:user).permit(
      :nickname,
      :email,
      :first_name,
      :first_name_kana,
      :last_name,
      :last_name_kana,
      :birth_year,
      :birth_month,
      :birth_day,
      street_address_attributes: [:id, :zipcode, :city, :address,:prefecture,:first_name,:first_name_kana,:last_name,:last_name_kana,:telephone,:_destroy]
    )
  end

  # protected
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up,  keys: [:attribute])
  # end
  #  protected
  #  def telephone_params
  #  params.require(:telephone).permit(:telephone)
  #  end
  # 必要だと思っていた記述ですが、現時点（ユーザー新規登録機能完成時点）で不要なためコメントアウト、全ての機能が完成して問題なければ削除の予定
end
