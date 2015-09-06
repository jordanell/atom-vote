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
      <OptionResult key={ option.id } poll={ @state.poll } option={ option } index={ index } />

  render: ->
    <div>
      <section className="poll-result">
        <h2>{ @state.poll.question }</h2>
        { @renderOptions() }
      </section>
      <PollMeta poll={ @state.poll } />
    </div>
