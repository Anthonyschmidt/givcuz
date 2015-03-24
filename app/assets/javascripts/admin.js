$(document).ready(function(){


  $('#category_form').on('submit', function (e){
      e.preventDefault();

      // post url
      var method = $("#method").val();
      var url = (method == "new") ? "/admin/new_category" : "/admin/edit_category/" + $("#category_id").val();

      // ajax parameters
      var parameters = {};
      parameters.name = $('#inputName').val();

      // success callback
      var _success = function(resp) {
        if (resp.success) {
          if($("#method").val() == "edit"){
            document.location.href = "/admin/categories"
          }else{
            $('.alert-success').fadeIn();
            $('#category_form')[0].reset();
          }
        } else {
          $('.alert-danger').fadeIn();
        }
      };

      ajax(url, 'POST', 'json', _success, null, parameters);

      return false;
  });

  $('#user_form').on('submit', function (e){
      e.preventDefault();

      if($('#inputPassword').val() != $('#inputPasswordConfirmation').val()){
        $('.alert-danger').html("<strong>Error!</strong> The passwords don't match.");
        $('#alert-danger-pass').fadeIn();
      } else if ($('#inputPassword').val().length < 8) { 
        $('.alert-danger').html('<strong>Error!</strong> The password must be at least 8 characters long.');
        $('#alert-danger-pass').fadeIn();
      } else {

        // post url
        var method = $("#method").val();
        var url = (method == "new") ? "/admin/new_user" : "/admin/edit_user/" + $("#user_id").val();

        // ajax parameters
        var parameters = {};
        parameters.email = $('#inputEmail').val();
        parameters.user_type = $('#types').val();
        parameters.npo_id = $('#npos').val();
        parameters.business_id = $('#businesses').val();
        parameters.password = $('#inputPassword').val();
        parameters.password_confirmation = $('#inputPasswordConfirmation').val();

        // success callback
        var _success = function(resp) {
          $('#alert-danger-pass').hide();
          if (resp.success) {
            if($("#method").val() == "edit"){
              document.location.href = "/admin/users"
            }else{
              $('.alert-danger').hide();
              $('.alert-success').fadeIn();
              $('#user_form')[0].reset();
              $("#business_container").addClass('hidden');
              $("#npos_container").addClass('hidden');
            }
          } else {
            $('#alert-danger-pass').hide();
            $('#alert-danger-pass').html('<strong>Error!</strong> ' + resp.message);
            $('#alert-danger-pass').fadeIn();
          }
        };

        ajax(url, 'POST', 'json', _success, null, parameters);
      }

      return false;
  });

  $('#edit_user').on('click', function (e){
      e.preventDefault();
      if (($('#inputPassword').val().length > 0) && (!$('#currentPassword').val().length)){
        $('.alert-danger').html("<strong>Error!</strong> Please insert your current password.");
        $('.alert-danger').fadeIn();
      } else if ($('#inputPassword').val() != $('#inputPasswordConfirmation').val()){
        $('.alert-danger').html("<strong>Error!</strong> The passwords don't match.");
        $('.alert-danger').fadeIn();
      } else if (($('#inputPassword').val().length > 0) && ($('#inputPassword').val().length < 8)) { 
        $('.alert-danger').html('<strong>Error!</strong> The password must be at least 8 characters long.');
        $('.alert-danger').fadeIn();
      } else {

        // post url
        var method = $("#method").val();
        var url = (method == "new") ? "/admin/new_user" : "/admin/edit_user/" + $("#user_id").val();

        // ajax parameters
        var parameters = {};
        parameters.email = $('#inputEmail').val();
        parameters.user_type = $('#types').val();
        parameters.npo_id = $('#npos').val();
        parameters.business_id = $('#businesses').val();
        parameters.current_password = $('#currentPassword').val();
        parameters.password = $('#inputPassword').val();
        parameters.password_confirmation = $('#inputPasswordConfirmation').val();

        // success callback
        var _success = function(resp) {
          $('#alert-danger-pass').hide();
          if (resp.success) {
            if($("#method").val() == "edit"){
              document.location.href = "/admin/users"
            }else{
              $('.alert-danger').hide();
              $('.alert-success').fadeIn();
              $('#user_form')[0].reset();
              $("#business_container").addClass('hidden');
              $("#npos_container").addClass('hidden');
            }
          } else {
            $('.alert-danger').html('<strong>Error!</strong> ' + resp.message);
            $('.alert-danger').fadeIn();
          }
        };

        ajax(url, 'POST', 'json', _success, null, parameters);
      }

      return false;
  });

  $('#deal_form').on('submit', function (e){
      e.preventDefault();

      var product = parseInt($("#products").val());
      var business = parseInt($("#businesses").val());

      if(product != -1 && business != -1 && $('#deal_form')[0].checkValidity()){

        if ((($('#inputExternalCuponCode').val().length) && (!$('#inputLinkExternalCode').val().length)) ||
          ((!$('#inputExternalCuponCode').val().length) && ($('#inputLinkExternalCode').val().length))) {
          $('.alert-danger').html('<strong>Error!</strong> Both external code and external link must be inserted.');
          $('.alert-danger').fadeIn();
        } else {
          // ajax url
          var method = $("#method").val();
          var url = (method == "new") ? "/admin/new_deal" : "/admin/edit_deal/" + $("#deal_id").val();

          // post parameters
          var parameters = {};
          parameters.from = $("#inputFrom").val();
          parameters.to = $("#inputTo").val();
          parameters.discount = $("#inputDiscount").val();
          parameters.product_id = $("#products").val();
          parameters.npo_id = $("#npos").val();
          parameters.per_business = $("#inputPercentageBusiness").val();
          parameters.per_npo = $("#inputPercentageNPO").val();
          parameters.per_givcuz = $("#inputPercentageGivCuz").val();
          parameters.coupon_expires_after_days = $('#inputCouponExpire').val();
          parameters.max_coupons_offered = $('#inputMaxCouponsOffered').val();
          parameters.max_coupons_per_user = $('#inputMaxCouponsPerUser').val();
          parameters.external_cupon_code = $('#inputExternalCuponCode').val();
          parameters.link_external_code = $('#inputLinkExternalCode').val();
          parameters.is_daily_deal = $('#inputDailyDeal').is(":checked");
          parameters.featured = $('#inputFeaturedDeal').is(":checked");

          // success callback
          var _success = function(resp) {
            if (resp.success) {
              if($("#method").val() == "edit"){
                document.location.href = "/admin/deals"
              } else {
                $('.alert-danger').hide();
                $('.alert-success').fadeIn();
                $('#deal_form')[0].reset();
              }
            } else {
              $('.alert-danger').fadeIn();
            }
          };

          ajax(url, 'POST', 'json', _success, null, parameters);
        }

        return false;
        
      }else{
        $('.alert-danger').fadeIn();
      }
  });

  $('#sign_up_form').on ('submit', function (e) {
    e.preventDefault();
    new_donor();
  });

  $('#new-donor-button').click(function (e){
    new_donor();
  });

  $('.delete').bind('click', function (e) {
    e.preventDefault();
    var id_element = $(this).attr('id').split('delete-item-')[1];
    var type = $(this).attr('class').split('type-')[1];
    var r = confirm("Are you sure you want to delete the " + type + "?");
    if (r == true) {
      url = "/admin/delete_" + type + "/" + id_element;

      // success callback
      var _success = function(resp) {
        if (!resp.error) {
         location.reload();
        } 
      };

      ajax(url, 'POST', 'json', _success, null, null);
    }
    return false;
  });

  /*****************/
  /* aux functions */
  /*****************/

  function fadeOutAlerts(){
    window.setTimeout(function() {
      $(".alert").fadeTo(500, 0).slideUp(500, function(){
        $(this).remove();
      });
    }, 5000);
  };

  function new_donor() {
    // post url
      var url = "/donor/new_donor/" + $("#npo_code").val();
      if ($('#inputPassword').val().length < 8) {
        $('.alert-danger').html('<strong>Error!</strong> The password must be at least 8 characters long.');
        $('.alert-danger').fadeIn();
        $('.alert-success').fadeOut();
      } else {
        $('.alert-danger').html('<strong>Error!</strong> Change a few things up and try submitting again.');
        $('.alert-success').fadeOut();
        // ajax parameters
        var parameters = {};
        parameters.username = $('#inputUsername').val();
        parameters.email = $('#inputEmail').val();
        parameters.password = $('#inputPassword').val();
        parameters.password_confirmation = $('#inputPassword2').val();

        // success callback
        var _success = function(resp) {
          if (resp.success) {
            $('.alert-danger').fadeOut();
            $('.alert-success').fadeIn();
            $('#category_form')[0].reset();
          } else {
            $('.alert-success').fadeOut();
            $('.alert-danger').html('<strong>Error!</strong> ' + resp.message);
            $('.alert-danger').fadeIn();
          }
        };

        ajax(url, 'POST', 'json', _success, null, parameters);
      }
  }

  function ajax(url, type, data_type, success_callback, error_callback, parameters){
    $.ajax({
        url: url,
        type: type,
        success: success_callback,
        error: error_callback,
        dataType: data_type,
        data: parameters
    });
  };

  /******************/
  /* page listeners */
  /******************/

  function admin_new_deal_page_js(){};

});
