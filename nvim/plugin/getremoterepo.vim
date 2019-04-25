function! s:ParseRepoName(remoteStr)
  let l:locations = split(split(a:remoteStr)[1], '[:\/]')
  let l:gitPath = join(l:locations[1:2], '@')
  let l:repoName = substitute(l:gitPath, '\(\.git\)', "", "g")
  echomsg "\n\n\n%{l:reponame}"
  return l:repoName
endfunction

function! getremoterepo#GetRemoteRepo()
  let l:remote = system('git remote -v')
  return s:ParseRepoName(l:remote)
endfunction

