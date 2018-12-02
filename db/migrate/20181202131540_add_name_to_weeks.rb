class AddNameToWeeks < ActiveRecord::Migration[5.2]
  def change
    add_column      :weeks, :name, :string
  end
end
