class CreateChampionships < ActiveRecord::Migration[5.2]
  def change
    create_table :championships do |t|
        t.string            :name
        t.datetime          :start_date
        t.datetime          :end_date
        t.string            :city
        t.timestamps
    end
  end
end
