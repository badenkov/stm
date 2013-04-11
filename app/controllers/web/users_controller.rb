class Web::UsersController < Web::ApplicationController
  def new
    @type = UserRegistrationType.new
  end

  def create
    @type = UserRegistrationType.new(params[:user])
    if @type.save
      sign_in(@type)
      redirect_to root_path
    else
      render action: 'new'
    end
  end
end
