# ~/.local/ProfileX/share/prompt/hg-branch.sh
#
# AUTHOR     Snakevil Zen <zsnakevil@gmail.com>
# COPYRIGHT  © 2011 Snakevil.in.

'which' hg > /dev/null && {
  _PROFILEX_HG_BRANCH=`'hg' branch 2> /dev/null`
  [ -z "${_PROFILEX_HG_BRANCH}" ] && {
    unalias hcd &> /dev/null
    return 0
  }
  _PROFILEX_HG_ROOT=`'hg' root 2> /dev/null`
  if [ "${_PROFILEX_HG_ROOT}" = "${PWD}" ]
  then
    unalias hcd &> /dev/null
  else
    alias hcd="cd '${_PROFILEX_HG_ROOT}'"
  fi
  _PROFILEX_HG_BRANCH="|h${CBlue}${_PROFILEX_HG_BRANCH}"
}

# vim:ft=sh:fenc=utf-8:ff=unix:tw=75:ts=2:sts=2:et:ai:si
# vim:nowrap:sw=2:nu:nuw=4:so=5:fen:fdm=marker
