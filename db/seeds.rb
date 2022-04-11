User.create!(
  email: 'cccc@cccc',
  nickname: 'customer',
  password: 'ccc111', 
  password_confirmation: 'ccc111', 
  first_name: 'てすと',
  last_name: 'てすと',
  first_kana: 'テスト',
  last_kana: 'テスト',
  birthday: '1932-03-07',
  buyer_or_customer_id: '3',
  user_comment: 'カスタマーです',
  {images: [File.open('./app/assets/images/testbody.jpg')]}
)

User.create!(
  email: 'bbbb@bbbb',
  password: 'bbb111', 
  password_confirmation: 'bbb111', 
  nickname: 'buyer',
  first_name: 'てすと',
  last_name: 'てすと',
  first_kana: 'テスト',
  last_kana: 'テスト',
  birthday: '1932-03-07',
  buyer_or_customer_id: '2',
  user_comment: 'バイヤーです',
  images: File.open('./app/assets/images/testbody.jpg')
)

Admin.create!(
  email: 'aaaa@aaaa',
  password: 'aaa111', 
  password_confirmation: 'aaa111', 
  admin_name: '株式会社TEST',
)

AdminItem.create!(
  admin_item_name: '買付用パンツ',
  admin_description: '買付用パンツです',
  proper_price: '15000',
  price: '1500',
  images: File.open('./app/assets/images/pants1.jpg'),
  vrf_images: File.open('./app/assets/images/pantstest.png'),
  admin_id: '1',
)

AdminItem.create!(
  admin_item_name: '買付用ダウン',
  admin_description: '買付用ダウンです',
  proper_price: '15000',
  price: '1500',
  images: File.open('./app/assets/images/down1.jpg'),
  vrf_images: File.open('./app/assets/images/downtest.png'),
  admin_id: '1',
)