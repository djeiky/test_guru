%w[Ruby Rails C++ C CSS].each do |title|
  Category.find_or_create_by(title: title)
end

@admin = Admin.where(email: "djeiky@gmail.com").first
unless @admin
  @admin = Admin.new
  @admin.email = "djeiky@gmail.com"
  @admin.first_name = "E"
  @admin.last_name = "A"
  @admin.password = "test123"
  @admin.password_confirmation = "test123"
  @admin.save
end
puts "admin ---------- #{@admin.id}"

@test = Test.find_or_create_by(title: "Rails intro") do |t|
  t.level = 1
  t.category_id = Category.find_by(title: "Rails").id
  t.author_id = @admin.id
end
@question = Question.find_or_create_by(body: "What is Rails?") do |q|
  q.test_id = @test.id
end
Answer.find_or_create_by(body: "Framework") do |a|
  a.correct = true
  a.question_id = @question.id
end
Answer.create(body: "Programm language") do |a|
  a.correct = false
  a.question_id = @question.id
end

BadgeType.find_or_create_by(name: "category")
BadgeType.find_or_create_by(name: "attempt")
BadgeType.find_or_create_by(name: "level")
