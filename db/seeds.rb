User.destroy_all
puts "creating users"
u1 = User.create :name => 'Bruce Wayne', :email => 'bruce@batman.com', :admin => true, :password => '123'
u2 = User.create :name => 'Robin Hood', :email => 'robin@hood.com', :admin => false, :password => '123'
u3 = User.create :name => 'May May', :email => 'may@may.com', :admin => false, :password => '123'

Team.destroy_all 
puts "creating teams"
t1 = Team.create :name => 'DC'
t2 = Team.create :name => 'Marvel'

Comment.destroy_all
puts "creating comments"
c1 = Comment.create :content => "I hate this place", :category => 'environment', :post_date => '2019-6-8', :emotion => 'sad' 
c2 = Comment.create :content => "I love this place", :category => 'environment', :post_date => '2019-6-8', :emotion => 'happy' 
c3 = Comment.create :content => "I hate people", :category => 'relationship', :post_date => '2019-6-5', :emotion => 'angry' 
c4 = Comment.create :content => "I am good", :category => 'others', :post_date => '2019-6-8', :emotion => 'happy' 
c5 = Comment.create :content => "I dont care", :category => 'environment', :post_date => '2019-6-8', :emotion => 'sad' 

Task.destroy_all
puts "creating tasks"
a1 = Task.create :name => 'project 1', :start_date => '2019-5-6', :difficulty => 'hard'
a2 = Task.create :name => 'project 2',:start_date => '2019-5-6', :difficulty => 'easy'
a3 = Task.create :name => 'project 3', :start_date => '2019-5-6', :difficulty => 'hard'
a4 = Task.create :name => 'project 4', :start_date => '2019-5-6', :difficulty => 'medium'

puts "associations"
# team and users
t1.users << u1
t1.users << u2
t2.users << u3

# users and comments
u1.comments << c1 << c2 << c3
u2.comments << c4 << c5

# users and tasks
u1.tasks << a1 << a2
u2.tasks << a3 << a4
