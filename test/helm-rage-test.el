
(ert-deftest helm-rage-test-meme-alist ()
  (should (equal (cons "bitch please" "bitch_please.meme") (assoc "bitch please" (helm-rage-meme-alist)))))
