class Web::Account::ApplicationController < Web::ApplicationController
  before_filter :authenticate!
end
