; Tree-sitter highlights for Althread
; Rule names are aligned with althread.pest where possible.

(inline_comment) @comment
(block_comment) @comment

(str) @string
(int) @number
(float) @number.float
(bool) @boolean
(null) @constant.builtin

[
  "program"
  "main"
  "shared"
  "fn"
  "import"
  "check"
] @keyword

[
  "atomic"
  "while"
  "await"
  "if"
  "else"
  "receive"
  "send"
  "run"
  "for"
  "loop"
  "in"
  "return"
  "break"
  "continue"
  "seq"
  "first"
  "always"
  "eventually"
  "never"
  "exists"
  "label"
  "reaches"
  "until"
] @keyword.control

[
  "let"
  "const"
  "channel"
] @keyword.storage

[
  "as"
] @keyword.operator

[
  "bool"
  "int"
  "float"
  "string"
  "void"
  "proc"
  "list"
  "tuple"
] @type.builtin

(private_directive) @attribute

(identifier) @variable
(object_identifier) @variable

(function_block (identifier) @function)
(program_block (identifier) @type)
(fn_call (object_identifier) @function.call)
(run_call (object_identifier) @function.call)
(send_call (object_identifier) @function.call)

[
  "="
  "+="
  "-="
  "*="
  "/="
  "%="
  "|="
  "=="
  "!="
  "<"
  ">"
  "<="
  ">="
  "&&"
  "||"
  "!"
  "+"
  "-"
  "*"
  "/"
  "%"
  "&"
  "|"
  "<<"
  ">>"
  ".."
  "->"
  "=>"
] @operator

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

[
  "."
  ","
  ";"
  ":"
] @punctuation.delimiter
