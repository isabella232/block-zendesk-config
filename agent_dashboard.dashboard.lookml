- dashboard: agent_dashboard
  title: Agent Dashboard
  layout: newspaper
  elements:
  - title: Weekly Ticket Burndown
    name: Weekly Ticket Burndown
    model: zendesk_analytics
    explore: ticket
    type: looker_column
    fields: [ticket.created_week, ticket.count_solved_tickets, ticket.count_open_tickets,
      ticket.count_pending_tickets, ticket.count_tickets_on_hold]
    fill_fields: [ticket.created_week]
    filters:
      ticket.created_week: 18 weeks
    sorts: [ticket.created_week desc]
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: normal
    trellis: ''
    color_application:
      collection_id: legacy
      palette_id: random
      options:
        steps: 5
        reverse: false
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle_outline
    series_colors: {}
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: left, series: [{id: ticket.count, name: Count
              Tickets, axisId: ticket.count}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    listen:
      Assignee: assignee.name
    row: 23
    col: 8
    width: 16
    height: 8
  - title: Open Tickets
    name: Open Tickets
    model: zendesk_analytics
    explore: ticket
    type: table
    fields: [ticket.created_date, ticket.ticket_link, ticket.priority, ticket.subject,
      requester.name, organization.name, requester.email, ticket.days_open, ticket.updated_date]
    filters:
      ticket.id: ''
      ticket.status: "-closed"
    sorts: [ticket.priority desc, ticket.days_open desc]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      ticket.ticket_link: Ticket Number
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: normal
    trellis: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    series_types: {}
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Assignee: assignee.name
    row: 31
    col: 8
    width: 16
    height: 10
  - title: Avg Days to Solve (Team)
    name: Avg Days to Solve (Team)
    model: zendesk_analytics
    explore: ticket
    type: single_value_sparkline
    fields: [ticket.avg_days_to_solve, ticket.created_month]
    fill_fields: [ticket.created_month]
    filters:
      ticket.created_month: 6 months
    sorts: [ticket.created_month desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    font_size: small
    sparkline_color: ["#5b5d9a"]
    chart_alignment: bottom
    data_granularity: '1'
    width: 4
    height: 6
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors: [red, blue]
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    groupBars: true
    labelSize: 10pt
    showLegend: true
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    value_labels: legend
    label_type: labPer
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    colors: ['palette: Mixed Dark']
    series_colors: {}
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: bottom,
        showLabels: false, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: ticket.avg_days_to_solve,
            name: Avg Days to Solve, axisId: ticket.avg_days_to_solve}]}]
    listen: {}
    row: 10
    col: 0
  - title: Avg Days to Solve
    name: Avg Days to Solve
    model: zendesk_analytics
    explore: ticket
    type: single_value_sparkline
    fields: [ticket.created_month, ticket.avg_days_to_solve]
    fill_fields: [ticket.created_month]
    filters:
      ticket.created_month: 6 months
      ticket.name_select: ''
    sorts: [ticket.created_month desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    font_size: small
    sparkline_color: ["#5b5d9a"]
    chart_alignment: bottom
    data_granularity: '1'
    width: 4
    height: 6
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors: [red, blue]
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    groupBars: true
    labelSize: 10pt
    showLegend: true
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    value_labels: legend
    label_type: labPer
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    colors: ['palette: Mixed Dark']
    series_colors: {}
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: bottom,
        showLabels: false, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: ticket.avg_days_to_solve,
            name: Avg Days to Solve, axisId: ticket.avg_days_to_solve}]}]
    listen:
      Assignee: assignee.name
    row: 10
    col: 4
  - title: Solved Tickets
    name: Solved Tickets
    model: zendesk_analytics
    explore: ticket
    type: single_value_sparkline
    fields: [ticket.created_month, ticket.count_solved_tickets]
    fill_fields: [ticket.created_month]
    filters:
      ticket.created_month: 6 months
    sorts: [ticket.created_month desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    font_size: small
    sparkline_color: ["#e9b404"]
    chart_alignment: bottom
    data_granularity: '1'
    width: 4
    height: 6
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors: [red, blue]
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    groupBars: true
    labelSize: 10pt
    showLegend: true
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    value_labels: legend
    label_type: labPer
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    colors: ['palette: Mixed Dark']
    series_colors: {}
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: bottom,
        showLabels: false, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: ticket.avg_days_to_solve,
            name: Avg Days to Solve, axisId: ticket.avg_days_to_solve}]}]
    listen:
      Assignee: assignee.name
    row: 4
    col: 0
  - title: Solved Tickets (Team)
    name: Solved Tickets (Team)
    model: zendesk_analytics
    explore: ticket
    type: single_value_sparkline
    fields: [ticket.created_month, ticket.count_solved_tickets]
    fill_fields: [ticket.created_month]
    filters:
      ticket.created_month: 6 months
    sorts: [ticket.created_month desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    font_size: small
    sparkline_color: ["#e9b404"]
    chart_alignment: bottom
    data_granularity: '1'
    width: 4
    height: 6
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors: [red, blue]
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    groupBars: true
    labelSize: 10pt
    showLegend: true
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    value_labels: legend
    label_type: labPer
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    colors: ['palette: Mixed Dark']
    series_colors: {}
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: bottom,
        showLabels: false, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: ticket.avg_days_to_solve,
            name: Avg Days to Solve, axisId: ticket.avg_days_to_solve}]}]
    listen: {}
    row: 4
    col: 4
  - title: Avg 1st Response Hrs
    name: Avg 1st Response Hrs
    model: zendesk_analytics
    explore: ticket
    type: single_value_sparkline
    fields: [ticket.created_month, ticket.avg_hours_to_first_response]
    fill_fields: [ticket.created_month]
    filters:
      ticket.created_month: 6 months
    sorts: [ticket.created_month desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    font_size: small
    sparkline_color: ["#ed6168"]
    chart_alignment: bottom
    data_granularity: '1'
    width: 4
    height: 7
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors: [red, blue]
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    groupBars: true
    labelSize: 10pt
    showLegend: true
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    value_labels: legend
    label_type: labPer
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    colors: ['palette: Mixed Dark']
    series_colors: {}
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: bottom,
        showLabels: false, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: ticket.avg_days_to_solve,
            name: Avg Days to Solve, axisId: ticket.avg_days_to_solve}]}]
    listen:
      Assignee: assignee.name
    row: 16
    col: 0
  - title: Avg 1st Response (Team)
    name: Avg 1st Response (Team)
    model: zendesk_analytics
    explore: ticket
    type: single_value_sparkline
    fields: [ticket.created_month, ticket.avg_hours_to_first_response]
    fill_fields: [ticket.created_month]
    filters:
      ticket.created_month: 6 months
    sorts: [ticket.created_month desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    font_size: small
    sparkline_color: ["#ed6168"]
    chart_alignment: bottom
    data_granularity: '1'
    width: 4
    height: 7
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors: [red, blue]
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    groupBars: true
    labelSize: 10pt
    showLegend: true
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    value_labels: legend
    label_type: labPer
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    colors: ['palette: Mixed Dark']
    series_colors: {}
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: bottom,
        showLabels: false, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: ticket.avg_days_to_solve,
            name: Avg Days to Solve, axisId: ticket.avg_days_to_solve}]}]
    listen: {}
    row: 16
    col: 4
  - title: Hours to 1st Response
    name: Hours to 1st Response
    model: zendesk_analytics
    explore: ticket
    type: looker_bar
    fields: [assignee.name, assignee.output_name_select, ticket.avg_hours_to_first_response]
    filters:
      assignee.name_select: Tom Davies
      assignee.name: "-NULL"
    sorts: [ticket.avg_hours_to_first_response desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: me, label: Me, expression: 'if(${assignee.output_name_select}
          = ${assignee.name}, ${ticket.avg_hours_to_first_response}, null)', value_format: !!null '',
        value_format_name: decimal_0, _kind_hint: measure, _type_hint: number}, {
        table_calculation: everyone_else, label: Everyone Else, expression: 'if(${assignee.output_name_select}
          != ${assignee.name}, ${ticket.avg_hours_to_first_response}, null)', value_format: !!null '',
        value_format_name: decimal_0, _kind_hint: measure, _type_hint: number}]
    stacking: normal
    trellis: ''
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    show_value_labels: false
    label_density: 25
    legend_position: center
    hide_legend: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      me: "#ed6168"
      everyone_else: "#ffbcbf"
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: bottom, series: [{id: highlight_count, name: Highlight
              Count, axisId: highlight_count}, {id: everyone_else_count, name: Everyone
              Else Count, axisId: everyone_else_count}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#000000"
    hidden_fields: [assignee.output_name_select, ticket_close_dates.average_time_to_resolution,
      ticket.avg_hours_to_first_response]
    listen: {}
    row: 16
    col: 8
    width: 16
    height: 7
  - title: Days to Resolution
    name: Days to Resolution
    model: zendesk_analytics
    explore: ticket
    type: looker_bar
    fields: [assignee.name, assignee.output_name_select, ticket.avg_days_to_solve]
    filters:
      assignee.name_select: Tom Davies
      assignee.name: "-NULL"
    sorts: [ticket.avg_days_to_solve desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: me, label: Me, expression: 'if(${assignee.output_name_select}
          = ${assignee.name}, ${ticket.avg_days_to_solve}, null)', value_format: !!null '',
        value_format_name: decimal_0, _kind_hint: measure, _type_hint: number}, {
        table_calculation: everyone_else, label: Everyone Else, expression: 'if(${assignee.output_name_select}
          != ${assignee.name}, ${ticket.avg_days_to_solve}, null)', value_format: !!null '',
        value_format_name: decimal_0, _kind_hint: measure, _type_hint: number}]
    stacking: normal
    trellis: ''
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    show_value_labels: false
    label_density: 25
    legend_position: center
    hide_legend: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      me: "#797bc4"
      everyone_else: "#d2d7ed"
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: bottom, series: [{id: highlight_count, name: Highlight
              Count, axisId: highlight_count}, {id: everyone_else_count, name: Everyone
              Else Count, axisId: everyone_else_count}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#000000"
    hidden_fields: [assignee.output_name_select, ticket_close_dates.average_time_to_resolution,
      ticket.avg_days_to_solve]
    listen: {}
    row: 10
    col: 8
    width: 16
    height: 6
  - title: Solved Tickets vs Peers
    name: Solved Tickets vs Peers
    model: zendesk_analytics
    explore: ticket
    type: looker_bar
    fields: [assignee.name, assignee.output_name_select, ticket.count_solved_tickets]
    filters:
      assignee.name: "-NULL"
    sorts: [ticket.count_solved_tickets desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: me, label: Me, expression: 'if(${assignee.output_name_select}
          = ${assignee.name}, ${ticket.count_solved_tickets}, null)', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}, {
        table_calculation: everyone_else, label: Everyone Else, expression: 'if(${assignee.output_name_select}
          != ${assignee.name}, ${ticket.count_solved_tickets}, null)', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    stacking: normal
    trellis: ''
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    show_value_labels: false
    label_density: 25
    legend_position: center
    hide_legend: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      everyone_else: "#faf3a2"
      me: "#e8f028"
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: bottom, series: [{id: highlight_count, name: Highlight
              Count, axisId: highlight_count}, {id: everyone_else_count, name: Everyone
              Else Count, axisId: everyone_else_count}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#000000"
    hidden_fields: [assignee.output_name_select, ticket.count_solved_tickets]
    listen:
      Assignee: assignee.name_select
    row: 4
    col: 8
    width: 16
    height: 6
  - title: name
    name: name
    model: zendesk_analytics
    explore: ticket
    type: single_value
    fields: [assignee.name, group.name]
    filters:
      assignee.name: Tom Davies
    sorts: [group.name desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: false
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    series_types: {}
    row: 0
    col: 0
    width: 8
    height: 4
  - name: ''
    type: text
    title_text: ''
    body_text: <font color="#5A2FC2" size="8"><center>Agent Overview Dashboard</center></font>
    row: 0
    col: 8
    width: 16
    height: 4
  - title: Open Ticket Timeline
    name: Open Ticket Timeline
    model: zendesk_analytics
    explore: ticket
    type: looker_timeline
    fields: [organization.name, ticket.created_date, ticket_close_dates.timeline_close_date,
      ticket.priority_raw]
    filters:
      ticket.is_open: 'Yes'
    sorts: [priority desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: priority, label: Priority, expression: "if(${ticket.priority_raw}=\"\
          low\",1,\n  if(${ticket.priority_raw}=\"normal\",2,\n    if(${ticket.priority_raw}=\"\
          high\",3,\n      if(${ticket.priority_raw}=\"urgent\",4,null))))", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, _type_hint: number}]
    color_application:
      collection_id: legacy
      palette_id: legacy_diverging1
      options:
        steps: 5
        reverse: false
    groupBars: true
    labelSize: 10pt
    valueFormat: yy-mmm
    showLegend: true
    series_types: {}
    hidden_fields: [ticket.priority_raw]
    listen:
      Assignee: assignee.name
    row: 23
    col: 0
    width: 8
    height: 18
  filters:
  - name: Assignee
    title: Assignee
    type: field_filter
    default_value: Tom Davies
    allow_multiple_values: true
    required: false
    model: zendesk_analytics
    explore: ticket
    listens_to_filters: []
    field: assignee.name
