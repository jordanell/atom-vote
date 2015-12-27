# @cjsx React.DOM

@PollMeta = React.createClass
  displayName: 'PollMeta'

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
    moment(@state.poll.updated_at, "YYYY-MM-DDTHH:mm:ss.Z").fromNow()

  render: ->
    <section className="poll-meta">
      <div className="poll-stat">
        <span id="data-total" className="data-value">{ @state.poll.votes_count }</span>
        <p className="data-label">Total Votes</p>
      </div>
      <div className="poll-stat">
        <span id="data-last" className="data-value">{ @renderLastVote() }</span>
        <p className="data-label">Last Vote</p>
      </div>
    </section>
