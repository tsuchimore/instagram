100.times do |n|
  user = User.new(
    name: Faker::Name.name,
    email:    Faker::Internet.email,
    password: 'password',
    uid: SecureRandom.uuid,
    provider: ''
  )

 user.blogs.build(content: 'ああああ')
  user.save
end

user = User.last

Blog.all.each do |blog|
  blog.comments.create(user_id: user.id, content: 'ああああ')
end