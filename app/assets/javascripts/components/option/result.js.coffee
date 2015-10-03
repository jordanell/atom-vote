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
    # Try to get the proper color, else default back to our theme blue
    Utils?.colors[@props.index] || '#61DAFB'

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
      <label className="option-label">{ @props.option.text }</label>
      <div className="option-stats">
        { @renderBar() }
        <div className="stat-container">
          <p id="option_#{@props.option.id}_count" className="option-count">
            <span>{ @props.option.votes_count }</span><span>{ pluralize('vote', @props.option.votes_count) }</span>
          </p>
          <p id="option_#{@props.option.id}_percentage" className="option-percentage">
            <span>({ @props.option.percentage_of_votes }%)</span>
          </p>
        </div>
      </div>
    </section>
