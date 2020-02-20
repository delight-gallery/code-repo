function buyOffline(){
	this.customer = '';
	this.selectedCustomer = '';
}



buyOffline.prototype.getCustomer = function(){
	
	$.ajax({
         type:"GET",
         url:'/admin/BuyOffline/customer',
         success:function(data)
         {
         	buyOffline.customer=data.user;
            buyOffline.setCustomerAutoComplete(buyOffline.customer);
              
         }
        });
}
buyOffline.prototype.setCustomerAutoComplete = function(user)
{
	$('.customer-auto-complete').typeahead({
		source : user,
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
         url:'/admin/BuyOffline/customer/'+id,
         success:function(data)
         {
         	console.log(data);
              
         }
        });
}

buyOffline = new buyOffline();
$(document).ready(function(e){

	buyOffline.getCustomer();


});