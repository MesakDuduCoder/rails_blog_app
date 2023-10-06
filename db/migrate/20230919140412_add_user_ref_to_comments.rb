class AddUserRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :user, foreign_key: { on_delete: :cascade }
    add_reference :comments, :post, foreign_key: { on_delete: :cascade }
  end
end
