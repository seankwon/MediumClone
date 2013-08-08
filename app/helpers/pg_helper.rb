module PgHelper
  def find_posts_by_user_id(id)
    sqlquery = 'SELECT * FROM posts WHERE user_id = ' + id.to_s + 'ORDER BY created_at DESC'
    return Post.find_by_sql(sqlquery)
  end

  def find_all_posts
    sqlquery = 'SELECT * FROM posts ORDER BY created_at DESC'
    return Post.find_by_sql(sqlquery)
  end
end
