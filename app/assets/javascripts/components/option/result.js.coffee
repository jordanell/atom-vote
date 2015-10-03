# @cjsx React.DOM

@OptionResult = React.createClass
  displayName: 'OptionResult'

  propTypes:
    poll:   React.PropTypes.object.isRequired
    option: React.PropTypes.object.isRequired
    index:  React.PropTypes.number.isRequired

  getWidth: ->
    "#{@props.option.percentage_of_votes}%"

  getInitialState: ->
    colors: Utils?.generateColorPalette()

  getColor: ->
    # Try to get a color, else default back to our theme blue
    @state.colors[@props.index] || '#61DAFB'

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
      <h6 className="option-label">{ @props.option.text }</h6>
      <div className="option-stats">
        { @renderBar() }
        <div className="stat-container">
          <p id="option_#{@props.option.id}_count" className="option-count">
            <span>{ @props.option.votes_count }</span>
            <span className="votes-word">{ pluralize('vote', @props.option.votes_count) }</span>
          </p>
          <p id="option_#{@props.option.id}_percentage" className="option-percentage">
            <span className="votes-precentage">{ @props.option.percentage_of_votes }%</span>
          </p>
        </div>
      </div>
    </section>
