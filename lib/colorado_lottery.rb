class ColoradoLottery

  attr_reader :registered_contestants,
              :winners,
              :current_contestants

  def initialize
    @registered_contestants = {}
    @winners = []
    @current_contestants= {}
  end

  def interested_and_18?(contestant, game)
    interested = contestant.game_interests.any? { |interested| interested == game.name }
    interested && contestant.age >= 18
  end

  def can_register?(contestant, game)
    in_state_or_national = (!contestant.out_of_state? || game.national_drawing)
    interested_and_18?(contestant, game) && in_state_or_national
  end

  def register_contestant(contestant, game)
    if can_register?(contestant, game)
      @registered_contestants[game.name] = [] if !@registered_contestants[game.name]
      @registered_contestants[game.name] << contestant
    end
  end
end
