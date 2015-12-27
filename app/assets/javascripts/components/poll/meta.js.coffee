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
      <li>Total Votes <span className='meta-value'>{ @state.poll.votes_count }</span></li>
      <li>Last Vote <span className='meta-value'>{ @renderLastVote() }</span></li>
    </ul>
