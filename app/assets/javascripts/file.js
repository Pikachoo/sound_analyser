$(function () {
    $('#directory').on('change', function () {
        var selector = ".files_container";
        var extension = '';
        var extension_style = '';

        var files = event.target.files;
        var directory = files[0].webkitRelativePath.split("/")[0];
        $("#directory_name").text(directory);


        $(selector).html("");
        $.each(files, function (index, file) {
            var arr_path = file.webkitRelativePath.split("/");
            arr_path.pop();
            var full_path = arr_path.join('/');
            extension = file.name.split('.').pop();

            if (extension === 'txt' || extension == 'bin') {
                if (extension === 'bin') {
                    extension_style = 'style="display:none"';
                }
                else {
                    extension_style = '';
                }

                $(selector).append('<div class="ui form-group" ' + extension_style + '>' +
                                        '<div class="ui checkbox">' +
                                            '<input type="checkbox" name="file_' + index + '">' +
                                            '<label>' + file.name + '</label>' +
                                        '</div>' +
                                    '</div>');
                var formData = new FormData();
                formData.append('file', file);
                formData.append('directory', full_path);

                $.ajax({
                    url: 'api/file/load',
                    type: 'POST',
                    data: formData,
                    processData: false,  // tell jQuery not to process the data
                    contentType: false,  // tell jQuery not to set contentType
                    success: function (data) {
                        console.log(data);
                    }
                });
            }


        });


        $(selector).append('<div class="form-group"><button type="submit" class="ui submit button">Submit</button></div>')
    });
});
