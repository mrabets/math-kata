module RatingsHelper
  def average_score(task)
    task.ratings.average(:score)
  end
end
