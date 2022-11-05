class BoardGameGeek
  class Game
    attr_reader :id, :name, :picture, :rating

    def initialize(id:, name:, picture:, rating:)
      @id = id
      @name = name
      @picture = picture
      @rating = rating
    end
  end
end
