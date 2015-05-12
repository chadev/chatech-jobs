$(function() {
  $(document).on('click', '.close', handleCloseClick)

  function handleCloseClick(e) {
    $(this).parent().remove()
  }
})