class CreateItems < ActiveRecord::Migration[6.0]
    def change
      create_table :items do |t|
        t.text       :image
        t.string     :company_name,   null: false
        t.string     :name,           null: false
        t.integer    :nomikuchi_id,   null: false
        t.integer    :nomikata_id,    null: false
        t.text       :description,    null: false
        t.references :user,           forein_key: true

      t.timestamps
    end
  end
end
