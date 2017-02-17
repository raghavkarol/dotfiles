;; -----------------------------------------------------------------------------
;; *** emacs AUTOGENERATED MUST BE THE FIRST SECTION ***
;; -----------------------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-modes
   (quote
    (emacs-lisp-mode lisp-mode lisp-interaction-mode slime-repl-mode c-mode cc-mode c++-mode go-mode java-mode malabar-mode clojure-mode clojurescript-mode scala-mode scheme-mode ocaml-mode tuareg-mode coq-mode haskell-mode agda-mode agda2-mode perl-mode cperl-mode python-mode ruby-mode lua-mode ecmascript-mode javascript-mode js-mode js2-mode php-mode css-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode ts-mode sclang-mode verilog-mode erlang-mode)))
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(auto-save-default nil)
 '(blink-cursor-mode nil)
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(column-number-mode t)
 '(compilation-environment (quote ("TERM=eterm-color
")))
 '(compilation-error-regexp-alist
   (quote
    (("^>>> \\(.*?\\):\\([0-9]+\\) -- \\(.+\\)$"
      (1 "%s.erl" "../test/%s.erl" "../src/%s.erl")
      2 nil nil 3)
     ("^\\(.*?\\)\\(?:_meck_original\\)?:\\(.*?\\) failed on line \\([0-9]+\\)
Reason: \\(.+\\)$"
      (1 "%s.erl" "../test/%s.erl" "../src/%s.erl")
      3 nil nil 4)
     absoft ada aix ant bash borland python-tracebacks-and-caml comma cucumber msft edg-1 edg-2 epc ftnchek iar ibm irix java jikes-file maven jikes-line gcc-include ruby-Test::Unit gnu lcc makepp mips-1 mips-2 msft omake oracle perl php rxp sparc-pascal-file sparc-pascal-line sparc-pascal-example sun sun-ada watcom 4bsd gcov-file gcov-header gcov-nomark gcov-called-line gcov-never-called perl--Pod::Checker perl--Test perl--Test2 perl--Test::Harness weblint guile-file guile-line)))
 '(compilation-window-height 20)
 '(create-lockfiles nil)
 '(custom-safe-themes
   (quote
    ("3f67aee8f8d8eedad7f547a346803be4cc47c420602e19d88bdcccc66dba033b" "8578750fb94f908249a98dc14c3847d11863196f54de87a037b1374f2ae1f534" "fc7fd2530b82a722ceb5b211f9e732d15ad41d5306c011253a0ba43aaf93dccc" "b3bcf1b12ef2a7606c7697d71b934ca0bdd495d52f901e73ce008c4c9825a3aa" "c968804189e0fc963c641f5c9ad64bca431d41af2fb7e1d01a2a6666376f819c" "4a91a64af7ff1182ed04f7453bb5a4b0c3d82148d27db699df89a5f1d449e2a4" "aea30125ef2e48831f46695418677b9d676c3babf43959c8e978c0ad672a7329" "1263771faf6967879c3ab8b577c6c31020222ac6d3bac31f331a74275385a452" "d5b121d69e48e0f2a84c8e4580f0ba230423391a78fcb4001ccb35d02494d79e" "9d91458c4ad7c74cf946bd97ad085c0f6a40c370ac0a1cbeb2e3879f15b40553" "760ce657e710a77bcf6df51d97e51aae2ee7db1fba21bbad07aab0fa0f42f834" "3d47d88c86c30150c9a993cc14c808c769dad2d4e9d0388a24fee1fbf61f0971" "14f0fbf6f7851bfa60bf1f30347003e2348bf7a1005570fd758133c87dafe08f" "e1994cf306356e4358af96735930e73eadbaf95349db14db6d9539923b225565" "b9293d120377ede424a1af1e564ba69aafa85e0e9fd19cf89b4e15f8ee42a8bb" "5cd0afd0ca01648e1fff95a7a7f8abec925bd654915153fb39ee8e72a8b56a1f" "4e753673a37c71b07e3026be75dc6af3efbac5ce335f3707b7d6a110ecb636a3" "1160f5fc215738551fce39a67b2bcf312ed07ef3568d15d53c87baa4fd1f4d4e" "0e219d63550634bc5b0c214aced55eb9528640377daf486e13fb18a32bf39856" "9f9039435790286181108422b27eba46ff13f599649b707890dfc26ceec4906d" "42ba25fad91db26bfa0130161412d49804ff27e6a09bf45f1a8268511300d981" "cc67c4d5fcd37a750975cd50fb2555c9654dc5b92b6fb04d65161bdc4d708b9b" "861ac82c40304f1dfdc15c1627e6e1147c4cbc32bb84efc979a7df18c5afc0df" "97922df308abe2b5c8fea1995c9d55aebb40d8ee427bd4bce3ef736049d99182" "cdbd0a803de328a4986659d799659939d13ec01da1f482d838b68038c1bb35e8" "4f0f2f5ec60a4c6881ba36ffbfef31b2eea1c63aad9fe3a4a0e89452346de278" "40f6a7af0dfad67c0d4df2a1dd86175436d79fc69ea61614d668a635c2cd94ab" "708df3cbb25425ccbf077a6e6f014dc3588faba968c90b74097d11177b711ad1" "20e359ef1818a838aff271a72f0f689f5551a27704bf1c9469a5c2657b417e6c" "a1289424bbc0e9f9877aa2c9a03c7dfd2835ea51d8781a0bf9e2415101f70a7e" "68d36308fc6e7395f7e6355f92c1dd9029c7a672cbecf8048e2933a053cf27e6" "0ad5a61e6ee6d2e7f884c0da7a6f437a4c84547514b509bdffd06757a8fc751f" "0788bfa0a0d0471984de6d367bb2358c49b25e393344d2a531e779b6cec260c5" "133222702a3c75d16ea9c50743f66b987a7209fb8b964f2c0938a816a83379a0" "304c03c9cfcd368b4ab0832357788cd48513fe1bd89b9e531dd47886a83405a1" "6998bd3671091820a6930b52aab30b776faea41449b4246fdce14079b3e7d125" "b5fe3893c8808466711c1b55bb7e66b9c6aa2a86811783375a43e1beabb1af33" "e87a2bd5abc8448f8676365692e908b709b93f2d3869c42a4371223aab7d9cf8" "f5eb916f6bd4e743206913e6f28051249de8ccfd070eae47b5bde31ee813d55f" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "11636897679ca534f0dec6f5e3cb12f28bf217a527755f6b9e744bd240ed47e1" "19352d62ea0395879be564fc36bc0b4780d9768a964d26dfae8aad218062858d" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "a444b2e10bedc64e4c7f312a737271f9a2f2542c67caa13b04d525196562bf38" "2e5705ad7ee6cfd6ab5ce81e711c526ac22abed90b852ffaf0b316aa7864b11f" "b06aaf5cefc4043ba018ca497a9414141341cb5a2152db84a9a80020d35644d1" "3dafeadb813a33031848dfebfa0928e37e7a3c18efefa10f3e9f48d1993598d3" "6a9606327ecca6e772fba6ef46137d129e6d1888dcfc65d0b9b27a7a00a4af20" "282606e51ef2811142af5068bd6694b7cf643b27d63666868bc97d04422318c1" "7bde52fdac7ac54d00f3d4c559f2f7aa899311655e7eb20ec5491f3b5c533fe8" "95f954ce018bbff3107b357bd87d060db195a2d5c6b70411587223597fde171d" "46fd293ff6e2f6b74a5edf1063c32f2a758ec24a5f63d13b07a20255c074d399" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "efb148b9a120f417464713fe6cad47eb708dc45c7f2dbfeea4a7ec329214e63e" "90edd91338ebfdfcd52ecd4025f1c7f731aced4c9c49ed28cfbebb3a3654840b" "1297a022df4228b81bc0436230f211bad168a117282c20ddcba2db8c6a200743" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "f1af57ed9c239a5db90a312de03741e703f712355417662c18e3f66787f94cbe" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "51b8c4adab95ff23b8f5cf07ea0b9805c8662936fe0d877d61a0dd02b6adc5f6" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "97a2b10275e3e5c67f46ddaac0ec7969aeb35068c03ec4157cf4887c401e74b1" "e80932ca56b0f109f8545576531d3fc79487ca35a9a9693b62bf30d6d08c9aaf" "31a01668c84d03862a970c471edbd377b2430868eccf5e8a9aec6831f1a0908d" "a507b9ca4a605d5256716da70961741b9ef9ec3246041a4eb776102e8df18418" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "72407995e2f9932fda3347e44e8c3f29879c5ed88da71f06ba4887b0596959a4" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "f9e975bdf5843982f4860b39b2409d7fa66afab3deb2616c41a403d788749628" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "8d6fb24169d94df45422617a1dfabf15ca42a97d594d28b3584dc6db711e0e0b" "5e3fc08bcadce4c6785fc49be686a4a82a356db569f55d411258984e952f194a" "758da0cfc4ecb8447acb866fb3988f4a41cf2b8f9ca28de9b21d9a68ae61b181" "6c52612518ee6fb2b943833c7ce276db4ac5a34b4ee47aa469980030cc1e4e44" "9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" "c4e6fe8f5728a5d5fd0e92538f68c3b4e8b218bcfb5e07d8afff8731cc5f3df0" "33c5a452a4095f7e4f6746b66f322ef6da0e770b76c0ed98a438e76c497040bb" "7a9f392481b6e2fb027ab9d8053ab36c0f23bf5cc1271206982339370d894c74" "9bcb8ee9ea34ec21272bb6a2044016902ad18646bd09fdd65abae1264d258d89" "f0ea6118d1414b24c2e4babdc8e252707727e7b4ff2e791129f240a2b3093e32" "90b5269aefee2c5f4029a6a039fb53803725af6f5c96036dee5dc029ff4dff60" "53c542b560d232436e14619d058f81434d6bbcdc42e00a4db53d2667d841702e" "bf648fd77561aae6722f3d53965a9eb29b08658ed045207fe32ffed90433eb52" "e26780280b5248eb9b2d02a237d9941956fc94972443b0f7aeec12b5c15db9f3" "ce79400f46bd76bebeba655465f9eadf60c477bd671cbcd091fe871d58002a88" "a774c5551bc56d7a9c362dca4d73a374582caedb110c201a09b410c0ebbb5e70" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "410c47e5b36f3beb70b165b52badc13a77dea96ecea4811ec0f53b9d300be9bf" "bc89fda3d232a3daa4eb3a9f87d6ffe1272fea46e4cf86686d9e8078e4209e2c" "f0283ec7a2385af8ea0fbb1466f340bbd0b2cededa60831394ec94e98096e1a8" "944f3086f68cc5ea9dfbdc9e5846ad91667af9472b3d0e1e35a9633dcab984d5" "211bb9b24001d066a646809727efb9c9a2665c270c753aa125bace5e899cb523" "6bc195f4f8f9cf1a4b1946a12e33de2b156ce44e384fbc54f1bae5b81e3f5496" "8281168b824a806489ca7d22e60bb15020bf6eecd64c25088c85b3fd806fc341" "e85dd0d1b43cc1d725db627298c2753b0c3e90dc0b195e80f09f97a4e1e5660c" "5e1d1564b6a2435a2054aa345e81c89539a72c4cad8536cfe02583e0b7d5e2fa" "f38dd27d6462c0dac285aa95ae28aeb7df7e545f8930688c18960aeaf4e807ed" "159bb8f86836ea30261ece64ac695dc490e871d57107016c09f286146f0dae64" "64b7be5703b90e05f7bc1f63a9f689a7c931626462697bea9476b397da194bd9" default)))
 '(debug-on-error t)
 '(desktop-load-locked-desktop t)
 '(desktop-path (quote ("~/.emacs.d/")))
 '(display-time-mode t)
 '(ec2-private-key-file (quote /Volumes/Keys/Test/test-keypair))
 '(ecb-options-version "2.40")
 '(eclim-executable "/Applications/Eclipse.app/Contents/Eclipse/eclim")
 '(eclimd-executable "/Applications/Eclipse.app/Contents/Eclipse/eclimd")
 '(ede-project-directories
   (quote
    ("/Users/raghavkarol/github/issuu/backend-stream/python")))
 '(edebug-on-error nil)
 '(elscreen-display-tab t)
 '(elscreen-mode-to-nickname-alist
   (quote
    (("^dired-mode$" lambda nil
      (format "Dired(%s)" dired-directory))
     ("^Info-mode$" lambda nil
      (format "Info(%s)"
              (file-name-nondirectory Info-current-file)))
     ("^mew-draft-mode$" lambda nil
      (format "Mew(%s)"
              (buffer-name
               (current-buffer))))
     ("^mew-" . "Mew")
     ("^irchat-" . "IRChat")
     ("^liece-" . "Liece")
     ("^lookup-" . "Lookup"))))
 '(elscreen-tab-display-control nil)
 '(elscreen-tab-display-kill-screen nil)
 '(emms-mode-line-icon-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #1ba1a1\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };")))
 '(explicit-bash-args (quote ("--login" "-i")))
 '(fci-rule-color "#383838")
 '(flymake-error-bitmap (quote exclation-mark))
 '(flymake-log-level -1)
 '(gnuplot-program "/usr/local/bin/gnuplot")
 '(gnus-logo-colors (quote ("#4c8383" "#bababa")))
 '(gnus-mode-line-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #1ba1a1\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };")))
 '(graphviz-dot-indent-width 2)
 '(helm-autoresize-max-height 16)
 '(helm-autoresize-min-height 16)
 '(helm-autoresize-mode t)
 '(helm-buffer-skip-remote-checking t)
 '(helm-candidate-number-limit 16)
 '(helm-find-files-actions
   (quote
    (("Find filex" . helm-find-file-or-marked)
     ("Find file in Dired" . helm-point-file-in-dired)
     ("View file" . view-file)
     ("Find File in Elscreen " . helm-elscreen-find-file)
     ("Checksum File" . helm-ff-checksum)
     ("Query replace fnames on marked" . helm-ff-query-replace-on-marked)
     ("Query replace contents on marked" . helm-ff-query-replace)
     ("Query replace regexp contents on marked" . helm-ff-query-replace-regexp)
     ("Serial rename files" . helm-ff-serial-rename)
     ("Serial rename by symlinking files" . helm-ff-serial-rename-by-symlink)
     ("Serial rename by copying files" . helm-ff-serial-rename-by-copying)
     ("Open file with default tool" . helm-open-file-with-default-tool)
     ("Find file in hex dump" . hexl-find-file)
     ("Browse project" . helm-ff-browse-project)
     ("Complete at point `C-c i'" . helm-insert-file-name-completion-at-point)
     ("Insert as org link `C-c @'" . helm-files-insert-as-org-link)
     ("Find shell command `C-c /'" . helm-ff-find-sh-command)
     ("Add marked files to file-cache" . helm-ff-cache-add-file)
     ("Open file externally `C-c C-x, C-u to choose'" . helm-open-file-externally)
     ("Grep File(s) `C-s, C-u Recurse'" . helm-find-files-grep)
     ("Grep current directory with AG" . helm-find-files-ag)
     ("Git grep" . helm-ff-git-grep)
     ("Zgrep File(s) `M-g z, C-u Recurse'" . helm-ff-zgrep)
     ("Gid" . helm-ff-gid)
     ("Switch to Eshell `M-e'" . helm-ff-switch-to-eshell)
     ("Etags `M-., C-u reload tag file'" . helm-ff-etags-select)
     ("Eshell command on file(s) `M-!, C-u take all marked as arguments.'" . helm-find-files-eshell-command-on-file)
     ("Find file as root `C-c r'" . helm-find-file-as-root)
     ("Find alternate file" . find-alternate-file)
     ("Ediff File `C-='" . helm-find-files-ediff-files)
     ("Ediff Merge File `C-c ='" . helm-find-files-ediff-merge-files)
     ("Delete File(s) `M-D'" . helm-delete-marked-files)
     ("Copy file(s) `M-C, C-u to follow'" . helm-find-files-copy)
     ("Rename file(s) `M-R, C-u to follow'" . helm-find-files-rename)
     ("Symlink files(s) `M-S, C-u to follow'" . helm-find-files-symlink)
     ("Relsymlink file(s) `C-u to follow'" . helm-find-files-relsymlink)
     ("Hardlink file(s) `M-H, C-u to follow'" . helm-find-files-hardlink)
     ("Find file other window `C-c o'" . helm-find-files-other-window)
     ("Switch to history `M-p'" . helm-find-files-switch-to-hist)
     ("Find file other frame `C-c C-o'" . find-file-other-frame)
     ("Print File `C-c p, C-u to refresh'" . helm-ff-print)
     ("Locate `C-x C-f, C-u to specify locate db'" . helm-ff-locate))))
 '(helm-projectile-fuzzy-match nil)
 '(helm-type-buffer-actions
   (quote
    (("Switch to buffer(s)" . helm-switch-to-buffers)
     ("Switch to buffer(s) other window `C-c o'" . helm-switch-to-buffers-other-window)
     ("Switch to buffer other frame `C-c C-o'" . switch-to-buffer-other-frame)
     ("Display buffer in Elscreen" . helm-find-buffer-on-elscreen)
     ("Query replace regexp `C-M-%'" . helm-buffer-query-replace-regexp)
     ("Query replace `M-%'" . helm-buffer-query-replace)
     ("View buffer" . view-buffer)
     ("Display buffer" . display-buffer)
     ("Grep buffers `M-g s' (C-u grep all buffers)" . helm-zgrep-buffers)
     ("Multi occur buffer(s) `C-s'" . helm-multi-occur-as-action)
     ("Revert buffer(s) `M-U'" . helm-revert-marked-buffers)
     ("Insert buffer" . insert-buffer)
     ("Kill buffer(s) `M-D'" . helm-kill-marked-buffers)
     ("Diff with file `C-='" . diff-buffer-with-file)
     ("Ediff Marked buffers `C-c ='" . helm-ediff-marked-buffers)
     ("Ediff Merge marked buffers `M-='" .
      #[257 "\300\301\"\207"
            [helm-ediff-marked-buffers t]
            4 "

(fn CANDIDATE)"]))))
 '(horizontal-scroll-bar-mode nil)
 '(httpd-port 9080)
 '(jenkins-api-url "http://jenkins.issuu.com/job/Publish-Api/801/api/xml")
 '(line-number-mode t)
 '(linum-format (quote dynamic))
 '(mode-line-format
(quote
 ("%e" mode-line-front-space mode-line-mule-info mode-line-client mode-line-modified mode-line-remote mode-line-frame-identification mode-line-buffer-identification "   " mode-line-position evil-mode-line-tag
  (elscreen-display-screen-number
   (" " elscreen-mode-line-string))
  " *" my-current-session-name "* "
  (vc-mode vc-mode)
  "  " mode-line-modes mode-line-misc-info mode-line-end-spaces)))
 '(neo-after-create-hook nil)
 '(neo-cwd-line-style (quote text))
 '(neo-smart-open t)
 '(neo-theme (quote nerd))
 '(neo-window-position (quote right))
'(nrepl-message-colors
(quote
 ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
'(org-agenda-files
(quote
 ("/Users/raghav/org/index.org" "/Users/raghav/org/personal.org" "/Users/raghav/org/tasks.org")))
'(org-babel-load-languages
(quote
 ((python . t)
  (sh . t)
  (emacs-lisp . t)
  (sql . t)
  (gnuplot . t)
  (dot . t)
  (ruby . t))))
 '(org-confirm-babel-evaluate nil)
 '(org-default-notes-file "~/.notes")
 '(org-mobile-agendas (quote default))
 '(org-mobile-directory "~/Dropbox/Apps/MobileOrg")
 '(org-mobile-files (quote ("~/org/")))
 '(org-mobile-files-exclude-regexp "")
 '(org-mobile-inbox-for-pull "~/org/tasks.org")
 '(org-mobile-index-file "mobile-org-index.org")
 '(org-src-fontify-natively t)
 '(org-src-tab-acts-natively t)
'(package-archives
(quote
 (("gnu" . "http://elpa.gnu.org/packages/")
  ("melpa" . "http://melpa.org/packages/")
  ("marmalade" . "http://marmalade-repo.org/packages/"))))
