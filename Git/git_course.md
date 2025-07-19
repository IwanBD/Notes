# Git Course

## Check the version
```bash
git --version
```

## Basic Configurations
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## Show Configurations
```bash
git config --list
```
To see where that setting is defined (global, user, repo, etc.):
```bash
git config --list --show-origin
```

## Create a new repository
```bash
git init
```

**Configure the name of the default branch:**
```bash
git config --global init.defaultBranch main
```

## Track files
```bash
git add *              # add all files and objects of the current directory
git add file_name      # add specific file
git add .              # add all files in current directory (recommended over *)
git add -A             # add all files including deleted ones
```

## Check status
```bash
git status
git status -s          # short format
```

## Commit
```bash
git commit -m "commit message"
git commit -am "message"    # add and commit tracked files in one command
git commit --amend          # modify the last commit
```

## History
```bash
git log
git log --oneline           # compact view
git log --graph             # visual representation
git log --author="name"     # filter by author
git log -n 5                # show last 5 commits
git log --since="2023-01-01"
```

## Create a branch
```bash
git branch new_branch                    # create branch based on current branch
git checkout -b new_branch               # create and switch to new branch
git checkout -b new_branch source_branch # create branch from specific source
git switch -c new_branch                 # modern alternative to checkout -b
```

## Change the branch
```bash
git checkout branch_name
git switch branch_name      # modern alternative to checkout
```

## List branches
```bash
git branch              # list local branches
git branch -a           # list all branches (local and remote)
git branch -r           # list remote branches
git branch -v           # list with last commit info
```

## Roll back
The HEAD refers to a cursor pointing to a commit. By default, it points to the last one.

```bash
git checkout commit_hash        # Go to specific commit (detached HEAD state)
git checkout main              # return to main branch
git checkout HEAD~1            # go back 1 commit
git checkout HEAD~3            # go back 3 commits
```

## Add origin
```bash
git remote add origin https://github.com/username/repository.git
git remote -v                  # show remote repositories
git remote remove origin       # remove remote
```

## Push to the origin
```bash
git push -u origin main        # first push with upstream tracking
git push                       # subsequent pushes
git push origin branch_name    # push specific branch
```

## Push a new branch
```bash
git push --set-upstream origin branch_name    # necessary for first time
git push -u origin branch_name                # shorthand version
```

## Fetch changes from a remote repo
```bash
git pull                       # fetch and merge from tracked remote branch
git pull origin main           # pull from specific remote and branch
git fetch                      # download changes without merging
git fetch origin               # fetch from specific remote
```

## Pull Request
Share your changes with other members of the team so that, when merged, the new code becomes part of the `main branch`. This is typically done through:
- GitHub: Create Pull Request
- GitLab: Create Merge Request
- Bitbucket: Create Pull Request

**Steps:**
1. Push your feature branch to remote
2. Create pull request through web interface
3. Add reviewers and description
4. Address feedback and make changes
5. Merge when approved

## Merge
```bash
git checkout main              # switch to target branch
git merge feature_branch       # merge feature branch into main
git merge --no-ff branch_name  # create merge commit even for fast-forward
git merge --squash branch_name # squash all commits into one
```

## Merge Conflicts
When Git cannot automatically merge changes, you'll need to resolve conflicts manually.

**Steps to resolve:**
1. Git will mark conflicted files
2. Open files and look for conflict markers:
   ```
   <<<<<<< HEAD
   Current branch content
   =======
   Incoming branch content
   >>>>>>> branch_name
   ```
3. Edit the file to resolve conflicts
4. Remove conflict markers
5. Add resolved files: `git add resolved_file`
6. Complete the merge: `git commit`

**Useful commands:**
```bash
git status                     # see conflicted files
git diff                       # see differences
git mergetool                  # use visual merge tool
git merge --abort              # abort merge and return to pre-merge state
```

## Best Practices

### Commit Messages
- Use present tense: "Add feature" not "Added feature"
- Keep first line under 50 characters
- Use imperative mood: "Fix bug" not "Fixes bug"
- Be descriptive but concise

### Branching Strategy
- Use feature branches for new features
- Keep main/master branch stable
- Use descriptive branch names: `feature/user-authentication`
- Delete branches after merging

### General Guidelines
- Commit frequently with small, logical changes
- Pull before pushing to avoid conflicts
- Review code before committing
- Use `.gitignore` to exclude unnecessary files
- Write meaningful commit messages
- Test before committing

## Git Stash
Temporarily store uncommitted changes without committing them.

```bash
git stash                      # stash current changes
git stash push -m "message"    # stash with message
git stash list                 # list all stashes
git stash pop                  # apply and remove most recent stash
git stash apply                # apply stash without removing it
git stash apply stash@{2}      # apply specific stash
git stash drop                 # delete most recent stash
git stash drop stash@{2}       # delete specific stash
git stash clear                # delete all stashes
git stash show                 # show stash diff
```

## Git Reset
Different ways to undo changes:

```bash
git reset --soft commit_hash   # Move HEAD to commit, keep changes staged
git reset commit_hash          # Move HEAD to commit, unstage changes (default --mixed)
git reset --hard commit_hash   # Move HEAD to commit, discard all changes
git reset HEAD~1               # Undo last commit, keep changes
git reset --hard HEAD~1        # Undo last commit, discard changes
```

**Use cases:**
- `--soft`: Undo commits but keep changes staged
- `--mixed` (default): Undo commits and unstage changes
- `--hard`: Completely remove commits and changes

## Git Revert
Create new commits that undo previous commits (safer than reset for shared repositories):

```bash
git revert commit_hash         # create new commit that undoes specified commit
git revert HEAD                # revert last commit
git revert HEAD~3..HEAD        # revert last 3 commits
git revert --no-commit commit_hash  # revert but don't auto-commit
```

**Key differences:**
- `revert`: Creates new commits, safe for shared repositories
- `reset`: Modifies history, dangerous for shared repositories

## Additional Useful Commands

### File Operations
```bash
git rm file_name               # remove file from repo and working directory
git rm --cached file_name      # remove from repo but keep in working directory
git mv old_name new_name       # rename/move file
```

### Viewing Changes
```bash
git diff                       # show unstaged changes
git diff --staged              # show staged changes
git diff branch1..branch2      # compare branches
git show commit_hash           # show specific commit details
```

### Undoing Changes
```bash
git checkout -- file_name      # discard changes in working directory
git restore file_name          # modern alternative to checkout --
git restore --staged file_name # unstage file
git clean -f                   # remove untracked files
git clean -fd                  # remove untracked files and directories
```

### Tags
```bash
git tag                        # list tags
git tag v1.0.0                 # create lightweight tag
git tag -a v1.0.0 -m "message" # create annotated tag
git push origin v1.0.0         # push specific tag
git push origin --tags         # push all tags
```