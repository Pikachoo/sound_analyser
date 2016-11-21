function calculateSoundCharacter(id, start, end) {

    var url = '/api/sounds/' + id + '/character';
    if(start && end){
        url += '?start=' + start;
        url += '&end=' + end;
    }
    $.getJSON(url, function (data) {
            var selector = "#sound_specification_" + id;
            $(selector).html('');
            $(selector).append(
                '<table class="ui celled table">' +
                    '<thead>' +
                        '<tr>' +
                            '<th>Максимум</th>' +
                            '<th>Минимум</th>' +
                            '<th>Среднее Квадратическое</th>' +
                            '<th>Размах</th>' +
                            '<th>Пик-фактор</th>' +
                        '</tr>' +
                    '</thead>' +
                    '<tbody>'+
                        '<tr>' +
                            '<td>' + data.max + '</td>' +
                            '<td>' + data.min + '</td>' +
                            '<td>' + data.rms + '</td>' +
                            '<td>' + data.sound_range + '</td>' +
                            '<td>' + data.pf + '</td>' +
                        '</tr>' +
                    '</tbody>'+

                '</table>')

        }
    )
}
