
function myFunction(checked, id, product_id) {
    let active = checked ? 1 : 0;
    $.ajax({
        async: true,
        type: "POST",
        url: "/index.php/adminController",
        data: {_fun: 'manage_message', active: active, id: id, product_id: product_id},
        success: function (data) {
            console.log(data);
        }
    });
}

$(function () {
    $.ajax({
        async: true,
        type: "POST",
        url: "/index.php/adminController",
        data: {_fun: 'homepage'},
        success: function (data) {
            // render comments
            $.each(data.comments, function (key, value) {
                let checked = value.active === "1" ? 'checked' : '';
                $('#_comments').append('<div class="col-md-12">' +
                    '<p class="ptitle"><b>' + value.company_name + '</b> ' + value.product_title + '</p>' +
                    '<p class="pnameemail">' + value.name + ' |  ' +  value.email +'</p>' +
                    '<p class="pshortd">' + value.text + '</p>' +
                    '<input type="checkbox" class="pshortd" '+ checked +' onclick="myFunction(this.checked, '+ value.id +', '+ value.product_id +')" />' +
                    '</div>');
            });
        }
    });
});