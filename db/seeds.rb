# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

CSV.foreach('db/category.csv') do |row|
  Category.create(:id => row[0], :name => row[1], :ancestry => row[2])
end
  
Post.create!(
  [
  {
    title: 'Core i9-9900K BOX品',
    category_id:  1,
    price: 49478,
    text: 'テスト',
    image: File.open('./app/assets/images/0735858392426.jpg')
  },
  {
    title: 'ゲーミングマザーボード ROG STRIX Z490-E GAMING ［ATX /LGA1200］',
    category_id:  3,
    price: 35525,
    text: 'テスト',
    image: File.open('./app/assets/images/0192876671627_A01.jpg')
  }
]
)

Comment.create(
  title: 'テスト',
  rate: 5,
  content: 'テスト' 
)