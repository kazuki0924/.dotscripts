#!/usr/local/bin/bash

# create symlink
ln -s "/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin/code" "/usr/local/bin/code-insiders"
ln -s "/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin/code" "/usr/local/bin/code"

# install extensions

EXTENSIONS=(
	766b.go-outliner
	aaron-bond.better-comments
	ahmadawais.shades-of-purple
	akamud.vscode-theme-onedark
	aslamanver.vsc-export
	asvetliakov.vscode-neovim
	bierner.color-info
	bierner.docs-view
	bierner.emojisense
	bierner.markdown-checkbox
	bierner.markdown-emoji
	bierner.markdown-footnotes
	bierner.markdown-preview-github-styles
	bierner.markdown-yaml-preamble
	bmalehorn.shell-syntax
	bpruitt-goddard.mermaid-markdown-syntax-highlighting
	christian-kohler.npm-intellisense
	christian-kohler.path-intellisense
	CodeStream.codestream
	codezombiech.gitignore
	CoenraadS.bracket-pair-colorizer-2
	darkriszty.markdown-table-prettify
	DavidAnson.vscode-markdownlint
	dbaeumer.vscode-eslint
	dracula-theme.theme-dracula
	eamodio.gitlens
	edgarjs.next-js-commands
	EditorConfig.EditorConfig
	eg2.vscode-npm-script
	esbenp.prettier-vscode
	formulahendry.auto-close-tag
	formulahendry.auto-rename-tag
	GitHub.github-vscode-theme
	gizak.shortcuts
	golang.go
	Gruntfuggly.bettercomment
	IBM.output-colorizer
	imagio.vscode-dimmer-block
	ipatalas.vscode-postfix-ts
	jdinhlife.gruvbox
	jeff-hykin.better-shellscript-syntax
	johnpapa.winteriscoming
	jolaleye.horizon-theme-vscode
	kaisun.vscodevimacademy
	kevinmcgowan.TypeScriptImport
	kisstkondoros.vscode-gutter-preview
	leizongmin.node-module-intellisense
	MaxMedia.go-prof
	mgmeyers.markdown-writer-theme
	mhutchie.git-graph
	miclo.sort-typescript-imports
	mike-co.import-sorter
	mikestead.dotenv
	mishkinf.goto-next-previous-member
	ms-azuretools.vscode-docker
	ms-vscode.Theme-MarkdownKit
	nhoizey.gremlins
	Noctarya.terminals
	oderwat.indent-rainbow
	ohanedan.lowlight-go-errors
	pflannery.vscode-versionlens
	PKief.material-icon-theme
	pmneo.tsimporter
	premparihar.gotestexplorer
	PulkitGangwar.nextjs-snippets
	redhat.vscode-yaml
	RedVanWorkshop.explorer-exclude-vscode-extension
	richie5um2.vscode-sort-json
	ryu1kn.partial-diff
	sainnhe.gruvbox-material
	sdras.night-owl
	shd101wyy.markdown-preview-enhanced
	sortafreel.markdown-edit-theme
	streetsidesoftware.code-spell-checker
	stylelint.vscode-stylelint
	svipas.control-snippets
	TabNine.tabnine-vscode
	timonwong.shellcheck
	tombonnike.vscode-status-bar-format-toggle
	tomphilbin.gruvbox-themes
	trixnz.go-to-method
	usernamehw.errorlens
	VisualStudioExptTeam.vscodeintellicode
	vstirbu.vscode-mermaid-preview
	Wattenberger.footsteps
	wix.vscode-import-cost
	wwm.better-align
	XadillaX.viml
	yzhang.markdown-all-in-one
	zhuangtongfa.material-theme

	# Horizon Theme
	# https://github.com/jolaleye/horizon-theme-vscode
	https://marketplace.visualstudio.com/items?itemName=jolaleye.horizon-theme-vscode
)

for EXTENSION in "${EXTENSIONS[@]}"; do
	ITEMNAME="$(echo "$EXTENSION" | awk -F "itemName=" '{print $NF}')"
	code-insiders --force --install-extension "$ITEMNAME"
	echo installed "$ITEMNAME"
done
