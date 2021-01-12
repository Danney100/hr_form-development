puts "BOOKS"

count = 10

count.times do |i|
  book = FactoryBot.create(:book, {
    title: Faker::Book.title,
    author: Faker::Book.author
  })

  if book.save
    print "."
  else
    puts "Error: Failed to seed"
  end
end
