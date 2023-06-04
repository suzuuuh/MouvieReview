class Movie < ApplicationRecord

    def self.looks(search, word)
        if search == "partial_match"
          @movie = Movie.where("title LIKE?","%#{word}%")
        else
          該当作品なし
        end
    end
end