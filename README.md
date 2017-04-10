my emacs.d directory for home use. currently, i only use it for competitive programming.
make sure to make in emacs-color-theme-solarized
and also to make in cedet and cedet/contrib

//add these to your init.el if you want to add to your
//paths the semantic parses
(semantic-add-system-include "/usr/include/boost" 'c++-mode)
(semantic-add-system-include "~/linux/kernel")
(semantic-add-system-include "~/linux/include")

//to active the color theme, for the first time, you have to
//do the command:
color-theme-select
//you do commands by M-x