App.informations = App.cable.subscriptions.create("InformationsChannel", {
  received: function(data) {
    var pElement = $(".detail-hidden").clone();
    pElement.text(data.information);
    pElement.removeClass("detail-hidden hidden");
    $(".show-information").append(pElement);
  },
});
