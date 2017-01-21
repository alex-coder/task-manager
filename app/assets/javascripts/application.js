//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets

$(function () {
  $('[class*=change-state-]')
    .on('ajax:success', function (e, data) {
      var $task = $('#task-' + data.id);
      $task.find('[class*=change-state-].active').removeClass('active');
      $task.find('.change-state-' + data.state).addClass('active');
      $task.find('.status-text').text(data.state);
    })
})
