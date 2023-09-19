class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      author_id :integer
      title :string
      text :text
      t.timestamps
      comments_counter: integer
      likes_counter: integer
    end
  end
end
