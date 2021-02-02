class Post < ApplicationRecord
    VALID_TEXT_REGEX = /\w+/
    validates :title, format: {with: VALID_TEXT_REGEX},
                length: {in: 10..70}
    validates :body, format: {with: VALID_TEXT_REGEX}
    validate :minimum_word_count
    validates :author, format: {with: VALID_TEXT_REGEX},
              length: {in: 4..30}

    def capitalize_title
        title.split(" ").map do |word|
           word.capitalize 
        end.join(" ")
    end
    private

    def minimum_word_count
        errors.add(:body, "words cannot be below 10") if body.split.size < 10
    end
end
