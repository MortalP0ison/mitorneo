class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
        t.datetime      :date
        t.string        :place
        t.references    :week
        t.references    :local
        t.references    :visitor
        t.timestamps
    end
  end
end
