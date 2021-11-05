# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Like.destroy_all
Comment.destroy_all
Post.destroy_all
User.destroy_all
City.destroy_all

10.times do
    City.create(name: Faker::Address.city)
end

10.times do
    user = User.new(first_name: Faker::Name.unique.first_name, city: City.all.sample(1)[0])
    user.email = "#{user.first_name.gsub(" ",".").downcase}@domaine.fr"
    user.password = "testtest"
    user.save
  end

  20.times do
    Post.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph(sentence_count: 2), user: User.all.sample(1).first)
  end 

  20.times do
    comment = Comment.new(content: Faker::Lorem.paragraph(sentence_count: 2), user: User.all.sample(1).first)
    comment.commentable = Post.all.sample(1).first
    comment.save
  end

  20.times do
    comment = Comment.new(content: Faker::Lorem.paragraph(sentence_count: 1), user: User.all.sample(1).first)
    comment.commentable = Comment.all.sample(1).first
    comment.save
  end

  20.times do
    Like.create(user: User.all.sample(1).first, likeable: Post.all.sample(1).first)
  end

  20.times do
    Like.create(user: User.all.sample(1).first, likeable: Comment.all.sample(1).first)
  end