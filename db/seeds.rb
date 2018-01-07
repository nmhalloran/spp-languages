languages = [
    [
    "English",
    ["hello", "goodbye"]
    ],
    [
    "German",
    ["hallo", "aufwiedersehen"]
    ],
    [
    "French",
    ["baguette", "croissant"]
    ],
    [
    "Slovak",
    ["dobry", "den", "krasny"]
    ]]

languages.each do |language, words|
  p = Language.new
  p.language_name = language
  words.each do |vocab|
    new_word = Word.new(word: vocab)
    p.words << new_word
  end
  p.save
end

p = Speaker.create(username: "Nick", email: "nick@nick", password: "tigger81")
