# company-fontawesome.el


A [company-mode](https://github.com/company-mode/company-mode/)
backend to autocomplete font awesome CSS class names **with icon
previz** ! 😝

![Actual FA icons shown in selection list](visualSelection.gif "Visual Selection FTW!")

## Setup

### Dependencies

This backend depends on the [`all-the-icons`](https://github.com/domtronn/all-the-icons.el)
package and the presence of the [http://fontawesome.io/](Font Awesome font) in your system.

Copy `company-fontawesome.el` somewhere in your `load-path` then
execute the following:

```elisp
(require 'company-fontawesome)
(add-to-list 'company-backends 'company-fontawesome)
```

(and / or add it to your init file)

## FAQ

The wrong icon is displayed:

![Wrong icon is shown in selection list](fontConflict.jpg "Font conflict")

Disable the conflicting font (usually one of font-mfizz or octicons)
if you can't live with it until I find a way to force `company-mode`
to display the completion list using the Font Awesome face exclusively.

## Caveat Emptor

I finished the first iteration of this plug-in 90 minutes after writing my first
`(message "Hello, world!")` Emacs Lisp program. And it was 2am. Expect
rough edgez. :grin:

## TODO

- [ ] Cache candidates !
~- [ ] Offer to insert the character instead of the class name~
- [ ] Add completions for the modifier class names (e.g. fa-spin,
  fa-border, etc.)
- [ ] Add synonyms, e.g. magnifier / search from [the FA metadata](https://github.com/FortAwesome/Font-Awesome/blob/master/src/icons.yml) 
- [ ] Steal more ideas from [Will Boyd](https://github.com/lonekorean/atom-autocomplete-font-awesome)
- [ ] Properly package for MELPA

## Contribute

Don't hesitate to ask if you have ideas or wishes, I'll do my best.

## Acks

My thanks go to Will Boyd (@lonekorean) for provoking me into the discovery of Emacs Lisp, just for the occasion.
