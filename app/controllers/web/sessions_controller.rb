class Web::SessionsController < Web::ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: attributes[:email])

    if @user && @user.authenticate(attributes[:password])
      sign_in(@user)

      redirect_to root_path
    else
      flash[:error] = true
      redirect_to action: :new
    end
  end

  def destroy
    sign_out(current_user)
    redirect_to new_sessions_path
  end

  private

  def attributes
    params.require('session').permit(:email, :password)
  end
end
