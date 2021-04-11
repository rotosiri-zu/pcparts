crumb :root do
  link "Home", root_path
end

crumb :show_user do
  link 'ユーザー投稿一覧', user_path
  parent :root
end

crumb :posts do
  link '商品名'
end

crumb :new_post do
  link '新規投稿', new_post_path
end  

crumb :show_post do |post|
  link post.title.to_s, post
  parent :posts
end

crumb :edit_post do
  link '投稿の編集', edit_post_path
  parent :root 
end  

crumb :category_show do
  link 'カテゴリー別アイテム一覧', category_path
  parent :root
end

crumb :new_sign_up do
  link '新規会員登録', new_user_registration_path
  parent :root
end

crumb :new_sign_in do
  link 'ログイン', new_user_session_path
  parent :root
end

crumb :policy do
  link '利用規約', policy_path
  parent :root
end

crumb :privacypolicy do
  link 'プライバシーポリシー', privacypolicy_path
  parent :root
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).