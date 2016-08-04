class CreateJoinTableChestsGemstones < ActiveRecord::Migration[5.0]
  def change
    create_join_table :chests, :gemstones do |t|
     t.index :chest_id
     t.index :gemstone_id
   end
  end
end
