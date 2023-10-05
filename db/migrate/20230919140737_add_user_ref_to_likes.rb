class AddUserRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :user, foreign_key: { on_delete: :cascade }
    add_reference :likes, :post, foreign_key: { on_delete: :cascade }
  end
end
