# @cjsx React.DOM

@PollResult = React.createClass
  displayName: 'PollResult'

  propTypes:
    poll: React.PropTypes.string.isRequired

  renderOption: (option) ->
    <OptionResult poll={ @props.poll } option={ option } />

  renderOptions: ->
    for option in @props.poll.options
      @renderOption(option)

  render: ->
    <section className="poll-result">
      { @renderOptions() }
    </section>
