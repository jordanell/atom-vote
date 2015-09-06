# @cjsx React.DOM

@PollResult = React.createClass
  displayName: 'PollResult'

  propTypes:
    poll: React.PropTypes.object.isRequired

  renderOptions: ->
    for option in @props.poll.options
      <OptionResult key={ option.id } poll={ @props.poll } option={ option } />

  render: ->
    <section className="poll-result">
      { @renderOptions() }
    </section>
