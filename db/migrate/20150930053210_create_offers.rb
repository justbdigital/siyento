class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string  :datasource
      t.string  :image_url
      t.string  :deal_url
      t.decimal :deal_price
      t.decimal :original_price
      t.string  :currency
      t.integer :discount
      t.integer :purchases
    end
  end
end
