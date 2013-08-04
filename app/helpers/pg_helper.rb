module PgHelper
  def find_posts_by_user_id(id)
    sqlquery = 'SELECT * FROM posts WHERE user_id = ' + id.to_s
    return Post.find_by_sql(sqlquery)
  end
end
