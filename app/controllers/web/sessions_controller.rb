class Web::SessionsController < Web::ApplicationController
  def new
    @type = UserSignInType.new
  end

  def create
    @type = UserSignInType.new(params[:user_sign_in_type])

    if @type.valid?
      flash[:notice] = params[:from]|| 'Success!!!'
      sign_in(@type.user)
      redirect_to params[:from] || root_path
    else
      flash[:alert] = 'Error'
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
