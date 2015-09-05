# @cjsx React.DOM

@OptionResult = React.createClass
  displayName: 'OptionResult'

  propTypes:
    poll:   React.PropTypes.string.isRequired
    option: React.PropTypes.func.isRequired
    accent: React.PropTypes.string

  getDefaultProps: ->
    accent: 'black'

  getColor: ->
    switch @props.accent.toLowerCase()
      when 'black' then '#000'
      else '#333'

  renderBar: ->
    <span />

  render: ->
    <section className="option-result">
      <span className="option-text">{ @props.option.text }</span>
      <div className="option-stats">
        { @renderBar() }
        <span id="option_#{@props.option.id}_count" className="option-count">{ @props.option.votes_count } votes</span>
        <span id="option_#{@props.option.id}_percentage" className="option-percentage">({ @props.option.percentage_of_votes }%)</span>
      </div>
    </section>
