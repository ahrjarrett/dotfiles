
function! s:ParseRepoName(remoteStr)
  let l:locations = split(split(a:remoteStr)[1], '[:\/]')
  let l:gitPath = join(l:locations[1:2], '@')
  let l:repoName = substitute(l:gitPath, '\(\.git\)', "", "g")
  return l:repoName
endfunction

function! getrepodata#GetRemoteRepo()
  let l:remote = system('git remote -v')
  return s:ParseRepoName(l:remote)
endfunction

function! getrepodata#GetLocalRepo()
  let l:local_repo = system('git rev-parse --show-toplevel')
  return l:local_repo[0:-2]
endfunction

function! getrepodata#GetBranch()
  let l:branch = system('git branch')
  return l:branch[2:-2]
endfunction

