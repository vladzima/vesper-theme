;;; doom-vesper-theme.el --- Peppermint and orange flavored dark theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: Emiel
;; Source: https://github.com/emielvangoor/vesper-theme

(require 'doom-themes)

;;
;;; Variables

(defgroup doom-vesper-theme nil
  "Options for the `doom-vesper' theme."
  :group 'doom-themes)

(defcustom doom-vesper-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-vesper-theme
  :type 'boolean)

(defcustom doom-vesper-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-vesper-theme
  :type 'boolean)

(defcustom doom-vesper-comment-bg doom-vesper-brighter-comments
  "If non-nil, comments will have a subtle, darker background."
  :group 'doom-vesper-theme
  :type 'boolean)

(defcustom doom-vesper-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line."
  :group 'doom-vesper-theme
  :type '(choice integer boolean))

;;
;;; Theme definition

(def-doom-theme doom-vesper
    "A dark theme inspired by VSCode Vesper - peppermint and orange flavored."

  ;; name        default   256       16
  ((bg         '("#101010" "#101010" "black"))
   (bg-alt     '("#161616" "#161616" "black"))
   (base0      '("#0a0a0a" "#0a0a0a" "black"))
   (base1      '("#121212" "#121212" "brightblack"))
   (base2      '("#1c1c1c" "#1c1c1c" "brightblack"))
   (base3      '("#232323" "#232323" "brightblack"))
   (base4      '("#343434" "#343434" "brightblack"))
   (base5      '("#505050" "#505050" "brightblack"))
   (base6      '("#666666" "#666666" "brightblack"))
   (base7      '("#7e7e7e" "#7e7e7e" "brightblack"))
   (base8      '("#a0a0a0" "#a0a0a0" "white"))
   (fg         '("#ffffff" "#ffffff" "white"))
   (fg-alt     '("#a0a0a0" "#a0a0a0" "brightwhite"))

   (grey       base5)
   (red        '("#ff8080" "#ff8080" "red"))
   (orange     '("#ffc799" "#ffc799" "brightred"))
   (green      '("#99ffe4" "#99ffe4" "green"))
   (teal       '("#99ffe4" "#99ffe4" "brightgreen"))
   (yellow     '("#ffc799" "#ffc799" "yellow"))
   (blue       '("#99d1ff" "#99d1ff" "brightblue"))
   (dark-blue  '("#668fb3" "#668fb3" "blue"))
   (magenta    '("#ffb3d9" "#ffb3d9" "brightmagenta"))
   (violet     '("#d9b3ff" "#d9b3ff" "magenta"))
   (cyan       '("#99ffe4" "#99ffe4" "brightcyan"))
   (dark-cyan  '("#66ccb8" "#66ccb8" "cyan"))

   ;; face categories -- required for all themes
   (highlight      cyan)
   (vertical-bar   base2)
   (selection      base3)
   (builtin        cyan)
   (comments       (if doom-vesper-brighter-comments base7 base6))
   (doc-comments   (if doom-vesper-brighter-comments base8 base7))
   (constants      orange)
   (functions      fg)
   (keywords       fg)
   (methods        fg)
   (operators      fg)
   (type           cyan)
   (strings        cyan)
   (variables      base7)
   (numbers        orange)
   (region         base3)
   (error          red)
   (warning        orange)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright doom-vesper-brighter-modeline)
   (-modeline-pad
    (when doom-vesper-padded-modeline
      (if (integerp doom-vesper-padded-modeline) doom-vesper-padded-modeline 4)))

   (modeline-fg     fg)
   (modeline-fg-alt base7)

   (modeline-bg
    (if -modeline-bright
        base3
      bg-alt))
   (modeline-bg-inactive
    (if -modeline-bright
        base2
      bg)))

  ;;;; Base theme face overrides
  ((lazy-highlight :background base3 :foreground cyan :weight 'bold)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if -modeline-bright cyan highlight))

   ;;;; Variable faces - make them gray
   (font-lock-variable-name-face :foreground base7)
   (tree-sitter-hl-face:variable :foreground base7)
   (tree-sitter-hl-face:variable.builtin :foreground base7)
   (tree-sitter-hl-face:variable.parameter :foreground base7)
   (lsp-face-semhl-variable :foreground base7)
   (lsp-face-semhl-variable.readonly :foreground base7)
   (lsp-face-semhl-parameter :foreground base7)
   (lsp-face-semhl-property :foreground base7)

   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground fg)
   (css-selector             :foreground cyan)
   ;;;; doom-modeline
   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
   (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-project-root :foreground cyan :weight 'bold)
   ;;;; line-number
   (line-number :foreground base5)
   (line-number-current-line :foreground cyan :weight 'bold)
   ;;;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground cyan)
   ((markdown-code-face &override) :background base2)
   ;;;; org-mode
   (org-hide :foreground hidden)
   (org-level-1 :foreground cyan :weight 'bold)
   (org-level-2 :foreground cyan)
   (org-level-3 :foreground cyan)
   (org-level-4 :foreground cyan)
   (org-level-5 :foreground cyan)
   (org-level-6 :foreground cyan)
   (org-todo :foreground orange :weight 'bold)
   (org-done :foreground green :weight 'bold)
   ;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))

   ;; (lsp-face-semhl-interface :foreground "#0000ff")
   ;; (lsp-face-semhl-constant :foreground "#0000ff")
   (lsp-face-semhl-parameter :foreground "#ffffff")
   (font-lock-keyword-face :foreground "#909090")
   (lsp-face-semhl-interface :foreground "#ffffff")
   (lsp-face-semhl-function :foreground orange)
   (lsp-face-semhl-type :foreground orange)
   (font-lock-type-face :foreground orange)
   (font-lock-variable-name-face :foreground "#ffffff")
   (lsp-face-semhl-type :foreground orange)
   (lsp-face-semhl-default-library :foreground orange)
   (lsp-face-semhl-variable :foreground "#ffffff")
   (font-lock-function-call-face :foreground orange)
   (font-lock-function-name :foreground orange)
   (font-lock-variable-use-face :foreground orange)
   (font-lock-property-use-face :foreground "#ffffff")
   (typescript-ts-jsx-attribute-face :foreground "#909090")
   (font-lock-bracket-face :foreground "#909090")

   )
  ;;;; Base theme variable overrides
  ())

;;; doom-vesper-theme.el ends here
