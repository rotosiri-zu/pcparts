require "csv"

csv = CSV.read("db/category.csv")
csv.each do |category|
  Category.seed do |s|
    s.id = category[0]
    s.name = category[1]
    s.ancestry = category[2]
  end
end
