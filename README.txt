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
rake routes
*********************************
add belongs_to and has_many to all models
**********************************
ruby script/generate devise_views
*********************************
deleste all layouts
add application layout
add this div to appplication layout:
	<div id="user_nav">
	<%if user_signed_in?%>
		You signed in as <%=current_user.name%>.
		<%=link_to "Sign Out", destroy_user_session_path %>
	<%else%>
		<%=link_to "Sign Up", new_user_registration_path%> or <%=link_to "Sign In", new_user_session_path%>
	<%end%>
	</div>
-------------------------------
devise.rb
	config.authentication_keys = [ :name ]
----------------
registrations/new.html.erb
	<p><%= f.text_field :name %></p>
-----------------
sessions/new.html.erb
	<p><%= f.text_field :name %></p>
-----------------
add filters
	before_filter :get_admin, :except[:show, index](only admin can edit or create)
	before_filter :aythenticate_user!(authenticate user only)
--------------------
add data to seeds.rb
***********************************
rake db:seed
***********************************
change topic views(index, show)
change post view(show)
---------------
application.html.erb
	<%= javascript_include_tag :defaults %>
--------------------
add _comment_block
add _comment
----------------------
topics/sjow.html.erb
				<%=link_to_function "Comments", visual_effect(:toggle_slide, "comb#{topic.id}") %>
			<div id=<%="comb#{topic.id}"%> style="display: none" >
				<%=render(:partial =>"comment_block", :object=>post) %>
			</div>
**********************************


