class CreateAssociates < ActiveRecord::Migration

  def self.up
    create_table :associates do |t|
      t.string :name
      t.text :bio
      t.text :contact_info
      t.string :listing_link
      t.string :email_address
      t.integer :position

      t.timestamps
    end

    add_index :associates, :id

    load(Rails.root.join('db', 'seeds', 'associates.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "associates"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/associates"})
    end

    drop_table :associates
  end

end
