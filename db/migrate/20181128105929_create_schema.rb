class CreateSchema < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.string :title
      t.text :description
    end

    create_table :reviews do |t|
      t.integer :show_id
      t.string :critic_name
      t.string :publication_name
      t.float :score
      t.text :body
    end

    add_index :reviews, :show_id
  end

  # def change
  #   create_table :schemas do |t|
  #   end
  # end
end
