class PagesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:home]

  def home
    @tags = Task.tag_counts_on(:tags)
  end
end
