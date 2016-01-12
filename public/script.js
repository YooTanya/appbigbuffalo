$(".section-header__title").append( "<p class='test' style='background-color:red;'>Test</p>" );

 $.ajax({
    type: "GET",
    url: "https://eazymo-test.myshopify.com/admin/script_tags/count.json",
    data: { shop: "https://eazymo-test.myshopify.com" },
    success : function(data) {
        location.reload();
    },
    error : function(error) {

    }
});