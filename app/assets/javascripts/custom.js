$(document).ready(function(){
  $('.new_content a').on('click',function(e){
    if(!$(this).attr('href').includes('.com') || !$(this).attr('href').includes('www')) {
      e.preventDefault();
      $('input#content_href').val($(this).attr("href"));
      $('.submit_link').click();
    }
  });
  $('.new_content .listnews_title').removeAttr('onmouseout').removeAttr('onmouseover');
});
