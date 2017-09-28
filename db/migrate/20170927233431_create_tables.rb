class CreateTables < ActiveRecord::Migration
  def change

  	create_table :titles do |t|
  		t.string :name
  	end

  	create_table :figures do |t|
  		t.string :name
  	end


  	create_table :figure_titles do |t|
  		t.belongs_to :figure, index: true
  		t.belongs_to :title, index: true
  	end

  end
end
