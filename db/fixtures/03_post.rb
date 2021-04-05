Post.seed(:id,
  { id: 1,  
    category_id: 1,
    user_id: 1,
    title: 'Core i9-9900K BOX品',
    price: 49478,
    text: 'テスト',
    image: File.open('./app/assets/images/0735858392426.jpg')
  },
  {
    id: 2, 
    category_id: 3,
    user_id: 1,
    title: 'ゲーミングマザーボード ROG STRIX Z490-E GAMING ［ATX /LGA1200］',
    price: 35525,
    text: 'テスト',
    image: File.open('./app/assets/images/0192876671627_A01.jpg')
  },
  {
    id: 3, 
    category_id: 4,
    user_id: 1,
    title: 'グラフィックボード GeForce GTX 1650 D6 VENTUS XS OCV1 ［4GB /GeForce GTXシリーズ］',
    price: 16500,
    text: 'テスト',
    image: File.open('./app/assets/images/0824142222973.jpg')
  },
  {
    id: 4, 
    category_id: 5,
    user_id: 1,
    title: 'D3U1600PS-8G (240pin/DDR3-1600/8GB)',
    price: 3127,
    text: 'テスト',
    image: File.open('./app/assets/images/4988755019972.jpg')
  }
)