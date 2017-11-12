class CreateHamfactoryEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :hamfactory_entries do |t|
      t.string :type
      t.string :title
      t.string :slug
      t.json :payload
      t.integer :user_id, index: true
      t.string :author_name
      t.datetime :published_at, default: -> { 'CURRENT_TIMESTAMP' }

      t.timestamps null: false
    end
    add_index :hamfactory_entries, :type
    add_index :hamfactory_entries, :slug
  end
end
