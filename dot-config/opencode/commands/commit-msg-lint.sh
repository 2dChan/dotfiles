#!/usr/bin/env sh
set -eu

if [ "$#" -ne 1 ]; then
  printf 'Usage: %s <commit-msg-file>\n' "$0" >&2
  exit 2
fi

msg_file="$1"
if [ ! -f "$msg_file" ]; then
  printf 'Error: file not found: %s\n' "$msg_file" >&2
  exit 2
fi

awk '
BEGIN {
  subject_max = 72
  line_max = 100
}

function trim(s) {
  sub(/^[ \t\r]+/, "", s)
  sub(/[ \t\r]+$/, "", s)
  return s
}

function blank(s) {
  return trim(s) == ""
}

function footer(s, t) {
  t = trim(s)
  return (t ~ /^BREAKING CHANGE: .+/) ||
         (t ~ /^[A-Za-z][A-Za-z0-9-]*: .+/) ||
         (t ~ /^[A-Za-z][A-Za-z0-9-]* #[0-9]+$/)
}

{
  line[++n] = $0
}

END {
  if (n == 0 || trim(line[1]) == "") {
    print "Error: empty subject"
    errors++
  }

  subj = trim(line[1])
  if (!(subj ~ /^(feat|fix|docs|style|refactor|perf|test|build|ci|chore|revert)(\([A-Za-z0-9._\/-]+\))?(!)?: .+/)) {
    print "Error: invalid subject format (use Conventional Commits)"
    errors++
  }
  if (length(subj) > subject_max) {
    printf "Error: subject too long (%d > %d)\n", length(subj), subject_max
    errors++
  }

  has_content = 0
  for (i = 2; i <= n; i++) {
    if (!blank(line[i])) {
      has_content = 1
      break
    }
  }
  if (has_content && n >= 2 && !blank(line[2])) {
    print "Error: add blank line after subject"
    errors++
  }

  for (i = 2; i <= n; i++) {
    if (!blank(line[i]) && length(line[i]) > line_max) {
      printf "Error: line %d too long (%d > %d)\n", i, length(line[i]), line_max
      errors++
    }
  }

  footer_start = 0
  i = n
  while (i >= 2 && blank(line[i])) i--
  if (i >= 2 && footer(line[i])) {
    footer_start = i
    i--
    while (i >= 2 && footer(line[i])) {
      footer_start = i
      i--
    }
    if (i >= 2 && !blank(line[i])) {
      print "Error: add blank line before footer"
      errors++
    }
  }

  if (errors > 0) exit 1
  print "OK"
}
' "$msg_file"
