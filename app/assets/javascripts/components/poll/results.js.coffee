# @cjsx React.DOM

@PollResults = React.createClass
  displayName: 'PollResults'

  propTypes:
    poll: React.PropTypes.object.isRequired

  # Polling timeout
  poller: null

  getInitialState: ->
    poll: @props.poll

  componentDidMount: ->
    @poller = setInterval(@fetchPoll, 3000)

  componentWillUnmount: ->
    clearInterval(@poller)

  fetchPoll: ->
    Comm.get '/polls', { id: @state.poll.uuid }, @updatePoll

  updatePoll: (data) ->
    if data.poll
      @setState poll: data.poll

  renderOptions: ->
    <ul className='poll-results-list'>
      {
        for option, index in @state.poll.options
          <OptionResult
            key={ option.id }
            poll={ @state.poll }
            option={ option }
            index={ index }
          />
      }
    </ul>


  render: ->
    <div className='poll-result-wrapper'>
      <div className='poll-result-content'>
        <h2 className='poll-result-question'>{ @state.poll.question }</h2>
        <PollMetaList poll={ @state.poll } />
        <div className='grid'>
          <div className='grid-cell'>
            { @renderOptions() }
          </div>
          <div className='grid-cell'>
            <DonutChart poll={ @state.poll } />
          </div>
        </div>
      </div>
    </div>
