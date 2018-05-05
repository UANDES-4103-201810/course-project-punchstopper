# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Users
User1 = User.create( username: 'Admin' , name: 'Admin' , last_name: 'Admin' , phone: '123456789' , address: 'St 123' , role: true , email: 'Admin@mail.com' , password: '1234')
User2 = User.create( username: 'Regular' , name: 'Regular' , last_name: 'Regular' , phone: '123456789' , address: 'St 123' , email: 'Regular@mail.com' , password: '1234')

#Categories
Category1= Category.create(username: 'Outstanding')
Category2= Category.create(username: 'Gaming')

#Projects
Project1 = Project.create(user_id: User1.id , title: 'Project1', goal_amount: 1000, finish_date: DateTime.now, delivery_date: DateTime.now, category: Category1)
Project2 = Project.create(user_id: User2.id , title: 'Project2', goal_amount: 1000, finish_date: DateTime.now, delivery_date: DateTime.now, category: Category2)
Project3 = Project.create(user_id: User1.id , title: 'Project3', goal_amount: 1000, finish_date: DateTime.now, delivery_date: DateTime.now)
Project4 = Project.create(user_id: User2.id , title: 'Project4', goal_amount: 1000, finish_date: DateTime.now, delivery_date: DateTime.now)


