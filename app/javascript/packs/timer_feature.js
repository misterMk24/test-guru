document.addEventListener('turbolinks:load', function() {
  let control_1 = document.querySelector('.timer')
  let last_time = new Date(control_1.dataset.endTimeId).getTime()
  let test_passage_id = parseInt(control_1.dataset.testPassagesId)

  let x = setInterval(function() {
    let initial_time = new Date().getTime()
    let result = last_time - initial_time
    
    let hours = Math.floor((result % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    let minutes = Math.floor((result % (1000 * 60 * 60)) / (1000 * 60))
    let seconds = Math.floor((result % (1000 * 60)) / 1000)
    
    control_1.textContent = `${hours}h ${minutes}m ${seconds}s`

    if (result < 0) {
      clearInterval(x)
      location.assign(`/test_passages/${test_passage_id}/result`)
    }
  }, 1000)
})
