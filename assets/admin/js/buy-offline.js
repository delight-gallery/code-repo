function buyOffline(){
	this.customer = '';
	this.selectedCustomer = '';
}



buyOffline.prototype.getCustomer = function(){
	$.ajax({
         type: "GET",
         url: admin_get_customer,
         success: function(data) {
         	buyOffline.customer=data.user;
            $.each(buyOffline.customer, function(i,v){
                buyOffline.customer[i].name = buyOffline.customer[i].phone; 
            });
            buyOffline.setCustomerAutoComplete(buyOffline.customer);
              
         }
        });
}
buyOffline.prototype.setCustomerAutoComplete = function(user)
{
	$('.customer-auto-complete').typeahead({
		source : user,
        display: ["phone"],
		afterSelect : function(user){
			buyOffline.selectedCustomer=user.id;
			buyOffline.getCustomerById(buyOffline.selectedCustomer)
			
		}
	});
}
buyOffline.prototype.getCustomerById = function(id)
{
	$.ajax({
         type:"GET",
         url:admin_get_customer+'/'+id,
         success:function(data)
         {
            if (data.user.address) {
                $('[name=address]').val(data.user.address);
            }
            if (data.user.name) {
                $('[name=name]').val(data.user.name);
            }
            if (data.user.email) {
                $('[name=email]').val(data.user.email);
            }
            if (data.user.city) {
                $('[name=city]').val(data.user.city);
            }
            if (data.user.zip) {
                $('[name=zip]').val(data.user.zip);
            }
              
         }
        });
}

buyOffline = new buyOffline();
$(document).ready(function(e){

    $('.customer-auto-complete').attr('autocomplete','off');

	buyOffline.getCustomer();

    $('.increase-product-quantity').on('click',function(){
        quantity = parseInt($(this).parent().find('[name=qty]').val());
        $(this).parent().find('[name=qty]').val(quantity);
        $(this).closest('form').submit();
    });

    $('.decrease-product-quantity').on('click',function(){
        quantity = parseInt($(this).parent().find('[name=qty]').val());
        if (quantity > 1) {
            quantity = quantity - 2;
            $(this).parent().find('[name=qty]').val(quantity);
            $(this).closest('form').submit();
        }
    });

});