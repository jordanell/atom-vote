module Features
  module VoteHelpers
    def select_option(choice = 1)
      find(:xpath, "//label[@for='vote_option_id_#{choice}']").click
    end
  end
end