module Features
  module VoteHelpers
    def select_option(choice = 1)
      choose("vote_option_id_#{choice}")
    end
  end
end