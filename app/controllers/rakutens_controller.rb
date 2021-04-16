class RakutensController < ApplicationController
  def index
    create_rakuten_data(params)
  end

  def show
  end

  def search
    @number = 5
    @rakutensearch = Rakuten.ransack(params[:rakutensearch])
    @rakutens = @rakutensearch.result(distinct: true).order(id: "DESC").page(params[:page]).per(@number)
    @results = RakutenWebService::Ichiba::Item.search(
      genreId: 100087,
      page: params[:page],
      hits: 30)
    #ここで取得したアイテムをテーブルに保存するがすでに保存されているアイテムは保存しない処理を行う
    @results.each do |result|
      #取得したデータの配列のresultを引数にprivetメソッドreadを呼び出し
      item = Rakuten.new(read(result))
      #rakutensテーブルに同じアイテムがあれば保存しない処理
      unless Rakuten.all.exists?(item_name: item.item_name)
        item.save
      end
    end
  end

  def read(result)
    #Rakutenモデルのインスタンスに埋め込む
    image_url = result['mediumImageUrls'][0]
    item_name = result['itemName']
    item_price = result['itemPrice']
    item_url = result['itemUrl']
    item_caption = result['itemCaption']
    genre_id = result['genreId']
    {
      image_url: image_url,
      item_name: item_name,
      item_price: item_price,
      item_url: item_url,
      item_caption: item_caption,
      genle_id: genre_id,
    }
  end
end
