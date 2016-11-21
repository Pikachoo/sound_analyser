MIN = 0;
MAX = 4096;
function initChartSingal(id) {
    var url = '/api/sounds/' + id + '/get';
    $.getJSON(url, function (data) {

            var time_total = data.general_time;
            var time_step = time_total / data.data_size;

            Highcharts.stockChart("graph_container_" + id,
                {
                    chart: {

                        zoomType: 'x'
                    },

                    rangeSelector: {
                        buttons: [{
                            type: 'all',
                            text: 'all'
                        },
                            {
                                type: 'second',
                                count: 1,
                                text: '1024'
                            },
                            {
                                type: 'second',
                                count: 2,
                                text: '2048'
                            },
                            {
                                type: 'second',
                                count: 4,
                                text: '4096'
                            },
                            {
                                type: 'second',
                                count: 8,
                                text: '8192'
                            },
                            {
                                type: 'second',
                                count: 16,
                                text: '16384'
                            },
                            {
                                type: 'second',
                                count: 32,
                                text: '32768'
                            }],

                        selected: 0
                    },
                    xAxis: {
                        labels: {
                            formatter: function () {

                                var value = this.value * time_step;

                                value = Math.round(value * 10000) / 10000;

                                return value;
                            }
                        },
                        events: {
                            afterSetExtremes: function () {
                                if (this.min != MIN || this.max != MAX) {
                                    MIN = this.min;
                                    MAX = this.max;
                                    console.log(MIN);
                                    console.log(MAX);
                                    calculateSoundCharacter(id, this.min, this.max, id);
                                    initChartSpector(id, this.min, this.max);
                                }
                            }
                        }
                    },

                    yAxis: {
                        title: {text: 'Значения в точке'}
                    },

                    title: {
                        text: 'Cигнал из файла ' + data.file_name
                    },

                    series: [{
                        name: 'Значение',
                        data: data.data,
                        pointStart: data.pointStart
                    }],
                    tooltip: {
                        formatter: function () {
                            return '<b>Сигнал: </b>' + round(this.y) + '<br />' +
                                '<b>Время: </b> ' + round(this.x * time_step) + ' с';
                        }
                    }


                });
        }
    )

}
function initChartSpector(id, start, end) {
    var url = '/api/sounds/' + id + '/spector';

    if (typeof start !== 'undefined' && typeof end !== 'undefined' &&  !isNaN(start) &&  !isNaN(end)) {
        url += '?start=' + start
        url += '&end=' + end
    }
    $.getJSON(url, function (data) {

            var time_step = 1;

            Highcharts.stockChart("spector_container_" + id,
                {
                    chart: {

                        zoomType: 'x'
                    },

                    rangeSelector: {
                        buttons: [{
                            type: 'all',
                            text: 'all'
                            }],

                        selected: 0
                    },

                    xAxis: {
                        labels: {
                            formatter: function () {
                                var value = this.value * time_step ;
                                return value;
                            }
                        },
                        min: 0,
                        max: 500
                    },

                    yAxis: {
                        title: {text: 'Значения в точке'}
                    },

                    title: {
                        text: 'Амплитудный спектр'
                    },

                    range: 500,
                    series: [{
                        name: 'Значение',
                        data: data.data,
                        pointStart: data.pointStart,
                        dataGrouping: {
                            enabled: false
                        }
                    }],
                    tooltip: {
                        formatter: function () {
                            return '<b>№: </b> ' + round(this.x * time_step) + ' <br />' +
                                    '<b>Сигнал: </b>' + this.y;
                        }
                    }


                });
        }
    )

}
