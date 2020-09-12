document.addEventListener('turbolinks:load', function() {
  // let controls = document.querySelectorAll('.form-inline-link')
  // 
  // if (controls.length) {
  //   for (let i = 0; i < controls.length; i++) {
  //     controls[i].addEventListener('click', formInlineLinkHandler)
  //   }
  // }

  $('.form-inline-link').on('click', formInlineLinkHandler)

  let errors = document.querySelector('.resource-errors')

  if (errors) {
    let resourceId = errors.dataset.resourceId
    formInlineHandler(resourceId)
  }
})

function formInlineLinkHandler(e) {
  e.preventDefault()
  let testId = this.dataset.testId
  formInlineHandler(testId)
}

function formInlineHandler(testId) {
  let link = document.querySelector(`.form-inline-link[data-test-id="${testId}"]`)
  // let testTitle = document.querySelector(`.test-title[data-test-id="${testId}"]`)
  // let formInline = document.querySelector(`.form-inline[data-test-id="${testId}"]`)

  let $testTitle = $(`.test-title[data-test-id="${testId}"]`)
  let $formInline = $(`.form-inline[data-test-id="${testId}"]`)

  $formInline.toggle()
  $testTitle.toggle()

  if ($formInline.is(':visible')) {
    link.textContent = 'Cancel'
  } else {
    link.textContent = 'Edit'
  }

  // if (formInline.classList.contains('d-none')) {
  //   testTitle.classList.add('d-none')
  //   formInline.classList.remove('d-none')
  //   link.textContent = 'Cancel'
  // } else {
  //   testTitle.classList.remove('d-none')
  //   formInline.classList.add('d-none')
  //   link.textContent = 'Edit'
  // }
}