'(package-selected-packages
(quote
 (company-distel company blank-mode blackboard-theme zenburn-theme base16-theme synonyms synonymous python-mode gradle-mode grandshell-theme magit multiple-cursors flymake-cursor anti-zenburn-theme adoc-mode rfringe wgrep auto-complete-distel ob-restclient markdown-mode sexy-monochrome-theme magithub intellij-theme doom-themes github-browse-file virtualenvwrapper docker groovy-mode yaml-mode wsd-mode windata wgrep-helm web-mode sqlup-mode skewer-mode sass-mode rvm rsense restclient projectile-rails paredit orgtbl-ascii-plot multi-term jedi imakado idle-highlight-mode highlight-parentheses helm-projectile helm-ls-git helm-git-grep helm-c-yasnippet helm-ag grizzl google-this gnuplot-mode gnuplot expand-region exec-path-from-shell enh-ruby-mode engine-mode elscreen-persist elisp-slime-nav edit-server edbi dired+ dash-at-point coffee-mode bookmark+ autopair atom-one-dark-theme atom-dark-theme anaphora ac-slime ac-python ac-math ac-inf-ruby ac-html ac-helm)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(projectile-completion-system (quote helm))
 '(projectile-enable-caching t)
 '(python-shell-exec-path (quote ("/usr/local/bin/python")))
 '(python-shell-interpreter "ipython")
 '(ropemacs-enable-shortcuts nil)
'(safe-local-variable-values
(quote
 ((eval setq derl-cookie "riak")
  (jedi:server-args "--virtual-env" "~/github/issuu/reader3-backend/_venv.dev" "--sys-path" "~/github/issuu/reader3-backend/backend/src")
  (jedi:server-args "--virtual-env" "~/github/issuu/reader3-backend/dev_venv" "--sys-path" "~/github/issuu/reader3-backend/backend/src")
  (jedi:server-args "--virtual-env" "~/github/issuu/reader3/dev_venv" "--sys-path" "~/github/issuu/reader3/src/")
  (eval setenv "TMPDIR" "/Users/rk/github/issuu/magma/tmp")
  (eval setenv "SENDGRID_USERNAME" "app2484658@heroku.com")
  (eval setenv "SENDGRID_PASSWORD" "agdifipd6132")
  (eval setenv "SCHEDULER_URL" "http://dc0l7yn02a4s31kfzappjr1zs@heroku-scheduler.herokuapp.com/")
  (eval setenv "S3_SECRET" "H58PqI+dO/0t7RpFl70vw8ZcAgaF1b6vGoCjWS44")
  (eval setenv "S3_KEY" "AKIAJLMS4N7O3UNZ2OAQ")
  (eval setenv "S3_BUCKET" "magma-dev")
  (eval setenv "RAILS_ENV" "production")
  (eval setenv "RACK_ENV" "production")
  (eval setenv "PAPERTRAIL_API_TOKEN" "TJIUxH384xJ5jFJYHipE")
  (eval setenv "LOG_LEVEL" "info")
  (eval setenv "LANG" "en_US.UTF-8")
  (eval setenv "DATABASE_URL" "mysql2://root:@localhost/magma_development")
  (eval setenv "GRAPHITE_HOST" "graphite.tissuu.com")
  (jedi:server-args "--virtual-env" "/Users/rk/github/issuu/backend-stream/python/dev_venv" "--sys-path" "/Users/rk/github/issuu/backend-stream/python/")
  (jedi:server-args "--virtual-env" "~/github/issuu/backend-userdb/dm_refact/_venv" "--sys-path" "~/github/issuu/backend-userdb/dm_refact/_venv")
  (jedi:server-args "--virtual-env" "~/github/issuu/publisher-suite/_venv" "--sys-path" "~/github/issuu/publisher-suite/")
  (jedi:server-args "--virtual-env" "/Users/rk/github/issuu/backend-conversion/processing/_venv" "--sys-path" "/Users/rk/github/issuu/backend-conversion/processing/src")
  (jedi:server-args "--virtual-env" "~/github/issuu/backend-graph/python/dev_venv" "--sys-path" "~/github/issuu/backend-graph/python/")
  (jedi:server-args "--virtual-env" "/Users/raghavkarol/github/issuu/backend-graph/python/dev_venv" "--sys-path" "/Users/raghavkarol/github/issuu/backend-graph/python/")
  (jedi:server-args "--virtual-env" "/Users/raghavkarol/github/issuu/backend-graph/python/dev_venv" "--sys-path" "/Users/raghavkarol/github/issuu/backend-graph/python")
  (eval setq derl-cookie "nevEemFeev")
  (jedi:server-args "--virtual-env" "~/github/issuu/payment/_venv" "--sys-path" "~/github/issuu/payment/")
  (eval setenv "ISSUU_ENV_NAME" "rk_local")
  (jedi:server-args "--virtual-env" "/Users/raghavkarol/github/issuu/backend-stream/python/dev_venv" "--sys-path" "/Users/raghavkarol/github/issuu/backend-stream/python/")
  (eval setq derl-cookie "ebbakHot")
  (eval setq derl-cookie "VekejSeomt")
  (eval setq derl-cookie "fbpagetab")
  (jedi:server-args "--virtual-env" "~/github/issuu/frontend-web2/publish-api/_venv" "--sys-path" "~/github/issuu/frontend-web2/publish-api/")
  (eval setenv "ISSUU_ENV_NAME" "dev")
  (eval setenv "ISSUU_ENV_NAME" "uat")
  (python-shell-interpreter . "ipython")
  (projectile-use-git-grep t)
  (jedi:server-args "--virtual-env" "/Users/raghavkarol/github/issuu/payment/_venv" "--sys-path" "/Users/raghavkarol/github/issuu/payment/"))))
 '(send-mail-function (quote mailclient-send-it))
 '(show-paren-mode t)
 '(speedbar-directory-button-trim-method (quote trim))
