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
    Comm.get "/api/v1/polls/#{@state.poll.uuid}", {}, @updatePoll

  updatePoll: (data) ->
    if data
      @setState poll: data

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
        <h2 className='poll-result-question'>
          { @state.poll.question }
        </h2>
      </div>
      <div className='poll-result-content'>
        <div className='grid'>
          <div className='grid-cell'>
            { @renderOptions() }
          </div>
        </div>
        <hr/>
        <PollMetaList poll={ @state.poll } />
      </div>
    </div>
