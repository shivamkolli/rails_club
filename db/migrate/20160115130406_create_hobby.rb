class CreateHobby < ActiveRecord::Migration
  def change
     create_table :hobbies do |t|
    	t.string :hobby_name
    	t.string :since_from  	
        t.timestamps null: false
    end
    add_reference :hobbies, :user, index: true
  end
end