'(speedbar-frame-parameters
(quote
 ((minibuffer)
  (width . 30)
  (border-width . 0)
  (menu-bar-lines . 0)
  (tool-bar-lines . 0)
  (unsplittable . t)
  (left-fringe . 0))))
 '(speedbar-hide-button-brackets-flag nil)
'(speedbar-mode-hook
(lambda nil
  (local-set-key
   (kbd "\\t")
   (quote speedbar-toggle-line-expansion))))
 '(speedbar-show-unknown-files t)
 '(speedbar-smart-directory-expand-flag t)
'(speedbar-supported-extension-expressions
(quote
 (".org" ".[ch]\\(\\+\\+\\|pp\\|c\\|h\\|xx\\)?" ".tex\\(i\\(nfo\\)?\\)?" ".el" ".emacs" ".l" ".lsp" ".p" ".java" ".js" ".f\\(90\\|77\\|or\\)?" ".ada" ".p[lm]" ".tcl" ".m" ".scm" ".pm" ".py" ".g" ".s?html" ".ma?k" "[Mm]akefile\\(\\.in\\)?" ".erl" ".md" ".sh" ".handlebars" ".json" ".ejs" ".scss" ".css" ".lang" ".rb" ".erb" ".builder")))
 '(speedbar-tag-hierarchy-method nil)
 '(speedbar-update-flag nil)
 '(speedbar-use-images nil)
 '(speedbar-visiting-file-hook nil)
 '(sql-connection-alist nil)
 '(sql-database "userdb")
 '(sql-mysql-login-params (quote (user password database server)))
 '(sql-mysql-options (quote ("--unbuffered" "-A")))
 '(sql-mysql-program "/usr/local/bin/mysql")
 '(sql-password "")
 '(synonyms-cache-file "")
 '(synonyms-file "~/.emacs.d/mthesaur.txt")
