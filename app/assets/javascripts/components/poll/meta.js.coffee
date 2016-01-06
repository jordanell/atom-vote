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

  renderLastVote: ->
    moment(@state.poll.updated_at, 'YYYY-MM-DDTHH:mm:ss.Z').fromNow()

  render: ->
    <ul className='poll-meta-list'>
      <li>
        <div className='meta-value'>{ @state.poll.votes_count }</div>
        <div className='meta-label'>Total Votes</div>
      </li>
      <li>
        <div className='meta-value'>{ @renderLastVote() }</div>
        <div className='meta-label'>Last Vote</div>
      </li>
    </ul>
