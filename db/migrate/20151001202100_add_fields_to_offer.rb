class AddFieldsToOffer < ActiveRecord::Migration
  def change
    add_column :offers, :title, :text
    add_column :offers, :description, :text
    add_column :offers, :deal_end, :datetime
  end
end
