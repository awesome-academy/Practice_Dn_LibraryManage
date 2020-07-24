# User

User.create!(name: 'admin',
             email: 'admin@gmail.com',
             password: '123456',
             password_confirmation: '123456',
             role: 1)
20.times do |n|
  name = Faker::Name.name
  email = "user-#{n + 1}@gmail.com"
  password = '123456'
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               role: 2)
end
i = 1
# Author
10.times do |n|
  name = Faker::Name.name
  email = "author-#{n + 1}@gmail.com"
  info = Faker::Lorem.paragraph(6)
  # password = "password"
  image = File.open("#{Rails.root}/app/assets/images/authors/#{i}.jpg")
  i += 1
  Author.create!(name: name,
                 email: email,
                 info: info,
                 author_img: image)
end
a = 0
# Books
j = 1
authors = Author.all
authors.each do |author|
  3.times do |_n|
    name = Faker::Book.title
    publisher = Faker::Book.publisher
    quantity = 100
    page = rand(10..1000)
    content = Faker::Lorem.paragraphs(2)
    c = ''
    content.map { |i| c += ' ' + i }
    image = File.open("#{Rails.root}/app/assets/images/books/#{j}.jpg")
    j += 1
    author.books.create!(name: name, quantity: quantity, publisher: publisher, page: page, book_img: image, content: c)
  end
end

# Category
categories = %w[Textbook Novel Manga History Scientist Politic Cultural Computer Technical Geography]
categories.each do |category|
  Category.create!(name: category)
end

# Bookcategory

books = Book.all
books.each do |book|
  book.categories << Category.all[rand(10)]
end
