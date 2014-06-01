$(document).ready(function() {
    var counter = 1;
    $('img.addButton').click(function() {
        var last_num = counter - 1;
        var new_div = $('<div id=\'decision' + counter + '\'></div>');
        new_div.append('<label>Decision ' + counter + '</label>');
        new_div.append('<input type=\'url\' name=\'decisionurl' + counter + '\'></input>');
        $('#decision' + last_num).after(new_div);
        counter += 1;
    });
});
