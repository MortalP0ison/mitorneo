class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
        t.string            :name
        t.string            :lastname
        t.datetime          :date_of_birth
        t.references        :user
        t.references        :team
        t.timestamps
    end
  end
end
