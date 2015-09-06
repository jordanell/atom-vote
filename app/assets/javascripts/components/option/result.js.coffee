# @cjsx React.DOM

@OptionResult = React.createClass
  displayName: 'OptionResult'

  propTypes:
    poll:   React.PropTypes.object.isRequired
    option: React.PropTypes.object.isRequired
    accent: React.PropTypes.string

  getDefaultProps: ->
    accent: 'black'

  getColor: ->
    switch @props.accent.toLowerCase()
      when 'black' then '#000'
      else '#333'

  getWidth: ->
    "#{@props.option.percentage_of_votes}%"

  renderBar: ->
    barStyle =
      width: @getWidth()

    <div className="bar-container">
      <div className="bar-progress">
        <div className="bar-fill" style={ barStyle }/>
      </div>
    </div>

  render: ->
    <section className="option-result">
      <span className="option-text">{ @props.option.text }</span>
      <div className="option-stats">
        { @renderBar() }
        <div className="stat-container">
          <span id="option_#{@props.option.id}_count" className="option-count">{ @props.option.votes_count } { pluralize('vote', @props.option.votes_count) }</span>
          <span id="option_#{@props.option.id}_percentage" className="option-percentage">({ @props.option.percentage_of_votes }%)</span>
        </div>
      </div>
    </section>
