namespace :option do
  require 'csv'
  task :import => :environment do |task, args|
    Option.all.delete_all
    path = File.join Rails.root, "db/csv/dl-select.csv"
    CSV.foreach(path, encoding: "Shift_JIS:UTF-8", headers: true) do |row|
      if row['選択肢タイプ'] == "i"
        product = Product.find_by(handle: row['商品管理番号（商品URL）'])
        unless product.nil?
          option = Option.new
          option.handle = row['商品管理番号（商品URL）']
          option.option1_name = product.option1_name
          option.option1_value = row['項目選択肢別在庫用横軸選択肢']
          option.option2_name = product.option2_name
          option.option2_value = row['項目選択肢別在庫用縦軸選択肢']
          option.save!
        end
      end
    end
  end
end
