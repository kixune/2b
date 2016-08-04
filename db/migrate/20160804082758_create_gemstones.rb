class CreateGemstones < ActiveRecord::Migration[5.0]
  def change
    create_table :gemstones do |t|
      t.string :name
      t.string :version
      t.text :summary
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
