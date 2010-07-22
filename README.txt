How to create manual:

rails -d mysql blog
cd blog
ruby script/generate scaffold topic name:string creation_time:datetime last_post:datetime user_id:integer
ruby script/generate scaffold post title:string content:text creation_time:datetime user_id:integer topic_id:integer
ruby script/generate scaffold comment content:text creation_time:datetime user_id:integer post_id:integer
ruby script/generate devise_install
********************************
development.rb(add)
	config.action_mailer.default_url_options = { :host => 'localhost:3000' }
----------
routes.rb(add)
	map.devise_for :users
	map.root :controller => 'topics'
---------
enviroment.rb(add)
	config.gem 'warden'
	config.gem 'devise'
-----------
database.yml
	edit password
***********************************
ruby script/generate devise User
**************************
migration_add:
	t.validatable
	t.string :name
	t.integer :role
add_index :users, :name,                 :unique => true
*********************************
rake db:create
rake db:migrate
