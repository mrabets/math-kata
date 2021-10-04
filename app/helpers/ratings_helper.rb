module RatingsHelper
  def scores(task_id)
    return Rating.where(task_id: task_id).map{|h| h[:score]}
  end

  def get_average_score(task_id)
    scores = scores(task_id).compact

    unless scores.blank?
      return scores.sum.try(:/, scores.size) 
    else
      return 0
    end
  end
end
