class CreateSounds < ActiveRecord::Migration[5.0]
  def change
    create_table :sounds do |t|
      t.integer :sound_file_id
      t.integer :canal_number
      t.integer :select_size
      t.integer :spectral_number
      t.integer :frequency
      t.float   :frequency_extension
      t.float   :block_time
      t.integer :general_time
      t.integer :user_blocks_number
      t.integer :data_size
      t.integer :system_blocks_number
      t.float :max_signal
      t.float :min_signal
      t.text :data
      t.timestamps
    end
  end
end
