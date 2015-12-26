# @cjsx React.DOM

@PollMeta = React.createClass
  displayName: 'PollMeta'

  propTypes:
    poll: React.PropTypes.object.isRequired

  getInitialState: ->
    poll: @props.poll
    colors: Utils?.getColors()

  componentDidMount: ->
    google.setOnLoadCallback(@drawDonutGraph)

    $(window).on 'resize', @drawDonutGraph

  componentWillReceiveProps: (nextProps) ->
    @setState poll: nextProps.poll

  componentDidUpdate: (prevProps, prevState) ->
    @drawDonutGraph()

  componentWillUnmount: ->
    $(window).off 'resize'

  drawDonutGraph: ->
    data = [['Option', 'Votes']]

    for option in @state.poll.options
      data.push [option.text, option.votes_count]

    data = google.visualization.arrayToDataTable(data)

    options =
      title: 'My Daily Activities'
      pieHole: 0.2
      legend: 'none'
      backgroundColor: 'transparent'
      colors: @state.colors
      chartArea:
        top: 0
        height: 600

    chart = new google.visualization.PieChart(document.getElementById('poll-donut-chart'));
    chart.draw(data, options);

  renderLastVote: ->
    moment(@state.poll.updated_at, "YYYY-MM-DDTHH:mm:ss.Z").fromNow()

  render: ->
    <section className="poll-meta">
      <div id="poll-donut-chart" />
      <div className="poll-stat">
        <span id="data-total" className="data-value">{ @state.poll.votes_count }</span>
        <p className="data-label">Total Votes</p>
      </div>
      <div className="poll-stat">
        <span id="data-last" className="data-value">{ @renderLastVote() }</span>
        <p className="data-label">Last Vote</p>
      </div>
    </section>
