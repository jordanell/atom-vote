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
    for option, index in @state.poll.options
      <OptionResult
        key={ option.id }
        poll={ @state.poll }
        option={ option }
        index={ index }
      />

  render: ->
    <div className='poll-results-content'>
      <div className='poll-result-data'>
        <h2 className='poll-result-question'>{ @state.poll.question }</h2>
        <div className='poll-result-viz'>
          <ul className='poll-result-list'>
            { @renderOptions() }
          </ul>
          <PollMeta poll={ @state.poll } />
        </div>
      </div>
    </div>
