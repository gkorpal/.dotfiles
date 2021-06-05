# dotfiles

A simpler way to manage your dotfiles following https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles.html

## Setting this method up the first time 

First, let’s create our bare repository placeholder called .dotfiles 

````
mkdir $HOME/.dotfiles
git init --bare $HOME/.dotfiles
````

We will make an alias for running git commands in our .dotfiles repository. Add this alias to your .bashrc or .zshrc. 

````bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
````
How to find your git directory: https://stackoverflow.com/questions/19698901/


Let’s add a remote, and also set status not to show untracked files:

````
dotfiles config --local status.showUntrackedFiles no
dotfiles remote add origin https://github.com/gkorpal/.dotfiles.git
````

HTTPS vs SSH: https://stackoverflow.com/questions/23401652/

misc: http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/

Now, you can easily add the config files you want to be in version control from where they are supposed to be, commit and push. For example, to add vim config files, I’ll do:

````
cd $HOME
dotfiles add .vimrc
dotfiles commit -m "Add .vimrc"
dotfiles push --set-upstream origin master
````

Next, say I made some changes in the master branch of this git repo, then before adding another file, I will run:

````
dotfiles pull origin master
````
Note that all these new files will appear in your $HOME folder.

Then after username/password you will be asked to save a comment about this merge. For password: Settings > Developer settings > Personal access tokens 

Now, if I want to add bash config files, then:

````
cd $HOME
dotfiles add .bashrc
dotfiles commit -m "Add .bashrc"
dotfiles push origin master
````

## Setting Up a New Machine

To set up a new machine to use your version controlled config files, all you need to do is to clone the repository on your new machine telling git that it is a bare repository:

````
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/gkorpal/.dotfiles.git ~
````

However, some programs create default config files, so this might fail if git finds an existing config file in your $HOME. In that case, a simple solution is to clone to a temporary directory, and then delete it once you are done:

````
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/gkorpal/.dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles
````

