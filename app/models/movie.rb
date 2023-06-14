class Movie < ApplicationRecord
    has_many :posts
    belongs_to :genre

    def self.looks(search, word)
        where("name LIKE?","%#{word}%")
        #if @movie.empty?
          #"該当作品なし"
        #end
    end
end