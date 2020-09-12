document.addEventListener('turbolinks:load', function() {
  let control_1 = document.querySelector('.progress')

  if (control_1) { window.addEventListener('load', changeProgressBar) }
})

function changeProgressBar() {
  let control_1 = document.querySelector('.progress')
  let control_2 = document.querySelector('.progress').lastElementChild
  

  current_position = Number(control_1.dataset.currentQuestionId)
  questions_amount = Number(control_1.dataset.questionsAmount)
  to_percentage = Math.round((current_position / questions_amount) * 100)

  control_2.textContent = `${to_percentage}%`
  control_2.setAttribute("style", `width: ${to_percentage}%`)
}
