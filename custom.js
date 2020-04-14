document.addEventListener('DOMContentLoaded', function() {
  'use strict';
  // Select 'vim' keybinding
  const keybindingSelect = document.querySelector('select#keybinding');
  if (keybindingSelect) {
    keybindingSelect.value = 'vim';
    keybindingSelect.dispatchEvent(new Event('change'));
  }

  // Focus the editor
  if (typeof ace_editor !== 'undefined') {
    ace_editor.focus();
  }
});
