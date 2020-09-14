users = User.create([
  { username: "Alex", email: "alex@gmail.com", password: "1q2w3e" },
  { username: "Jose" , email: "jose@gmail.com", password: "1q2w3e" },
  { username: "Richard", email: "richard@gmail.com", password: "1q2w3e" }
])

admin_user_id = users[0].id

categories = Category.create([
  { title: 'football' },
  { title: 'basketball' },
  { title: 'rock_music' }
])

football_id = categories[0].id
basketball_id = categories[1].id
rock_music_id = categories[2].id

football_tests = Test.create([
  { title: "Cristiano Ronaldo", level: 0, category_id: football_id, author_id: admin_user_id },
  { title: "Robert Lewandowski", level: 1, category_id: football_id, author_id: admin_user_id },
  { title: "Chelsea Football Club", level: 2, category_id: football_id, author_id: admin_user_id }
])

basketball_tests = Test.create([
  { title: "Michael Jordan", level: 1, category_id: basketball_id, author_id: admin_user_id },
  { title: "NBA common", level: 0, category_id: basketball_id, author_id: admin_user_id },
  { title: "Chicago Bulls", level: 2, category_id: basketball_id, author_id: admin_user_id }
])

rock_music_tests = Test.create([
  { title: "Beatles", level: 0, category_id: rock_music_id, author_id: admin_user_id },
  { title: "Queen", level: 1, category_id: rock_music_id, author_id: admin_user_id },
  { title: "Ozzy Osbourne", level: 2, category_id: rock_music_id, author_id: admin_user_id }
])

cr7_testID = football_tests[0].id
cb_testID = basketball_tests[2].id
queen_testID = rock_music_tests[1].id

cr7_questions = Question.create([
  { body: "In September 2015, Ronaldo scored his 500th senior career goal for ?", test_id: cr7_testID },
  { body: "What is his current salary at Juventus (millions)?", test_id: cr7_testID },
  { body: "How old is he?", test_id: cr7_testID }
])

cb_questions = Question.create([
  { body: "How many all-stars did the Bulls have for the 1991-92 season?", test_id: cb_testID },
  { body: "Who did the Bulls beat for their first win of the season?", test_id: cb_testID },
  { body: "What number did Jalen Rose wear?", test_id: cb_testID }
])

queen_questions = Question.create([
  { body: "Queen recorded music for which 1980 film and its accompanying soundtrack?", test_id: queen_testID },
  { body: "What decade is the hit single 'Another One Bites The Dust' by Queen from?", test_id: queen_testID },
  { body: "The group Queen released what album in 1995?", test_id: queen_testID }
])

cr7_answers = Answer.create([
  { body: "Club and country", correct: true, question_id: cr7_questions[0].id },
  { body: "Pele", question_id: cr7_questions[0].id },
  { body: "Real Madrid", question_id: cr7_questions[0].id },
  { body: "European Championship", question_id: cr7_questions[0].id },
  { body: "12", question_id: cr7_questions[1].id },
  { body: "79", question_id: cr7_questions[1].id },
  { body: "55", question_id: cr7_questions[1].id },
  { body: "35", correct: true, question_id: cr7_questions[1].id },
  { body: "33", question_id: cr7_questions[2].id },
  { body: "32", question_id: cr7_questions[2].id },
  { body: "35", correct: true, question_id: cr7_questions[2].id },
  { body: "37", question_id: cr7_questions[2].id }
])

cb_answers = Answer.create([
  { body: "1", question_id: cb_questions[0].id },
  { body: "2", correct: true, question_id: cb_questions[0].id },
  { body: "3", question_id: cb_questions[0].id },
  { body: "4", question_id: cb_questions[0].id },
  { body: "Boston Celtics", correct: true, question_id: cb_questions[1].id },
  { body: "Orlando Magic", question_id: cb_questions[1].id },
  { body: "Philadelphia 76ers", question_id: cb_questions[1].id },
  { body: "Atlanta Hawks", question_id: cb_questions[1].id },
  { body: "3", question_id: cb_questions[2].id },
  { body: "5", correct: true, question_id: cb_questions[2].id },
  { body: "2", question_id: cb_questions[2].id },
  { body: "23", question_id: cb_questions[2].id }
])

queen_answers = Answer.create([
  { body: "Somewhere In Time", question_id: queen_questions[0].id },
  { body: "Flash Gordon", correct: true, question_id: queen_questions[0].id },
  { body: "Excalibur", question_id: queen_questions[0].id },
  { body: "Clash Of The Titans", question_id: queen_questions[0].id },
  { body: "2000's", question_id: queen_questions[1].id },
  { body: "Nineties", question_id: queen_questions[1].id },
  { body: "Eighties", correct: true, question_id: queen_questions[1].id },
  { body: "Seventies", question_id: queen_questions[1].id },
  { body: "To Sir With Love", question_id: queen_questions[2].id },
  { body: "Made In Russia", question_id: queen_questions[2].id },
  { body: "Made In Heaven", correct: true, question_id: queen_questions[2].id },
  { body: "The Italian Suppository", question_id: queen_questions[2].id }
])
