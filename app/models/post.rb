class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    #custom validation
    validate :check_for_clickbaitability

    
    def check_for_clickbaitability
        regex = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i]
        if regex.none? { |word| word.match title }
            errors.add(:title, "Title not clickbaity enough!")
        end
    end

end
