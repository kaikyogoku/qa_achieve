class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.text :name
      t.text :email
      t.text :content
      
      t.timestamps null: false
    end
  end
end
class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end