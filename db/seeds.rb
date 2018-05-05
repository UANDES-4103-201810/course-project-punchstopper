# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User1 = User.create( username: 'Admin' , name: 'Admin' , last_name: 'Admin' , phone: '123456789' , address: 'St 123' , role: true , email: 'Admin@mail.com' , password: '1234')
User2 = User.create( username: 'Regular' , name: 'Regular' , last_name: 'Regular' , phone: '123456789' , address: 'St 123' , email: 'Regular@mail.com' , password: '1234')


Category1= Category.create(username: 'Outstanding')
Category2= Category.create(username: 'Gaming')


Project1 = Project.create(user_id: User1.id , title: 'Project1', goal_amount: 1000, finish_date: DateTime.now, delivery_date: DateTime.now, category: Category1)
Project2 = Project.create(user_id: User2.id , title: 'Project2', goal_amount: 1000, finish_date: DateTime.now, delivery_date: DateTime.now, category: Category2)
Project3 = Project.create(user_id: User1.id , title: 'Project3', goal_amount: 1000, finish_date: DateTime.now, delivery_date: DateTime.now)
Project4 = Project.create(user_id: User2.id , title: 'Project4', goal_amount: 1000, finish_date: DateTime.now, delivery_date: DateTime.now)


Wishlist1=UserWishlist.create(user_id: User1.id, project_id: Project2.id)
Wishlist2=UserWishlist.create(user_id: User1.id, project_id: Project4.id)
Wishlist3=UserWishlist.create(user_id: User2.id, project_id: Project1.id)
Wishlist4=UserWishlist.create(user_id: User2.id, project_id: Project3.id)

Project1Media1=ProjectMedium.create(project_id: Project1.id, link: "link",link_type: 1)
Project1Media2=ProjectMedium.create(project_id: Project1.id, link: "link",link_type: 2)
Project2Media1=ProjectMedium.create(project_id: Project2.id, link: "link",link_type: 1)
Project2Media2=ProjectMedium.create(project_id: Project2.id, link: "link",link_type: 2)


Project1Promise1=ProjectPromise.create(project_id: Project1.id, description: "shirt", cost: 1000)
Project1Promise2=ProjectPromise.create(project_id: Project1.id, description: "hat", cost: 500)
Project2Promise1=ProjectPromise.create(project_id: Project2.id, description: "shirt", cost: 1000)
Project2Promise2=ProjectPromise.create(project_id: Project2.id, description: "hat", cost: 500)

Project1Funding1=ProjectFunding.create(project_id: Project1.id, user_id: User2.id, project_promise_id: Project1Promise1.id, amount: 1000)
Project1Funding2=ProjectFunding.create(project_id: Project1.id, user_id: User2.id, amount: 1000)
Project2Funding1=ProjectFunding.create(project_id: Project2.id, user_id: User1.id, project_promise_id: Project2Promise2.id, amount: 500)
Project2Funding2=ProjectFunding.create(project_id: Project2.id, user_id: User1.id, amount: 1000)

