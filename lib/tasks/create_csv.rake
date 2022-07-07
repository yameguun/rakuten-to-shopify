require 'csv'

namespace :create_csv do
  desc "CSV作成処理"
  task :export => :environment do
    csv_export = CSV.generate(:force_quotes => true) do |csv| 
      csv << [
        "Handle",
        "Title",
        "Body (HTML)",
        "Vendor",
        "Standardized Product Type",
        "Custom Product Type",
        "Tags",
        "Published",
        "Option1 Name",
        "Option1 Value",
        "Option2 Name",
        "Option2 Value",
        "Option3 Name",
        "Option3 Value",
        "Variant SKU",
        "Variant Grams",
        "Variant Inventory Tracker",
        "Variant Inventory Qty",
        "Variant Inventory Policy",
        "Variant Fulfillment Service",
        "Variant Price",
        "Variant Compare At Price",
        "Variant Requires Shipping",
        "Variant Taxable",
        "Variant Barcode",
        "Image Src",
        "Image Position",
        "Image Alt Text",
        "Gift Card",
        "SEO Title",
        "SEO Description",
        "Google Shopping / Google Product Category",
        "Google Shopping / Gender",
        "Google Shopping / Age Group",
        "Google Shopping / MPN",
        "Google Shopping / AdWords Grouping",
        "Google Shopping / AdWords Labels",
        "Google Shopping / Condition",
        "Google Shopping / Custom Product",
        "Google Shopping / Custom Label 0",
        "Google Shopping / Custom Label 1",
        "Google Shopping / Custom Label 2",
        "Google Shopping / Custom Label 3",
        "Google Shopping / Custom Label 4",
        "Variant Image",
        "Variant Weight Unit",
        "Variant Tax Code",
        "Cost per item",
        "Price / International",
        "Compare At Price / International",
        "Status"
      ]

      Product.all.each do |product|
        options = Option.where(handle: product.handle)
        options.each.with_index(1) do |option, index|
          if index == 1
            images = Image.where(handle: product.handle)
            images.each.with_index(1) do |image, img_index|
              if img_index == 1
                csv << [
                  "#{product.handle}", # Handle
                  "#{product.title}", # Title
                  "", # Body (HTML)
                  "", # Vendor
                  "", # Standardized Product Type
                  "", # Custom Product Type
                  "", # Tags
                  "TRUE", # Published
                  "#{option.option1_name}", # Option1 Name
                  "#{option.option1_value}", # Option1 Value
                  "#{option.option2_name}", # Option2 Name
                  "#{option.option2_value}", # Option2 Value
                  "", # Option3 Name
                  "", # Option3 Value
                  "", # Variant SKU
                  "", # Variant Grams
                  "", # Variant Inventory Tracker
                  "", # Variant Inventory Qty
                  "deny", # Variant Inventory Policy
                  "manual", # Variant Fulfillment Service
                  "#{product.variant_price}", # Variant Price
                  "", # Variant Compare At Price
                  "", # Variant Requires Shipping
                  "", # Variant Taxable
                  "", # Variant Barcode
                  "#{image.src}", # Image Src
                  "#{img_index}", # Image Position
                  "#{image.alt}", # Image Alt Text
                  "", # Gift Card
                  "", # SEO Title
                  "", # SEO Description
                  "", # Google Shopping / Google Product Category
                  "", # Google Shopping / Gender
                  "", # Google Shopping / Age Group
                  "", # Google Shopping / MPN
                  "", # Google Shopping / AdWords Grouping
                  "", # Google Shopping / AdWords Labels
                  "", # Google Shopping / Condition
                  "", # Google Shopping / Custom Product
                  "", # Google Shopping / Custom Label 0
                  "", # Google Shopping / Custom Label 1
                  "", # Google Shopping / Custom Label 2
                  "", # Google Shopping / Custom Label 3
                  "", # Google Shopping / Custom Label 4
                  "", # Variant Image
                  "", # Variant Weight Unit
                  "", # Variant Tax Code
                  "", # Cost per item
                  "", # Price / International
                  "", # Compare At Price / International
                  "active" # Status
                ]
              else
                csv << [
                  "#{product.handle}",
                  "",
                  "",
                  "", # Vendor
                  "", # Standardized Product Type
                  "", # Custom Product Type
                  "", # Tags
                  "", # Published
                  "", # Option1 Name
                  "", # Option1 Value
                  "", # Option2 Name
                  "", # Option2 Value
                  "", # Option3 Name
                  "", # Option3 Value
                  "", # Variant SKU
                  "", # Variant Grams
                  "", # Variant Inventory Tracker
                  "", # Variant Inventory Qty
                  "", # Variant Inventory Policy
                  "", # Variant Fulfillment Service
                  "", # Variant Price
                  "", # Variant Compare At Price
                  "", # Variant Requires Shipping
                  "", # Variant Taxable
                  "", # Variant Barcode
                  "#{image.src}", # Image Src
                  "#{img_index}", # Image Position
                  "#{image.alt}", # Image Alt Text
                  "", # Gift Card
                  "", # SEO Title
                  "", # SEO Description
                  "", # Google Shopping / Google Product Category
                  "", # Google Shopping / Gender
                  "", # Google Shopping / Age Group
                  "", # Google Shopping / MPN
                  "", # Google Shopping / AdWords Grouping
                  "", # Google Shopping / AdWords Labels
                  "", # Google Shopping / Condition
                  "", # Google Shopping / Custom Product
                  "", # Google Shopping / Custom Label 0
                  "", # Google Shopping / Custom Label 1
                  "", # Google Shopping / Custom Label 2
                  "", # Google Shopping / Custom Label 3
                  "", # Google Shopping / Custom Label 4
                  "", # Variant Image
                  "", # Variant Weight Unit
                  "", # Variant Tax Code
                  "", # Cost per item
                  "", # Price / International
                  "", # Compare At Price / International
                  "" # Status
                ]
              end
            end
          else
            csv << [
              "#{product.handle}",
              "",
              "",
              "", # Vendor
              "", # Standardized Product Type
              "", # Custom Product Type
              "", # Tags
              "", # Published
              "", # Option1 Name
              "#{option.option1_value}", # Option1 Value
              "", # Option2 Name
              "#{option.option2_value}", # Option2 Value
              "", # Option3 Name
              "", # Option3 Value
              "", # Variant SKU
              "", # Variant Grams
              "", # Variant Inventory Tracker
              "", # Variant Inventory Qty
              "deny", # Variant Inventory Policy
              "manual", # Variant Fulfillment Service
              "#{product.variant_price}", # Variant Price
              "", # Variant Compare At Price
              "", # Variant Requires Shipping
              "", # Variant Taxable
              "", # Variant Barcode
              "", # Image Src
              "", # Image Position
              "", # Image Alt Text
              "", # Gift Card
              "", # SEO Title
              "", # SEO Description
              "", # Google Shopping / Google Product Category
              "", # Google Shopping / Gender
              "", # Google Shopping / Age Group
              "", # Google Shopping / MPN
              "", # Google Shopping / AdWords Grouping
              "", # Google Shopping / AdWords Labels
              "", # Google Shopping / Condition
              "", # Google Shopping / Custom Product
              "", # Google Shopping / Custom Label 0
              "", # Google Shopping / Custom Label 1
              "", # Google Shopping / Custom Label 2
              "", # Google Shopping / Custom Label 3
              "", # Google Shopping / Custom Label 4
              "", # Variant Image
              "", # Variant Weight Unit
              "", # Variant Tax Code
              "", # Cost per item
              "", # Price / International
              "", # Compare At Price / International
              "" # Status
            ]
          end
        end
      end
    end

    # 現在時間でダウンロードできるようにする
    current_time = DateTime.now.to_s

    # ファイル作成
    File.open("./db/csv/" + current_time + "_product.csv", 'w') do |file|
      file.write(csv_export)
    end
  end
end

