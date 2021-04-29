json.data @posts do |post|
  json.id post.id
  json.user_id post.user_id
  json.title post.title
  json.slug post.slug
  json.image post.image
  json.content post.content
  json.created_at post.created_at.strftime("%Y-%m-%d %H:%M:%S")
  json.updated_at post.updated_at.strftime("%Y-%m-%d %H:%M:%S")
end

json.links do
  json.first @path + "?page=1"
  json.last @path + "?page=" + @posts.total_pages.to_s
  json.prev @posts.prev_page.present? ? @path + "?page=" + @posts.prev_page.to_s : nil
  json.next @posts.next_page.present? ? @path + "?page=" + @posts.next_page.to_s : nil
end

json.meta do
  json.current_page @posts.current_page
  json.from @from
  json.last_page @posts.total_pages
  json.path @path
  json.per_page @posts.limit_value
  json.to @to
  json.total @posts.total_count
end