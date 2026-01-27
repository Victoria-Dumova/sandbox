> A cmdlet is a PowerShell-native command.
> In PowerShell, many familiar Unix command names (ls, cp, rmdir) are aliases for PowerShell cmdlets
> (e.g. ls → Get-ChildItem).

> Path separator:
> - Unix shells: `/`
> - PowerShell (Windows): `\`

## Unix shells (bash, zsh)

grep -i "severe" path/to/idea.log              # search string
ls path/to/folder                              # list directory
find /path/to/search -name "*partofname*"      # find by name
cp path/to/file path/to/copy                   # copy file
cp -v path/to/file path/to/copy                # copy, verbose
rmdir path/to/dir                              # remove empty dir
nano -l path/to/idea.log                       # open with line numbers
tail -n 10 path/to/file                        # show last 10 lines


## PowerShell

Select-String "severe" "C:\path\to\idea.log"                    # search string
ls "C:\path\to\folder"                                          # list directory (alias)
ls "C:\path\to\folder" -Recurse                                 # list recursively (alias)
ls "C:\path\to\folder" -Filter "*partofname*" -Recurse -File    # find by partial name (alias)
Get-ChildItem "C:\path" -Filter "*partofname*" -Recurse -File   # find by partial name (cmdlet)

rmdir ".\spring-petclinic\pupupu" -Recurse -Confirm             # remove directory (alias)
Remove-Item ".\spring-petclinic\pupupu" -Recurse -Confirm       # remove directory (cmdlet)

cp "C:\path\to\file" "C:\path\to\copy"                          # copy file (alias)
cp "C:\path\to\file" "C:\path\to\copy" -Verbose                 # copy, verbose (alias)
Copy-Item "C:\path\to\file" "C:\path\to\copy"                   # copy file (cmdlet)
Copy-Item "C:\path\to\file" "C:\path\to\copy" -Verbose          # copy, verbose (cmdlet)

nano -l "C:\path\to\idea.log"                                   # open file (if installed)
gc "C:\path\to\file" -Tail 10                                   # show last 10 lines (alias)
Get-Content "C:\path\to\file" -Tail 10                          # show last 10 lines (cmdlet)


## Cross-platform CLI tools (same behavior everywhere)

git branch -d branchname                       # delete branch
git branch -D branchname                       # force delete
git merge --squash branchname                  # merge branchname into the current branch, combine all commits
git commit --amend                             # edit last commit