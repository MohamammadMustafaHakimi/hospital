class AddDefaultCuredValueToPatients < ActiveRecord::Migration[7.1]
  def change
    change_column_default :patients, :cured, false
  end
end
