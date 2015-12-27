# @cjsx React.DOM

@DonutChart = React.createClass
  displayName: 'DonutChart'

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

  render: ->
    <div id="poll-donut-chart" />
