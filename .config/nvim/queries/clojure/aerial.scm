(list_lit
  ((sym_lit
    name: (sym_name) @keyword.function)
    (#set! "kind" "Method")
    (#any-of? @keyword.function "defn" "defn-" "defflow" "defflow-loopback-false" "deftest" "defspec" "defmacro"))
  (sym_lit) @name) @symbol

