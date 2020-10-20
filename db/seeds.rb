# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

CSV.foreach('db/category.csv') do |row|
  Category.create(id: row[0], name: row[1], ancestry: row[2])
end
  
Category.all.each do |category|
  category.posts.create!(
    [
      {
        title: 'Core i9-9900K BOX品',
        name:  'intel(インテル)',category_id: 1,
        price: 49478,
        text: 'テスト',
        image: File.open('./app/assets/images/0735858392426.jpg')
      },
      {
        title: 'ゲーミングマザーボード ROG STRIX Z490-E GAMING ［ATX /LGA1200］',
        name:  'マザーボード'category_id: 2,
        price: 35525,
        text: 'テスト',
        image: File.open('./app/assets/images/0192876671627_A01.jpg')
      },
      {
        title: 'グラフィックボード GeForce GTX 1650 D6 VENTUS XS OCV1 ［4GB /GeForce GTXシリーズ］',
        name:  'グラフィックボード',category_id: 3,
        price: 16500,
        text: 'テスト',
        image: File.open('./app/assets/images/0824142222973.jpg')
      },
      {
        title: 'D3U1600PS-8G (240pin/DDR3-1600/8GB)',
        name:  'メモリー',category_id: 1,
        price: 3127,
        text: 'テスト',
        image: File.open('./app/assets/images/4988755019972.jpg')
      }
    ]
  )
end

Comment.create(
  title: 'テスト',
  rate: 5,
  content: 'テスト' 
)