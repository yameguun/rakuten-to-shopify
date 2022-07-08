require 'csv'

namespace :category do
  desc "カテゴリの読み込み"
  task :import => :environment do |task, args|
    Category.all.delete_all
    path = File.join Rails.root, "db/csv/dl-item-cat.csv"
    CSV.foreach(path, encoding: "Shift_JIS:UTF-8", headers: true) do |row|
      category = Category.new
      category.handle = row['商品管理番号（商品URL）']
      category.name = row['表示先カテゴリ']
      category.save!
    end
  end
end
