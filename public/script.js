$(".section-header__title").append( "<p class='test' style='background-color:red;'>Test</p>" );

 $.ajax({
    type: "GET",
    url: "https://eazymo-test.myshopify.com/admin/script_tags/count.json",
    data: { shop: "https://eazymo-test.myshopify.com" },
    success : function(data) {
      console.log(data);
      console.log('data');

    },
    error : function(error) {
      console.log(error);
      console.log('error');
    }
});