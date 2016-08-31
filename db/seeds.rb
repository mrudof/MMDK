unless User.find_by(username: "kiren")
  kiren = User.create(username: "kiren", email: "kiren@gmail.com", password: "password")
end

unless User.find_by(username: "melissa")
  melissa = User.create(username: "melissa", email: "melissa@gmail.com", password: "password")
end

unless User.find_by(username: "margaret")
  margaret = User.create(username: "margaret", email: "margaret@gmail.com", password: "password")
end

unless User.find_by(username: "daniel")
  daniel = User.create(username: "daniel", email: "daniel@gmail.com", password: "password")
end

Question.find_or_create_by(user_id: 2, title: "Spaghetti Squash", text: "How long should I put a spaghetti squash in the oven?")
Answer.find_or_create_by(question_id: 1, user_id: 4, text: "30 minutes at 435 degrees Fahrenheit yo")
Comment.find_or_create_by(user_id: 3, commentable_id: 1, commentable_type: "Answer", text: "You, DANIEL, are wrong - this will burn the Spaghetti squash")
Vote.find_or_create_by(user_id: 1, votable_id: 1, votable_type: "Answer", upvote?: false)
