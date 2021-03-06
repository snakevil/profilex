# ~/.local/ProfileX/share/prompt/git-branch.sh
#
# AUTHOR     Snakevil Zen <zsnakevil@gmail.com>
# COPYRIGHT  © 2011 Snakevil.in.

'which' git awk > /dev/null && {
  _PROFILEX_GIT_BRANCH=`'git' symbolic-ref HEAD 2> /dev/null \
    | 'awk' -F'/' '{print $3}'`
  [ -z "${_PROFILEX_GIT_BRANCH}" ] && {
    unalias gcd &> /dev/null
    return 0
  }
  _PROFILEX_GIT_ROOT=`'git' rev-parse --show-toplevel 2> /dev/null`
  if [ "${_PROFILEX_GIT_ROOT}" = "${PWD}" ];
  then
    unalias gcd &> /dev/null
  else
    alias gcd="cd '${_PROFILEX_GIT_ROOT}'"
  fi
  _PROFILEX_GIT_BRANCH="|g${CBlue}${_PROFILEX_GIT_BRANCH}"
}

# vim:ft=sh:fenc=utf-8:ff=unix:tw=75:ts=2:sts=2:et:ai:si
# vim:nowrap:sw=2:nu:nuw=4:so=5:fen:fdm=marker
