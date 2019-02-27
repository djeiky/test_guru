%w[Ruby Rails C++ C CSS].each do |title|
  Category.find_or_create_by(title: title)
end

%w[Ivan Aleksandr Uriy].each do |name|
  User.find_or_create_by(username: name)
end

num = 0
Category.all.each do |c|
  num +=1
  c.tests.find_or_create_by(title: "Test - #{num}", level: num)
end

Test.all.each do |test|
  test.questions = []
  3.times do |i|
    test.questions.find_or_create_by(body: "Question - #{i}")
  end
end

Question.all.each do |question|
  question.answers = []
  3.times do |i|
    question.answers.find_or_create_by(body: "Answer body - #{i}", correct: false)
  end
end

User.all.each do |user|
  3.times do |i|
    user.user_tests.find_or_create_by(user_id: user.id, test_id: i)
  end
end
