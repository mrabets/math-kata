module CommentsHelper
  def user_image(comment)
    User.find(comment.user_id).image
  end

  def user_name_link(comment)
    link_to User.find(comment.user_id).name, User.find(comment.user_id)
  end

  def user(comment)
    User.find(comment.user_id)
  end
end
