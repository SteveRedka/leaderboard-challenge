var sleep = time => new Promise(resolve => setTimeout(resolve, time))
var poll = (promiseFn, time) => promiseFn().then(
             sleep(time).then(() => poll(promiseFn, time)))

function refresh_results() {
  $.ajax({
    type : 'GET',
    url : '/shows/refresh_results',
    dataType: "script"
  });
}

poll(() => new Promise(() => refresh_results()), 1000);
