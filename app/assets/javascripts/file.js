function load_file(file, full_path) {
    var formData = new FormData();
    formData.append('file', file);
    formData.append('directory', full_path);

    $.ajax({
        url: 'api/file/load',
        type: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function (data) {
            console.log(data);
        }
    });
}

function round(number) {
    return Math.round(number * 10000) / 10000;
};

$(function () {
    $('#directory').on('change', function () {
        var selector = ".files_container";
        var files = event.target.files;
        var directory = files[0].webkitRelativePath.split("/")[0];
        $("#directory_name").text(directory);

        $(selector).html("");
        $.each(files, function (index, file) {
            var full_path = file.webkitRelativePath.split("/").slice(0, -1).join("/");
            var extension = file.name.split('.').pop();

            if (extension === 'txt' || extension === 'bin') {
                if (extension === 'txt') {
                    var append_child = '<div class="ui form-group" >' +
                        '<div class="ui checkbox">' +
                        '<input type="hidden" name="files[name][]" value="' + file.name + '">' +
                        '<input type="checkbox" name="' + file.name + '" >' +
                        '<label>' + file.name + '</label>' +
                        '</div>' +
                        '</div>';

                    $(selector).append(append_child);

                }
                load_file(file, full_path);
            }


        });

        $(selector).append('<div class="form-group"><button type="submit" class="ui submit button">Submit</button></div>')
    });
});

