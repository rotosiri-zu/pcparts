User.seed do |s|
  s.id = 1
  s.nickname = "管理者"
  s.email = "admin@gmail.com"
  s.password = "admin0"
  s.password_confirmation = "admin0"
  s.admin = true
end
