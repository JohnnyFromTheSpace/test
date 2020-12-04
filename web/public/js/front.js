$(function () {
    $.ajax({
        async: true,
        type: "POST",
        url: "/index.php/frontController",
        data: {_fun: 'homepage'},
        success: function (data) {
            // render products
            $.each(data.products, function (key, value) {
                $('#_products').append('<div class="col-md-4">' +
                    '<img src="/public/img/' + value.image + '" />' +
                    '<p class="ptitle">' + value.company_name + ' ' + value.title + '</p>' +
                    '<p class="pshortd">' + value.short_description + '</p>' +
                    '</div>');
            });
            // render comments
            $.each(data.comments, function (key, value) {
                $('#_comments').append('<div class="col-md-12">' +
                    '<p class="ptitle"><b>' + value.company_name + '</b> ' + value.product_title + '</p>' +
                    '<p class="pshortd">' + value.text + '</p>' +
                    '</div>');
            });
            // select products for comment
            $.each(data.products, function (key, value) {
                $('#comm_product_id').append('<option value="'+ value.id +'">'+ value.title +'</option>');
            });
        }
    });
});

/**
 * Validate form
 *
 * @returns {boolean}
 */
function validateForm() {
    let form = document.forms["comment_form"];
    let comm_product_id = form["comm_product_id"].value;
    let comm_name = form["comm_name"].value;
    let comm_email = form["comm_email"].value;
    let comm_text = form["comm_text"].value;

    if (comm_product_id === "0" || comm_name === "" || comm_email === "" || comm_text === "") {
        alert('You have to fill all fields!');
        event.preventDefault();
        return false;
    }
}