'(term-bind-key-alist
(quote
 (("C-c C-c" . term-interrupt-subjob)
  ("C-c C-e" . term-send-esc)
  ("C-p" . previous-line)
  ("C-n" . next-line)
  ("C-m" . term-send-return)
  ("C-y" . term-paste)
  ("M-f" . term-send-forward-word)
  ("M-b" . term-send-backward-word)
  ("M-o" . term-send-backspace)
  ("M-p" . term-send-up)
  ("M-n" . term-send-down)
  ("M-M" . term-send-forward-kill-word)
  ("M-N" . term-send-backward-kill-word)
  ("<C-backspace>" . term-send-backward-kill-word)
  ("M-r" . term-send-reverse-search-history)
  ("M-," . term-send-raw)
  ("M-." . comint-dynamic-complete)
  ("C-o" . helm-mini)
  ("M-o" . helm-projectile)
  ("M-<left>" . multi-term-prev)
  ("M-<right>" . multi-term-next)
  ("C-r" . term-send-reverse-search-history))))
 '(term-unbind-key-list (quote ("C-z" "C-x" "C-c" "C-h" "C-y" "<ESC>")))
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B2B2B")
'(vc-annotate-color-map
(quote
 ((20 . "#BC8383")
  (40 . "#CC9393")
  (60 . "#DFAF8F")
  (80 . "#D0BF8F")
  (100 . "#E0CF9F")
  (120 . "#F0DFAF")
  (140 . "#5F7F5F")
  (160 . "#7F9F7F")
  (180 . "#8FB28F")
  (200 . "#9FC59F")
  (220 . "#AFD8AF")
  (240 . "#BFEBBF")
  (260 . "#93E0E3")
  (280 . "#6CA0A3")
  (300 . "#7CB8BB")
  (320 . "#8CD0D3")
  (340 . "#94BFF3")
  (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(wsd-style "napkin")
'(yas-prompt-functions
(quote
 (yas-completing-prompt yas-x-prompt yas-dropdown-prompt yas-ido-prompt yas-no-prompt))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "nil" :slant normal :weight normal :height 130 :width normal))))
 '(compilation-error ((t (:foreground "tomato"))))
 '(compilation-info ((t (:foreground "spring green" :overline nil :underline nil))))
 '(compilation-mode-line-fail ((t (:foreground "tomato" :weight bold))))
 '(compilation-mode-line-run ((t (:foreground "spring green"))))
 '(compilation-warning ((t (:foreground "yellow1"))))
 '(elscreen-tab-other-screen-face ((t (:background "dark gray" :foreground "black"))))
 '(flymake-errline ((t (:underline "tomato"))))
 '(flymake-warnline ((t (:underline "yellow1")))))
