# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User1 = User.create( username: 'Admin' , name: 'Admin' , last_name: 'Admin' , phone: '123456789' , address: 'St 123' , role: true , email: 'Admin@mail.com' , password: '1234')
User2 = User.create( username: 'User1' , name: 'User1' , last_name: '1' , phone: '123456789' , address: 'St 123' , email: 'User1@mail.com' , password: '1234')
User3 = User.create( username: 'User2' , name: 'User2' , last_name: '2' , phone: '123456789' , address: 'St 123' , email: 'User2@mail.com' , password: '1234')
User4 = User.create( username: 'User3' , name: 'User3' , last_name: '3' , phone: '123456789' , address: 'St 123' , email: 'User3@mail.com' , password: '1234')

Category1= Category.create(username: 'Gaming')
Category2= Category.create(username: 'Animals')


Project1 = Project.create(user_id: User1.id , title: 'Cool Project', description: 'A project which is cool.', goal_amount: 10000, finish_date: DateTime.now, delivery_date: DateTime.now)
Project2 = Project.create(user_id: User2.id , title: 'Good Game', description: 'A game which is good.', goal_amount: 100000, finish_date: DateTime.now, delivery_date: DateTime.now, category: Category1)
Project3 = Project.create(user_id: User3.id , title: 'Regular project', description: 'A project which is regular.', goal_amount: 1000, finish_date: DateTime.now, delivery_date: DateTime.now)
Project4 = Project.create(user_id: User4.id , title: 'Bad Project', description: 'A project which is bad.', goal_amount: 100, finish_date: DateTime.now, delivery_date: DateTime.now)
Project5 = Project.create(user_id: User1.id , title: 'Something for animals', description: 'Something which is for animals.', goal_amount: 1000, finish_date: DateTime.now, delivery_date: DateTime.now, category: Category2)


Wishlist1=UserWishlist.create(user_id: User1.id, project_id: Project2.id)
Wishlist2=UserWishlist.create(user_id: User1.id, project_id: Project3.id)
Wishlist3=UserWishlist.create(user_id: User1.id, project_id: Project4.id)
Wishlist4=UserWishlist.create(user_id: User2.id, project_id: Project1.id)
Wishlist5=UserWishlist.create(user_id: User2.id, project_id: Project5.id)
Wishlist6=UserWishlist.create(user_id: User3.id, project_id: Project1.id)
Wishlist7=UserWishlist.create(user_id: User3.id, project_id: Project5.id)
Wishlist8=UserWishlist.create(user_id: User4.id, project_id: Project1.id)
Wishlist9=UserWishlist.create(user_id: User4.id, project_id: Project5.id)

Project1Media1=ProjectMedium.create(project_id: Project1.id, link: "link",link_type: 1)
Project1Media2=ProjectMedium.create(project_id: Project1.id, link: "link",link_type: 2)
Project2Media1=ProjectMedium.create(project_id: Project2.id, link: "link",link_type: 1)
Project2Media2=ProjectMedium.create(project_id: Project2.id, link: "link",link_type: 2)
Project3Media1=ProjectMedium.create(project_id: Project3.id, link: "link",link_type: 1)
Project3Media2=ProjectMedium.create(project_id: Project3.id, link: "link",link_type: 2)
Project4Media1=ProjectMedium.create(project_id: Project4.id, link: "link",link_type: 1)
Project4Media2=ProjectMedium.create(project_id: Project5.id, link: "link",link_type: 2)


Project1Promise1=ProjectPromise.create(project_id: Project1.id, description: "cool shirt", cost: 1000)
Project1Promise2=ProjectPromise.create(project_id: Project1.id, description: "cool hat", cost: 500)
Project2Promise1=ProjectPromise.create(project_id: Project2.id, description: "Game", cost: 1000)
Project2Promise2=ProjectPromise.create(project_id: Project2.id, description: "download", cost: 500)
Project3Promise1=ProjectPromise.create(project_id: Project3.id, description: "regular shirt", cost: 100)
Project5Promise1=ProjectPromise.create(project_id: Project5.id, description: "ugly shirt", cost: 10)
Project5Promise2=ProjectPromise.create(project_id: Project5.id, description: "ugly hat", cost: 5)

Project1Funding1=ProjectFunding.create(project_id: Project1.id, user_id: User2.id, project_promise_id: Project1Promise1.id, amount: 1000)
Project1Funding2=ProjectFunding.create(project_id: Project1.id, user_id: User2.id, amount: 700)
Project1Funding3=ProjectFunding.create(project_id: Project1.id, user_id: User3.id, project_promise_id: Project1Promise2.id, amount: 1000)
Project1Funding4=ProjectFunding.create(project_id: Project1.id, user_id: User4.id, amount: 250)
Project2Funding1=ProjectFunding.create(project_id: Project2.id, user_id: User3.id, project_promise_id: Project2Promise1.id, amount: 1000)
Project2Funding2=ProjectFunding.create(project_id: Project2.id, user_id: User1.id, amount: 700)
Project2Funding3=ProjectFunding.create(project_id: Project2.id, user_id: User4.id, project_promise_id: Project2Promise2.id, amount: 1000)
Project2Funding4=ProjectFunding.create(project_id: Project2.id, user_id: User3.id, amount: 250)

