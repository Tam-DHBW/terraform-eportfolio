#!/usr/bin/env bash
# Converts presenterm ```file blocks into actual code blocks for GitHub rendering

input="${1:-slides/demo.md}"
output="${2:-demo-substituted.md}"
input_dir="$(cd "$(dirname "$input")" && pwd)"

cp "$input" "$output"

# Find ```file blocks and replace with file content
awk -v dir="$input_dir" '
/^```file/ {
    in_file_block = 1
    path = ""
    lang = ""
    next
}
in_file_block && /^path:/ {
    path = $2
    next
}
in_file_block && /^language:/ {
    lang = $2
    next
}
in_file_block && /^```$/ {
    in_file_block = 0
    printf "```%s\n", lang
    fullpath = dir "/" path
    cmd = "realpath \"" fullpath "\""
    cmd | getline fullpath
    close(cmd)
    while ((getline line < fullpath) > 0) print line
    close(fullpath)
    print "```"
    next
}
in_file_block { next }
{ print }
' "$output" > "${output}.tmp" && mv "${output}.tmp" "$output"

echo "Generated $output from $input"
