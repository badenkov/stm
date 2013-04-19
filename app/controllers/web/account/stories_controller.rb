class Web::Account::StoriesController < Web::Account::ApplicationController
  def index
    @stories = current_user.stories
  end
end
