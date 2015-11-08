FactoryGirl.define do
  factory :board do
    title     "Test board"
  end
  factory :sticky do
    board
    group     "Keep"
    comment   "Test comment"
    author    "Test author"
  end
end