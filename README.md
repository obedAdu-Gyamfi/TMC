

# Introduction to Version Control

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

## Basic Git Commands.
### Creating a Git Repository
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
First you would have to create a free account with ![https://www.github.com](Github). After creating your free github account, there are two ways to connect your locally initialized git repository to Github. Let's explore these options.

1. Using the **gh CLI Tool**
2. Cloning an empty/existing git repository from your github to your local machine.

# Introduction to Database Management Tools - SQL/PostgreSQL/MySQL



# Introduction to Machine Learning
