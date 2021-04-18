require 'csv'

CSV.open('category.csv', 'wb') do |csv|
  csv << ['1', 'intel(インテル)']
  csv << ['2', 'AMD(エーエムディー)']
  csv << %w[3 マザーボード]
  csv << %w[4 グラフィックボード]
  csv << %w[5 メモリー]
  csv << ['6', '内部HDD・SSD']
  csv << ['7', '光学ドライブ・その他のドライブ']
  csv << %w[8 PC電源]
  csv << %w[9 PCケース]
  csv << ['10', 'クーラー・ファン・冷却']
  csv << ['11', 'その他のパーツ・ケーブル・アクセサリー']
  csv << %w[12 BTOパソコン]
end
