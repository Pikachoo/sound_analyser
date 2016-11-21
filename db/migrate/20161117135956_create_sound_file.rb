class CreateSoundFile < ActiveRecord::Migration[5.0]
  def change
    create_table :sound_files do |t|
      t.string :file
      t.string :directory
      t.string :file_signature
      t.string :file_hash
      t.timestamps
    end
  end
end
