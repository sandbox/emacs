(require 'tramp)


;; Example .dirs-locals.el configuration

;; ((nil . ((compile-command .  "cd ~/src/swproxy && script/local/yarn run test ")
;;          (indent-tabs-mode . nil)))
;;  (c-mode . ((indent-tabs-mode . nil)))
;;  (web-mode . ((indent-tabs-mode . nil)))
;;  (magit-mode
;;   . ((eval . (magit-disable-section-inserter 'magit-insert-tags-header)))))
;;
;; ((nil . ((eval . (set (make-local-variable 'dirs-locals-root-project-path)
;;                       (locate-dominating-file default-directory ".dir-locals.el")))
;;          (eval . (set (make-local-variable 'swproxy-server-test-command)
;;                       (concat "cd " dirs-locals-root-project-path " && script/local/yarn run test ")))
;;          (eval . (set (make-local-variable 'abacus-worker-test-command)
;;                       (concat "cd " dirs-locals-root-project-path "statwing-abacus-worker && script/local/test -w ./ -c ./setup.cfg ")))
;;          (eval . (set (make-local-variable 'statwing-etl-test-command)
;;                       (concat "cd " dirs-locals-root-project-path " && docker exec -it statwing-etl-devrunner script/test")))
;;          (indent-tabs-mode . nil)))
;;  (c-mode . ((indent-tabs-mode . nil)))
;;  (web-mode . ((indent-tabs-mode . nil)))
;;  (magit-mode . ((eval . (magit-disable-section-inserter 'magit-insert-tags-header))))
;;  ("__fixtures__/pipelines" .
;;   ((nil . ((compile-command . (concat
;;                                "cd " dirs-locals-root-project-path "statwing-abacus-worker && PIPELINE="
;;                                (file-name-nondirectory (shell-quote-argument buffer-file-name))
;;                                " SWPROXY_TESTS_UPDATE=false script/local/test -w ./ -c ./setup.cfg tests/abacus/analysis/tests.py:test_analysis_messages"))))))
;;  ("src/server" .
;;   ((nil . ((compile-command . swproxy-server-test-command)))))
;;  ("test/server" .
;;   ((nil . ((compile-command . swproxy-server-test-command)))))
;;  ("statwing-etl" .
;;   ((nil . ((compile-command . statwing-etl-test-command)))))
;;  ("statwing-abacus-worker" .
;;   ((nil . ((compile-command . abacus-worker-test-command))))))
