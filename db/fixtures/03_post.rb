require "csv"

csv = CSV.read("db/post.csv")
csv.each do |post|
  Post.seed do |s|
    s.id = post[0]
    s.image_url = post[1]
    s.title = post[2]
    s.price = post[3]
    s.text = post[4]
    s.category_id = post[5]
  end
end
