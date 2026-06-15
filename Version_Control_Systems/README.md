

# Introduction to Version Control Systems

## Introduction

Version Control is a tool that tracks and manages changes to files over time, keeping a detailed history of modifications.  

There are two type of version control systems.  
- Distributed Version Control System (DVCS): Every collaborator or developer downloads a complete copy of the project, including its full change history.  
Example of DVCSs includes **Git, Mercurial,Darcs, etc.**

- Centralized Version Control Systme (CVCS): All files and version history are stored in a single central server while developers and collaborators commit pull and commit changes directly to this server.  
Example of CVCSs inlcudes **Apache Subversion, Concurrent Version Systems (CVS), etc.**


## Git/Github
Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.  
Created by Linus Torvalds in 2005, it allows multiple developers to work on the same project simultaneously without overwriting each other's changes.  
While git is a local tool that tracks your code history, it is mostly used alongsided **Github**, an online platform that hosts your Git repositories in the cloud.
## Installing Git
#### windows
**Step 1**  
To install git in windows,  
1. Open a browser on your computer.
2. Go to the official website of git [Git](https://git-scm.com/install/windows)
3. Click the **64-bit Git for Windows Setup** link to download the executable (.exe) file.

**Step 2**  
1. Double-click the downloaded .exe file to start the installation.
2. Grant administrative permissions if prompted.
3. Click **Next** to accept the license agreement.


**Step 3**  
- Choose your preferred text editor
- Adjust your PATH environment: **Select** "Git from the command line and also from 3rd-party software". This ensures you're able to run git from the windows command prompt, Powershell, or your text editor.


**Step 4: Verify the Installation**
1. Open the windows command prompt or powershell
2. Type the following commands and press Enter
```{git}

git --version
```
if successful, you should see the installed version number.


**Step 5: Configure your credentials**
```{bash}

git config --global user.name "Your name" 
git config --global user.email "Your email address"
```


#### Linux Systems

Open your terminal enter the commands below:  
```{bash}

sudo apt update
sudo apt upgrade

sudo apt install git
```

run `git --version` to confirm the installation. If successful, the version number would be displayed.

Configure your credentials using the commands below
 ```{bash}
 git config --global user.name "Your name"
 git config --global user.email "Your email address" 
```

### Basic Git Commands.

#### Creating a Git Repository
To create a git repository, you'd have to first initialize the repository. `git init`.

After initializing the repository with Git, you can run a few git commands.

```{git}
git status  
git log  
git --help   
```

`git status` - This command shows the current status of your working directory and staging area.  
`git log` - Displays a chronological list of all permanent commits made to the repository.  
`git --help` - Display a help menu for git commands.  

Before we dive into using other important commands, let's look at how we can connect
 our initialized git repository to github cloud.  
First you would have to create a free account with [Github](https://github.com). After creating your free github account, there are two ways to connect your locally initialized git repository to Github. Let's explore these options.

1. Using the **Github CLI (gh cli) Tool**
2. Cloning an empty/existing git repository from your github to your local machine.

#### Installing gh cli tool

##### Windows OS

To install the **gh cli tool** on a windows computer you can install using:  

- **Using winget (Windows Package Manager)**  
```{powershell}
winget install GitHub.cli
```
- **Using Scoop.**
```{powershell}
scoop install gh cli tool 

```  
After install gh cli tool, you now would have to log on to your github account in the terminal by running `gh auth login`. This command would spawn a login web portal to enter your github credentials.  

After successfully connecting your account to the github cloud, you can now proceed to the next commands below:  

`git add .` - This adds everything in your working directory to the git staging area(index), a middle ground between your local working directory and the permanent project history. It gives you a preview of tracked files and untracked files serving as a draft board to manage your project history.  
`git commit -m "Initial commit"` - This is saves a permenant snapshot of your staged changes. You can always restore your project to this snapshot when ever you run into problems later. The `-m "Initial commit"` is  called a commit message that makes it possible for you to describe the permanent changes you made to you project history.  

After this the next thing to do is to **push** your changes to your github repository on the cloud.  
To do this, you run:  
 
```{git}

gh repo create YOUR_PROJECT_NAME --public --source=. --remote=origin --push
```
Replace **YOUR_PROJECT_NAME** with the name of your project and also change `--public` to `--private` if you do not want your repository to be visible to everyone on github.  

Congratulations!!! You have successfully hosted you first git project on Github.  
You can now repeat the commands below after each modification to your project direcotry to add them to your project history.  

```{git}
git add .
git commit -m "Your commit message"
git push
```
It is also a good practice to add a **README.md** file and a **.gitignore** file to your project. You can later look them up on your own.
also 


