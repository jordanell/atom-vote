# @cjsx React.DOM

@OptionResult = React.createClass
  displayName: 'OptionResult'

  propTypes:
    poll:   React.PropTypes.object.isRequired
    option: React.PropTypes.object.isRequired
    index:  React.PropTypes.number.isRequired

  getWidth: ->
    "#{@props.option.percentage_of_votes}%"

  getColor: ->
    # These are the default Google Charts colors
    colors = ['#3366cc','#dc3912','#ff9900',
              '#109618','#990099','#0099c6',
              '#dd4477','#66aa00']

    colors[@props.index]

  renderBar: ->
    barStyle =
      width:            @getWidth()
      backgroundColor:  @getColor()

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
