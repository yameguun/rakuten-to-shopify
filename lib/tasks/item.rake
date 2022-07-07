namespace :item do
  require 'csv'
  task :import => :environment do |task, args|
    Product.all.delete_all
    path = File.join Rails.root, "db/csv/dl-item.csv"
    CSV.foreach(path, encoding: "Shift_JIS:UTF-8", headers: true) do |row|
      product = Product.new
      product.handle = row['商品管理番号（商品URL）']
      product.title = row['商品名']
      product.body = row['PC用商品説明文']
      product.variant_price = row['販売価格']
      product.image_src = row['商品画像URL']
      product.image_alt = row['商品画像名（ALT）']
      product.option1_name = row['項目選択肢別在庫用横軸項目名']
      product.option2_name = row['項目選択肢別在庫用縦軸項目名']
      product.save!
    end
  end
end
