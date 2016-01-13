# @cjsx React.DOM

@PollMetaList = React.createClass
  displayName: 'PollMetaList'

  propTypes:
    poll: React.PropTypes.object.isRequired

  getInitialState: ->
    poll: @props.poll
    colors: Utils?.getColors()

  componentWillReceiveProps: (nextProps) ->
    @setState poll: nextProps.poll

  componentWillUnmount: ->
    $(window).off 'resize'

  renderPollCreation: ->
    <span className='meta-value'>
      { moment(@state.poll.created_at, 'YYYY-MM-DDTHH:mm:ss.Z').fromNow() }
    </span>

  renderLastVote: ->
    <span className='meta-value'>
      { moment(@state.poll.updated_at, 'YYYY-MM-DDTHH:mm:ss.Z').fromNow() }
    </span>

  renderTotalVotes: ->
    <span className='meta-value'>
      { Utils.formatVotesCount(@state.poll.votes_count) } { pluralize('vote', @state.poll.votes_count) }
    </span>

  render: ->
    <ul className='poll-meta-list'>
      <li>This poll was created { @renderPollCreation() }</li>
      {
        if @state.poll.votes_count > 0
          <li>The last vote was { @renderLastVote() }</li>
      }
      <li>There has been a total of { @renderTotalVotes() }</li>
    </ul>
