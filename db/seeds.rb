# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 

marek = User.create({
  username: 'Marek',
  password: 'testtest',
  email: "marek@email.pl",
},)
jarek = User.create({
  username: 'Jarek',
  password: 'testtest',
  email: "jare@email.pl",
},)
marta = User.create({
  username: 'Marta',
  password: 'testtest',
  email: "marta@email.pl",
},)

zakupy = Board.create({
  name: 'Zakupy',
  descripton: "To jest tablica z zakupami"
},)
przyroda = Board.create({
  name: 'Przyroda',
  descripton: "To jest tablica dla przedmiotu przyroda"
},) 
taski = Board.create({
  name: 'Taski',
  descripton: "To jest tablica zawierajaca taski projektowe"
},)

marek.boards << taski
marek.boards << przyroda 
marta.boards << zakupy


