# @cjsx React.DOM

@PollResult = React.createClass
  displayName: 'PollResult'

  propTypes:
    poll: React.PropTypes.object.isRequired

  renderOptions: ->
    for option, index in @props.poll.options
      <OptionResult key={ option.id } poll={ @props.poll } option={ option } index={ index } />

  render: ->
    <section className="poll-result">
      { @renderOptions() }
    </section>
