module CommentsHelper

  def comment_body comment
    "<div class='list-group-item'><p>#{comment.body}</p><p>#{comment_time(comment.created_at)}</p><a data-remote=true href='/posts/#{comment.post_id}/comments/#{comment.id}/edit'>Edit</a></div>".html_safe
  end

  def comment_time timestamp
    timestamp.strftime("%Y-%m-%d %H:%M:%S")
  end

end
