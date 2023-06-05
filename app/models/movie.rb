class Movie < ApplicationRecord

    def self.looks(search, word)
        where("name LIKE?","%#{word}%")
        #if @movie.empty?
          #"該当作品なし"
        #end
    end
end