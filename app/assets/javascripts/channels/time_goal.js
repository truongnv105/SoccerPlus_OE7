App.time_goals = App.cable.subscriptions.create('TimeGoalsChannel', {
  received: function(data) {
    var point = parseInt($(".point-team-" + data.team).text());
    $(".point-team-" + data.team).text(point + 1);
    var pElement = $(".detail-hidden").clone();
    pElement.text(data.information);
    pElement.removeClass("hidden");
    $(".show-information").append(pElement);
  },
});
