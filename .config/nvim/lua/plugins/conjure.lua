return {
  "Olical/conjure",
  config = function()
    vim.g["conjure#client#clojure#nrepl#test#current_form_names"] = { "deftest", "defspec", "defflow",
      "defflow-loopback-false" }
  end
}
