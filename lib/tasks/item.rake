require 'csv'

namespace :item do
  desc "商品情報の読み込み"
  task :import => :environment do |task, args|

    Product.all.delete_all
    Image.all.delete_all

    path = File.join Rails.root, "db/csv/dl-item.csv"

    CSV.foreach(path, encoding: "Shift_JIS:UTF-8", headers: true) do |row|
      product = Product.new
      product.handle = row['商品管理番号（商品URL）']
      product.title = row['商品名']
      product.body = row['PC用商品説明文']
      product.variant_price = row['販売価格']
      product.option1_name = row['項目選択肢別在庫用横軸項目名']
      product.option2_name = row['項目選択肢別在庫用縦軸項目名']
      product.save!

      images = row['商品画像URL'].split
      alts = row['商品画像名（ALT）'].split

      images.each.with_index(0) do |image, index|
        Image.new(
          handle: product.handle,
          src: image,
          alt: alts[index]
        ).save!
      end

    end
  end
end
