# searchGithubAndItunes

Test task.
You need to write an application that outputs the results of a user's text search query. Search using two open APIs:
- Apple Search API (iTunes search results)
- GitHub Search API (Users - search results among users)
Appearance:
The NavigationBar should have a SegmentControl with 2 bookmarks: iTunes & GitHub.
Under the NavigationBar, there should be a SearchBar for entering a test query, which should not
be moved when scrolling the list. The SearchBar must be shared between both bookmarks.
In the iTunes tab:
1. Search results are displayed in iTunes. The cell that displays the search result in iTunes must have an object icon, name, and author.
2. In the odd cell of the icon has to be right and the title and author to the left of the icons and even the icon should be on the left and the title and author to the right of the icons.
In the GitHub tab:
1. Search results are displayed in GitHub. The cell that displays the search result in GitHub must have an avatar, username, and a link to the user's account.
2. In odd-numbered cell icon should be on the left and login link to the right of the icons and even the icon should be on the right and a login and link to the account on the left of the icons.
(even/odd is determined relative to the displayed position, where the element at index 0 is the first cell, i.e. odd)
Functional / Technical requirements:
1. Perform a task on Swift
2. The picture should be loaded asynchronously.
3. Clicking on the icon is animated it must be expanded and displayed on the entire screen. When you click again, the icon should return to its place.
4. Layout can be done completely in code, or using xib and storyboards
5. you Can't use third-party libraries. (exception for layout libraries)
6. If the search did not yield results, we must notify the user of the reason.
7. No need to use RAC/rx.
8. upload The completed task to GitHub, Bitbucket, or GitLab and send the link.

Execution description: the MVC-n architecture was selected. The task was completed without Cocoapods. Layout using xib. All conditions of the task are met.

DEMO<br/>

<img src="https://github.com/aposnov/searchGithubAndItunes/blob/master/Supporting%20files/demo.gif" />
