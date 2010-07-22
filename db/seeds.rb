User.delete_all
Topic.delete_all
Post.delete_all
Comment.delete_all

admin=User.create({:name=>'admin', :email=>'probitiy@mail.ru', :password=>'111111', :password_confirmation=>'111111', :role=>1, :confirmation_token=>1})
user=User.create({:name=>'user', :email=>'user@user.ru', :password=>'222222', :password_confirmation=>'222222', :role=>0, :confirmation_token=>2})

topics = Topic.create([{:name=>'First test topic', :creation_time=>Time.now-3.month, :user_id=>admin.id, :last_post=>Time.now},
			{:name=>'Admin topic', :creation_time=>Time.now-2.week, :user_id=>admin.id, :last_post=>Time.now},
			{:name=>'Topic for all', :creation_time=>Time.now, :user_id=>admin.id, :last_post=>Time.now}])
posts = Post.create([{ :title=>'First post', :content=>'I need to write something', :creation_time=>Time.now-1.month, :user_id=>admin.id, :topic_id=>Topic.find(:first).id},
			{:title=>'Second post', :content=>'Few words for my second post', :creation_time=>Time.now-1.month, :user_id=>admin.id, :topic_id=>Topic.find(:first).id},
			{:title=>'Third post', :content=>'Discuss all in this post', :creation_time=>Time.now-1.month, :user_id=>admin.id, :topic_id=>Topic.find(:first).id}])
comments = Comment.create([{:content=>'Its hard to say something about it', :creation_time=>Time.now-1.month, :user_id=>user.id, :post_id=>Post.find(:first).id},
			{:content=>'Its my topic and I would happy to create something like it', :creation_time=>Time.now-1.month, :user_id=>user.id, :post_id=>Post.find(:first).id},
			{:content=>'Thats all folks', :creation_time=>Time.now-1.month, :user_id=>admin.id, :post_id=>Post.find(:first).id}])
