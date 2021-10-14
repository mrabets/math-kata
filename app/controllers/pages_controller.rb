class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @tags = Task.tag_counts_on(:tags)
    @last_tasks = Task.limit(3).order(created_at: :asc)
    @most_rated_tasks = Task.joins(:ratings).group(:id).order('AVG(ratings.score) DESC').limit(3)
  end
end
