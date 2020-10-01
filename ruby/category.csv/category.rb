require "csv"

CSV.open("category.csv", "wb") do |csv|
  csv << ["id", "name", "ancestry"]
  csv << ["1", "cpu"]
  csv << ["2", "マザーボード"]
  csv << ["3", "グラフィックボード"]
  csv << ["4", "メモリー"]
  csv << ["5", "内部HDD・SSD"]
  csv << ["6", "光学ドライブ・その他のドライブ"]
  csv << ["7", "PC電源"]
  csv << ["8", "PCケース"]
  csv << ["9", "クーラー・ファン・冷却"]
  csv << ["10", "その他のパーツ・ケーブル・アクセサリー"]
  csv << ["11", "BTOパソコン"]
  csv << ["12", "intel(インテル)", "1"]
  csv << ["13", "AMD(エーエムディー)", "1"]
end