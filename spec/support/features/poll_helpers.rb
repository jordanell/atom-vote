module Features
  module PollHelpers
    def fill_in_question(question = 'My test question')
      fill_in 'poll[question]', with: question
    end

    def fill_in_option(option_number, text = 'My test option')
      fill_in "poll[options_attributes][#{option_number}][text]", with: text
    end
  end
end
