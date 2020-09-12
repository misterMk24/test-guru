document.addEventListener('turbolinks:load', function() {
  let password_confirm_element = document.getElementById('user_password_confirmation')
  let password_element = document.getElementById('user_password')

  if (password_confirm_element) { password_confirm_element.addEventListener('input', informUsers) }
  if (password_element) { password_element.addEventListener('input', informUsers) }
})

function informUsers() {
  let password_element_value = document.getElementById('user_password').value
  let password_confirm_element = document.getElementById('user_password_confirmation')
  let value = password_confirm_element.value

  if (value === "") {
    document.querySelector('.octicon-check-circle').classList.add('d-none')
    document.querySelector('.octicon-alert').classList.add('d-none')
    return 0
  }

  if (value === password_element_value) {
    document.querySelector('.octicon-check-circle').classList.remove('d-none')
    document.querySelector('.octicon-alert').classList.add('d-none')
  } else {
    document.querySelector('.octicon-check-circle').classList.add('d-none')
    document.querySelector('.octicon-alert').classList.remove('d-none')
  }
} 

