#!/usr/bin/env bash
# CI for this repo, run from its root by .github/workflows/ci.yml:
#   bash ci.sh format sqlfluff
# Optional env (set in the workflow): SETUP
set -uo pipefail
mode=$1; shift
TMP=${RUNNER_TEMP:-$(mktemp -d)}
group() { [ -n "${GITHUB_ACTIONS:-}" ] && echo "::group::$1" || echo "== $1"; }
endgroup() { [ -n "${GITHUB_ACTIONS:-}" ] && echo "::endgroup::" || true; }
fail() { echo "${GITHUB_ACTIONS:+::error::}$1 failed"; status=1; }
status=0
# Python tools and test requirements go into a private venv: works on CI and on machines that block global pip
py() { [ -x "$TMP/venv/bin/python" ] || python3 -m venv "$TMP/venv"; "$TMP/venv/bin/python" "$@"; }
pytool() { [ -x "$TMP/venv/bin/$1" ] || py -m pip install -q "$1==$2"; "$TMP/venv/bin/$1" "${@:3}"; }

if [ -n "${SETUP:-}" ] && [ "$mode" = build ]; then RUNNER_TEMP=$TMP bash -ec "$SETUP" || exit 1; fi

for kind in "$@"; do case "$mode:$kind" in
format:sqlfluff) pytool sqlfluff 4.5.0 lint --config .sqlfluff --rules layout,capitalisation --ignore parsing,lexing . || fail sqlfluff ;;
*) echo "unknown $mode kind: $kind" >&2; exit 2 ;;
esac; done
exit $status
