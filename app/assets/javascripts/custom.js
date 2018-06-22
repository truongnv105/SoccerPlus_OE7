$(document).ready(function(){
  $('.new_content a').on('click',function(e){
    if(!$(this).attr('href').includes('.com') || !$(this).attr('href').includes('www')) {
      e.preventDefault();
      $('input#content_href').val($(this).attr('href'));
      $('.submit_link').click();
    }
  });

  $('.new_content .listnews_title').removeAttr('onmouseout').removeAttr('onmouseover');
  
  setTimeout(function(){
    $('body').find('.alert').remove();
  },3000);

});

$(document).keypress(function(key){
  if(key.which == 13){
    $('#send_message').click();
  }
});

(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v3.0&appId=2156255167965970&autoLogAppEvents=1';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
