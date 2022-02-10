class CreateDiplomas < ActiveRecord::Migration[5.2]
  def change
    create_table :diplomas do |t|
      t.string :title                                           # Title obtained (e.g. PhD in Cardiology)
      # t.references :doctor, foreign_key: true, index: true    # Useless now 1 doctor can have 1..N diploma(s)
      # t.references :specialty, index: true                    # Useless as 1 diploma integrate 1 to N specialites
      t.timestamps                                              # Object creation & update timestamping
    end
  end
end
# Table definition complete