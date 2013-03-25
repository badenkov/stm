class Web::UsersController < Web::ApplicationController
  def new
    @type = UserRegistrationType.new
  end

  def create
    @type = UserRegistrationType.new(params[:user])
    if @type.save
      redirect_to new_session_path
    else
      render action: 'new'
    end
  end
end
