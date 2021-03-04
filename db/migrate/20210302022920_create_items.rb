class CreateItems < ActiveRecord::Migration[6.0]
    def change
      create_table :items do |t|
        t.string     :company_name,   null: false
        t.string     :name,           null: false
        t.string     :nomikuchi,   null: false
        t.string     :nomikata,    null: false
        t.text       :description,    null: false
        t.references :user,           forein_key: true

      t.timestamps
    end
  end
end
