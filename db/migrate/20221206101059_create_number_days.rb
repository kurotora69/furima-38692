class CreateNumberDays < ActiveRecord::Migration[6.0]
  def change
    create_table :number_days do |t|

      t.timestamps
    end
  end
end
