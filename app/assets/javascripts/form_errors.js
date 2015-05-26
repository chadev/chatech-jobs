$(function() {
  var inputsWithErrors    = '.field_with_errors input[type=text]'
    , textareaWithErrors  = '.field_with_errors textarea'
    , inputAndTextAreas   = inputsWithErrors + ', ' + textareaWithErrors;

  $(inputAndTextAreas).blur(handleFocusOnErrorInput);

  function handleFocusOnErrorInput(e) {
    $(this).closest('.field').children().removeClass('field_with_errors')
  }
});
