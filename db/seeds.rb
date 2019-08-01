User.destroy_all
puts "creating users"
u1 = User.create :name => 'Bruce Wayne', :email => 'bruce@batman.com', :admin => true, :password => '123'
u2 = User.create :name => 'Flash', :email => 'robin@hood.com', :admin => false, :password => '123'
u3 = User.create :name => 'Aqua Man', :email => 'aqua@man.com', :admin => false, :password => '123'
u4 = User.create :name => 'Mighty Thor', :email => 'may2@may.com', :admin => true, :password => '123'
u5 = User.create :name => 'Hulk', :email => 'may3@may.com', :admin => false, :password => '123'
u6 = User.create :name => 'Spider Man', :email => 'may4@may.com', :admin => false, :password => '123'
u7 = User.create :name => 'Black Widow', :email => 'may5@may.com', :admin => false, :password => '123'
u8 = User.create :name => 'Banana Lover', :email => 'min@may.com', :admin => true, :password => '123'
u9 = User.create :name => 'Yellow Thing', :email => 'minion@may.com', :admin => false, :password => '123'


Team.destroy_all 
puts "creating teams"
t1 = Team.create :name => 'DC'
t2 = Team.create :name => 'Marvel'
t3 = Team.create :name => 'Mionions'

Comment.destroy_all
puts "creating comments"
c1 = Comment.create :content => "I am awesome", :category => 'environment', :emotion => 'happy', :score => 3
c2 = Comment.create :content => "I am inspired", :category => 'environment', :emotion => 'happy', :score => 1
c3 = Comment.create :content => "I am calm and beautiful", :category => 'relationship', :emotion => 'happy', :score => 2
c4 = Comment.create :content => "meh meh meh", :category => 'others', :emotion => 'meh', :score => 4
c5 = Comment.create :content => "I dont care", :category => 'environment', :emotion => 'sad', :score => 5
c6 = Comment.create :content => "I dont know", :category => 'environment', :emotion => 'meh', :score => 4
c7 = Comment.create :content => "fuck this", :category => 'environment', :emotion => 'sad', :score => 5
c8 = Comment.create :content => "I need help", :category => 'environment', :emotion => 'sad', :score => 8
c9 = Comment.create :content => "Oh my god, kill me plz", :category => 'environment', :emotion => 'sad', :score => 9


Task.destroy_all
puts "creating tasks"
a1 = Task.create :name => 'project 1', :start_date => '2019-5-6', :difficulty => 'hard'
a2 = Task.create :name => 'project 2',:start_date => '2019-5-6', :difficulty => 'easy'
a3 = Task.create :name => 'project 3', :start_date => '2019-5-6', :difficulty => 'hard'
a4 = Task.create :name => 'project 4', :start_date => '2019-5-6', :difficulty => 'medium'

puts "associations"
# team and users
t1.users << u1 << u2 << u3
t2.users << u4 << u5 << u6 << u7
t3.users << u8 << u9


# users and comments
u1.comments << c1
u2.comments << c2
u3.comments << c3
u4.comments << c4
u5.comments << c5
u6.comments << c6
u7.comments << c7
u8.comments << c8
u9.comments << c9


# users and tasks
u1.tasks << a1 << a2
u2.tasks << a3 << a4
