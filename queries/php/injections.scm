;; extends

(string (string_content) @injection.content
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @injection.content "^%s*[Ss][Ee][Ll][Ee][Cc][Tt]"))
(string (string_content) @injection.content
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @injection.content "^%s*[Uu][Pp][Dd][Aa][Tt][Ee]"))
(string (string_content) @injection.content
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @injection.content "^%s*[Dd][Ee][Ll][Ee][Tt][Ee]"))
(string (string_content) @injection.content
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @injection.content "^%s*[Cc][Rr][Ee][Aa][Tt][Ee]"))
(string (string_content) @injection.content
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @injection.content "^%s*[Ii][Nn][Ss][Ee][Rr][Tt]"))
(string (string_content) @injection.content
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @injection.content "^%s*[Rr][Ee][Pp][Ll][Aa][Cc][Ee]"))
(string (string_content) @injection.content
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @injection.content "^%s*[Dd][Rr][Oo][Pp]"))
(string (string_content) @injection.content
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @injection.content "^%s*[Aa][Ll][Tt][Ee][Rr]"))
(string (string_content) @injection.content
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @injection.content "^%s*[Ee][Xx][Pp][Ll][Ll][Aa][Ii][Nn]"))
(string (string_content) @injection.content
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @injection.content "^%s*[Uu][Pp][Ss][Ee][Rr][Tt]"))
(string (string_content) @injection.content
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @injection.content "^%s*[Ww][Ii][Tt][Hh]"))

(encapsed_string (string_content) @injection.content
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @injection.content "^%s*[Ss][Ee][Ll][Ee][Cc][Tt]"))
(encapsed_string (string_content) @injection.content
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @injection.content "^%s*[Uu][Pp][Dd][Aa][Tt][Ee]"))
(encapsed_string (string_content) @injection.content
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @injection.content "^%s*[Dd][Ee][Ll][Ee][Tt][Ee]"))
(encapsed_string (string_content) @injection.content
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @injection.content "^%s*[Cc][Rr][Ee][Aa][Tt][Ee]"))
(encapsed_string (string_content) @injection.content
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @injection.content "^%s*[Ii][Nn][Ss][Ee][Rr][Tt]"))
(encapsed_string (string_content) @sql
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @sql "^%s*[Rr][Ee][Pp][Ll][Aa][Cc][Ee]"))
(encapsed_string (string_content) @sql
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @sql "^%s*[Dd][Rr][Oo][Pp]"))
(encapsed_string (string_content) @sql
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @sql "^%s*[Aa][Ll][Tt][Ee][Rr]"))
(encapsed_string (string_content) @sql
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @sql "^%s*[Ee][Xx][Pp][Ll][Ll][Aa][Ii][Nn]"))
(encapsed_string (string_content) @sql
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @sql "^%s*[Uu][Pp][Ss][Ee][Rr][Tt]"))
(encapsed_string (string_content) @sql
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @sql "^%s*[Ww][Ii][Tt][Hh]"))

((nowdoc value: (nowdoc_body) @sql)
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @sql "^%s*[Ss][Ee][Ll][Ee][Cc][Tt]"))
((nowdoc value: (nowdoc_body) @sql)
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @sql "^%s*[Uu][Pp][Dd][Aa][Tt][Ee]"))
((nowdoc value: (nowdoc_body) @sql)
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @sql "^%s*[Dd][Ee][Ll][Ee][Tt][Ee]"))
((nowdoc value: (nowdoc_body) @sql)
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @sql "^%s*[Cc][Rr][Ee][Aa][Tt][Ee]"))
((nowdoc value: (nowdoc_body) @sql)
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @sql "^%s*[Ii][Nn][Ss][Ee][Rr][Tt]"))
((nowdoc value: (nowdoc_body) @sql)
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @sql "^%s*[Rr][Ee][Pp][Ll][Aa][Cc][Ee]"))
((nowdoc value: (nowdoc_body) @sql)
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @sql "^%s*[Dd][Rr][Oo][Pp]"))
((nowdoc value: (nowdoc_body) @sql)
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @sql "^%s*[Aa][Ll][Tt][Ee][Rr]"))
((nowdoc value: (nowdoc_body) @sql)
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @sql "^%s*[Ee][Xx][Pp][Ll][Ll][Aa][Ii][Nn]"))
((nowdoc value: (nowdoc_body) @sql)
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @sql "^%s*[Uu][Pp][Ss][Ee][Rr][Tt]"))
((nowdoc value: (nowdoc_body) @sql)
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @sql "^%s*[Ww][Ii][Tt][Hh]"))

((heredoc value: (heredoc_body) @sql)
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @sql "^%s*[Ss][Ee][Ll][Ee][Cc][Tt]"))
((heredoc value: (heredoc_body) @sql)
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @sql "^%s*[Uu][Pp][Dd][Aa][Tt][Ee]"))
((heredoc value: (heredoc_body) @sql)
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @sql "^%s*[Dd][Ee][Ll][Ee][Tt][Ee]"))
((heredoc value: (heredoc_body) @sql)
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @sql "^%s*[Cc][Rr][Ee][Aa][Tt][Ee]"))
((heredoc value: (heredoc_body) @sql)
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @sql "^%s*[Ii][Nn][Ss][Ee][Rr][Tt]"))
((heredoc value: (heredoc_body) @sql)
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @sql "^%s*[Rr][Ee][Pp][Ll][Aa][Cc][Ee]"))
((heredoc value: (heredoc_body) @sql)
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @sql "^%s*[Dd][Rr][Oo][Pp]"))
((heredoc value: (heredoc_body) @sql)
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @sql "^%s*[Aa][Ll][Tt][Ee][Rr]"))
((heredoc value: (heredoc_body) @sql)
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @sql "^%s*[Ee][Xx][Pp][Ll][Ll][Aa][Ii][Nn]"))
((heredoc value: (heredoc_body) @sql)
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @sql "^%s*[Uu][Pp][Ss][Ee][Rr][Tt]"))
((heredoc value: (heredoc_body) @sql)
    (#set! injection.language "sql")
    (#set! injection.include-children)
    (#lua-match? @sql "^%s*[Ww][Ii][Tt][Hh]"))

