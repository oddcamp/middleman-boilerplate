$searchOnBtn.on('click', () => {
  $header.attr('data-mode', 'show-search')
  $searchField.trigger('focus')
})
