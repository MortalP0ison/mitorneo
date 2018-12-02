class CreateWeeks < ActiveRecord::Migration[5.2]
  def change
    create_table :weeks do |t|
        t.datetime              :date
        t.references            :championship
        t.timestamps
    end
  end
end
