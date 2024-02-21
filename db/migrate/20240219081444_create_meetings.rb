class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.string :title
      t.date :date
      t.time :time
      t.string :location
      t.string :status, default: "pending"
      t.string :priority, default: "medium"
      t.string :duration
      t.string :organizer

      t.timestamps
    end
  end
end
