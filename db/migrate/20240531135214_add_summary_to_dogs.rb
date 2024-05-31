class AddSummaryToDogs < ActiveRecord::Migration[7.1]
  def change
    add_column :dogs, :summary, :text
  end
end
