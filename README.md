July 2024 (version 1.92)

Show release notes after an update

Update 1.92.1: The update addresses these issues.

Welcome to the July 2024 release of Visual Studio Code. There are many updates in this version that we hope you'll like, some of the key highlights include:

Default browser - Configure which browser to use for opening links in VS Code.
Revert PRs - Easily create a revert PR for a merged PR.
Extension updates - More easily configure auto updating of extensions.
Override profiles - Override an existing profile with the Profiles Editor.
Paste files in CSS - Quickly add CSS file references with paste or drag and drop.
Move Panel to top - Position the Panel section at the top of the workbench.
Copilot uses GPT-4o - GitHub Copilot Chat upgraded to OpenAI's GPT-4o.
If you'd like to read these release notes online, go to Updates on code.visualstudio.com. Insiders: Want to try new features as soon as possible? You can download the nightly Insiders build and try the latest updates as soon as they are available.

Accessibility
Improved debugging experience
Accessibility help dialogs
We added accessibility help dialogs for the Run and Debug view and Debug Console. You get a hint about opening the accessible help dialog when either view is focused. Configure this hint via the setting   accessibility.verbosity.debug .

Debug Console Accessible View
Run the command Open Accessible View (Shift+Alt+F2) to inspect Debug Console content character by character, line by line.

The setting   debug.autoExpandLazyVariables is now enabled when in Screen Reader Optimized Mode, for ready access to variable values.

When an expression is evaluated in the Debug Console, its value is now announced to screen reader users.

Dynamic watch variable announcement
When debugging with a screen reader enabled, you now hear when watch variable values change. Configure this with   accessibility.debugWatchVariableAnnouncements .

Configure keybindings action
In the previous milestone, we introduced an action to configure unassigned keybindings in the accessibility help dialog. We've now added the Configure Assigned Keybindings command (Alt+A) to complement this action.

Workbench
Move Panel to top
You can now move the Panel to the top of the workbench, above the editor area. By default, the Panel is placed at the bottom and includes views, such as the terminal, Output panel, and Debug Console. This enhancement complements the existing options of positioning the panel to the left, right, and bottom.


Profiles Editor preview
In this milestone, we continued to improve the Profiles Editor by making it more user-friendly and by having a look and feel that's consistent with the Settings Editor.

Profiles Editor showing all user profiles and their settings.

The Profiles Editor is available as an experimental feature behind the   workbench.experimental.enableNewProfilesUI setting. Once enabled, you can access the Profiles Editor from the Settings gear icon in the bottom left corner of the window.

Settings menu showing the Profiles menu item to open the Profiles Editor.

Override existing profile
You can now override an existing profile, including the default profile, by creating a new profile with the same name.


Improved extension update experience
We made several improvements to the extension update experience to give you more control over updating extensions and make it easier to manage auto updating of extensions.

Auto updating all extensions
We have changed the global extension auto update action in the Extension view title area to Enable Auto Update for All Extensions and Disable Auto Update for All Extensions actions. With these actions, you can enable or disable auto update for all extensions at once.

Manage Auto Updating Extensions.

Auto updating individual extensions
We improved the individual extension auto update experience by always showing the action to enable or disable auto update for the extension. This makes it easier to manage auto updating of extensions.

Auto update configuration per extension.

Disable auto update for extensions installed via VSIX
When you install an extension via VSIX, auto update for that extension is disabled by default. This enables you to work with the version of the extension you have installed, without it being updated automatically.

More control over updating extensions
User consent is now required when you update an installed extension version that has no executable code to a version that has executable code. This gives you control to review such updates before they are applied. The following video demonstrates the experience when updating an extension with no code to a version with code.


Selecting the Review button opens the extension change log or the extension repository in the browser. You can review the changes and then decide if you want to update the extension.

Settings Editor jump issue fixed
The Settings Editor used to jump after modifying a setting and changed focus to another one. And this jump was worse the more one scrolled before modifying a setting. We changed the way the Settings Editor re-renders settings after modification, and the Settings Editor no longer jumps after modifying a setting.


Theme: Light Pink (preview on vscode.dev)

URL handling for settings
VS Code can now handle "settings" URLs of the format vscode://settings/setting.name (vscode-insiders://settings/setting.name for Insiders, and code-oss for the OSS version) and will open the Settings Editor to the specified setting. If no setting is given, then the Settings Editor is still opened. When an anchor tag with a settings URL is used in the release notes, and the release notes are open in VS Code, then we do special handling and rendering, as described in the previous codesetting feature.

Setting URL in release notes

Configure the browser to open links
A new setting   workbench.externalBrowser enables you to configure which browser to use for opening links. By default, the operating system standard browser is used. You can configure this setting on a per-workspace level and is also Settings Sync enabled.

Specify the full path to the browser executable as the settings value. Alternatively, to ensure correct functioning across devices, you can also use browser aliases, such as edge, chrome, or firefox.

Configure the browser to open links.

Disable auto file open on drag and drop
Previously, dragging and dropping a file into the explorer would also automatically open it in the editor. In some cases, this might be undesirable. A new setting   explorer.autoOpenDroppedFile enables you to toggle this behavior. By default, the file continues to be opened when dragged and dropped, but when set to false, this behavior is disabled.

Editor
Lightbulb control improvements
At times, the lightbulb control might block code in the editor. To address this, we introduced an improved heuristic for the lightbulb control, which displays the lightbulb in the gutter when there is no space, instead of blocking code in the editor.

Lightbulb overlaps with code (left) versus positioned in the gutter (right).

You can toggle the lightbulb control in the editor with the   editor.lightbulb.enabled setting.

Diff Editor
More compact diffs in Chat
We iterated on the diff editor layout in the Chat view/inline Chat and made it more compact.

Before:

Previous diff editor layout, which is less compact.

After:

More compact diff editor layout.

Source Control
Incoming/Outgoing changes graph
This milestone, we are enabling the visualization of the incoming and outgoing changes using a graph. The graph contains the current branch, the current branch's upstream branch, and an optional base branch. The root of the graph is the common ancestor of these branches.

We have made several improvements to the history item hover:

Enabled multi-select to see changes across multiple history items that belong to the same branch.
Added options to the ... menu to filter history items from the remote/base branches.
Added actions to fetch, pull, and push history items.
Give it a try and let us know what you think!

You can disable the graph visualization of incoming/outgoing changes by toggling the   scm.showHistoryGraph setting.

Source control view showing a graph visualization of the incoming and outgoing changes.

Terminal shell integration
The Source Control view is refreshed after each source control operation as well as file-system events scoped to specific files/folders. When a git command is executed in the integrated terminal, there might be a delay between the completion of the command and refresh of the Source Control view. To reduce this delay, starting this milestone, we are using the terminal shell integration API to detect the successful completion of various git commands (for example, add, checkout, commit, fetch, pull, push, and more) executed in the integrated terminal and refresh the Source Control view.

Notebooks
Multi-cell commenting
The Notebook Editor now supports toggling comments on one or multiple cells at a time. Do this by selecting one or multiple cell containers, followed by the keyboard shortcut Ctrl+/.


Terminal
New scroll bar
The scroll bar in the terminal now looks just like the scroll bar in the editor:

The terminal scroll bar now looks just like the editor's scroll bar

The overview ruler is the same as before, with successful commands on left, find result in middle, failed commands on right. But now it perfectly aligns with the scroll bar slider.

Debug
Show variable types while debugging
VS Code now shows the data types of variables while debugging when the setting   debug.showVariableTypes is turned on:

Show variable data types in the Variables section while debugging.

Languages
Update Markdown links on paste
VS Code can now help you move sections of text between Markdown documents by updating links in any copy and pasted text. With this feature, VS Code fixes all relative path links, reference links, and all images/videos with relative paths, so that they work in the new document.


This feature kicks in whenever you copy and paste text with links between two Markdown files. If there are links that can be updated, you will see the paste widget after pasting. Select Paste and Update Pasted Links, and VS Code fixes up the links for you.

You can disable this feature entirely by setting markdown.updateLinksOnPaste to false.

Paste and drop files in CSS
Do you need to use an image in your CSS? Now you can quickly insert a url() reference just by dragging and dropping, or copy and pasting the image file into the CSS editor:


Remote Development
The Remote Development extensions, enable you to use a Dev Container, remote machine via SSH or Remote Tunnels, or the Windows Subsystem for Linux (WSL) as a full-featured development environment.

Highlights include:

GPG keyboxd support
Local port range configuration
You can learn more about these features in the Remote Development release notes.

Contributions to extensions
GitHub Copilot
GPT-4o Upgrade for Copilot Chat
We've upgraded the Copilot Chat view from GPT-4-Turbo to GPT-4o, OpenAI's most powerful model to date. Our experiments show that GPT-4o significantly enhances Copilot’s coding capabilities, providing faster, more accurate, and higher-quality code and explanations directly in your editor. This was evident during the rollout, as developers increasingly used the Copilot Chat view and incorporated more of its code suggestions.

We are constantly experimenting to identify the best models for different tasks, balancing performance and capability while being committed to quality, safety, and security. For more details on the adoption of GPT-4o in GitHub Copilot, check out GitHub's changelog.

Public code matching in chat
You can allow GitHub Copilot to return code that could match publicly available code on GitHub.com. When this functionality is enabled for your organization subscription or personal subscription, Copilot code completions already provide you with details about the matches that were detected. We are working on enabling showing you these matches for public code in Copilot Chat as well.

We are rolling this out gradually for Copilot Chat users. Once it's enabled for your machine, you might see a message at the end of the response with a View matches link. If you select the link, an editor opens that shows you the details of the matching code references with more details.

Chat code referencing example.

Attachments in chat requests
Copilot Chat supports adding explicit attachments to your chat request via the Attach Context (Ctrl+/) command. These are now rendered as part of submitted chat requests in the chat history. Selecting a file attachment opens the corresponding file and range in the editor.

Attachments in chat requests

Additionally, we now make it clearer when large explicit attachments that overflow the context window were partially or completely omitted from the request.

Warning and hover for large attachments

Improvements to /new
We updated the /new slash command to support quick file generation. You can provide additional context to Copilot during file or project creation by using chat variables, such as #selection. Additionally, /new was enhanced to enable saving the generated files and folders in an existing workspace.

Create a new single file with /new in Copilot Chat.

Access VS Code commands from Chat
A new slash command on the @vscode chat participant, /runCommand, enables you to search for and execute a core VS Code command. For example, to toggle the Developer Tools:

Toggle Developer Tools with the /runCommand slash command in Copilot Chat.

You can enable this new slash command with github.copilot.chat.runCommand.enabled.

Python
Improved Python discovery using python-environment-tools
In the last release, we announced the Python environment tools, which redesigned the Python discovery infrastructure focused on performance. This approach reduces the need for executing python binaries to probe for information and thus improving performance.

Starting in this release, we are rolling out this enhancement as part of an experiment. If you are interested in trying this out, you can set "python.locator" to "native" in your User settings.json and reload your VS Code window. Visit the python-environment-tools repo to learn more about this feature, ongoing work, and provide feedback.

Display execution status for native REPL
The experimental native REPL ("python.REPL.sendToNativeREPL": true) now displays success/failure UI, similar to that in a Jupyter cell, depending on the execution outcome. Furthermore, we made improvements so that we no longer display an empty line on cells that generate no output.

Inline variable values in source code
The Python Debugger extension introduced an Inline Values feature to enhance your Python debugging experience. With Inline Values, you can view the value of variables inline in the editor, next to the corresponding line of code during a debugging session. This helps you to quickly understand the state of your program, without having to hover over variables or checking the Variables section in the Run and Debug view.

Show Python Inline Variables.

To enable this feature, set the configuration value   debugpy.showPythonInlineValues to true in your User settings.

Note: This feature is currently in exploration state and improvements are still being made. Please provide any feedback you may have in the vscode-python-debugger repo!

Improved Debug Welcome view
The Debug Welcome view now includes a button for quick access to automatic Python configurations when a Python file is open in the editor.

GitHub Pull Requests and Issues
There has been more progress on the GitHub Pull Requests extension, which enables you to work on, create, and manage pull requests and issues. New features include:

Revert pull requests by using the Revert button in the pull request description of merged PRs
PRs whose branch has been deleted can now be viewed in the Pull Requests view.
The Open Pull Request on GitHub.com action shows even when you have multiple PRs checked out.
Review the changelog for the 0.94.0 release of the extension to learn about the other highlights.

Extension authoring
Basic authentication for network proxies
Extensions that use the https Node.js module can now use network proxies that require basic authentication.

Preview Features
True inline diffs
This iteration, we introduced the   diffEditor.experimental.useTrueInlineView setting (off by default). When you enable this setting and the inline view is used, single-line changes are rendered inline:

True Inline View in the diff editor.

This is how the inline view looks without this experimental flag turned on:

Default Inline View in the diff editor.

This feature is experimental and future changes are to be expected.

VS Code-native IntelliSense for PowerShell
The VS Code-native PowerShell IntelliSense experimental feature has seen some significant improvements this release. To enable this feature on Windows or macOS:

"terminal.integrated.suggest.enabled": true

In addition to the feature being much more reliable, many other improvements were made as seen below.

Completions are not truncated
Completions now show exactly what is typed, instead of a truncated version. For example, when searching for directory names, the .\ is now included and is highlighted correctly.

Before:

Before the completion for "src" would show "src"

After:

After the completion for "src" would show ".\src"

Optimized completions for navigating directories
Directory names now include a trailing \ or /, which, when completed, refresh completions for the new directory.


Configure Enter behavior
The new terminal.integrated.suggest.runOnEnter setting enables you to configure the Enter behavior to run the command if certain conditions are met. The following values are available:

"always": Always run on Enter.
"exactMatch": Run on Enter when the suggestion is typed in its entirety.
"exactMatchIgnoreExtension" (default): Run on Enter when the suggestion is typed in its entirety or when a file is typed without its extension included.
"never" (old behavior): Never run on Enter.
This change is especially important to not break existing muscle memory as often this will result in the same set of keystrokes as without the feature enabled. An example where this is useful is running cd ... Before this change, you would need to type cd ..<enter><enter> but now it's a single Enter, thanks to this new setting.


Improved file completions
File completions are now sorted by file name length ascending, file name alphabetically, and then by file extension alphabetically. File completions run as commands (not arguments) now also get a boost, depending on their file extension and current operating system. For example, .ps1, .bat, and .cmd files are boosted when running on Windows, which makes them show up higher in the list.

Results are now sorted by extensions with platform-specific boosts

Not only do these changes improve the relevance of the top item, they also help muscle memory by aligning the behavior closer to native PowerShell tab completion. For example, a command commonly run in the VS Code codebase on Windows is ./scripts/code.bat. With these changes, ./sc<tab>/c<enter> completes and runs ./scripts/code.bat.


Global completion caching
Global completions for commands are cached across sessions, which improves shell startup performance significantly. This also fixes an issue where completions would not work correctly for reconnected terminals. Currently, these can be cleared and refreshed by running the Terminal: Clear Suggest Cache command. Measured on an Intel i7-12700KF, this reduced the time taken to activate shell integration from ~600ms to ~50ms.

Built-in terminal completions in PowerShell
We now ship built-in completions for git. These are based on those from the posh-git project but with some general and VS Code-specific improvements. Here's an example of the completions in action:


Some of the other improvements are:

Aliases show their expanded state on the right:

Aliases show their expanded state on the right

Git-specific icons for branches, tags, stashes and remotes:

Branches and tabs have their own icon beside the completions

Subcommand descriptions on the right:

Subcommands like 'checkout' show their description on the right

We also ship built-in completions for code and code-insiders, though these are very basic and will be improved in future releases.

code now shows basic completions for everything in code --help

These completions may conflict with those from other PowerShell modules. You can disable them with the following setting:

"terminal.integrated.suggest.builtinCompletions": {
  "pwshCode": false,
  "pwshGit": false
}

TypeScript 5.6 support
This release includes support for the upcoming TypeScript 5.6 release. Check out the TypeScript 5.6 iteration plan for details on what's in store for this release.

To start using preview builds of TypeScript 5.6, install the TypeScript Nightly extension. Share your feedback and let us know if you run into any bugs with TypeScript 5.6.

Proposed APIs
QuickInputButtonLocation to show buttons to the right of the input
This milestone, we introduced a proposed API on QuickInputButton that enables extensions to choose where they want a button to be rendered. The options are:

Title: This renders the button in the title bar of the quick pick. This is the default behavior and maintains the existing behavior of buttons.
Inline: This renders the button to the right of the input box. This is useful if you aren't planning on using the title bar for anything but want to show buttons.
This functionality was adopted in the Git extension's Create branch input box, which you can enable with   git.branchRandomName.dictionary .

Check out vscode#221397 for more information and updates.

Testing Enhancements
Associate code to tests
We're working on an API that enables an extension to associate code to tests, and vice versa. This lets users jump between both, and enables actions, such as Run Tests at Cursor, to also work in implementation code. We anticipate building more experiences as the API develops.

Check out vscode#126932 for more information and updates.

Call stacks in test failures
We're working on an API that enables associating a rich call stack with unit test failures. This enables users to see, at a glance, what code led up to their failure.

Check out vscode#214488 for more information and updates.

Attributable test coverage
We're working on an API for attributing test coverage on a per-test basis. This enables users to see which tests ran which code, filtering both the coverage shown in the editor, and that in the Test Coverage view.

Check out vscode#212196 for more information and updates.

Search APIs
In the last few months, we have been working on finalizing three proposed Search APIs:

FindTextInFiles: find text in workspace files using VS Code's text search.
FileSearchProvider: provide file search results for custom file schemes that cannot be searched properly with VS Code's existing search functionality. For example, extension-provided results could show up when searching in Quick Open from within a virtual file system.
TextSearchProvider: like FileSearchProvider, but for text search results. For example, extension-provided results could show up when searching in the Search View from within a virtual file system.
In addition, we are revamping the workspace.findFiles API, which uses VS Code's workspace file search to find files. The new version should allow for more options, and should handle exclusion options more clearly. The existing function signature should still be functional when we introduce the revamped version.

This table illustrates how the different APIs are related:

Using API to find	Using API to provide results
For Files	FindFiles	FileSearchProvider
For Text in Files	FindTextInFiles	TextSearchProvider
If you're interested, visit the links above to provide feedback!

Website
We refreshed the design of the VS Code website and added support for light and dark themes.

VS Code website light mode.

The website's new design defaults to your system's theme (light or dark mode), and you can also toggle it manually by using the sun/moon icon in the top right.

VS Code website dark mode.

We look forward to getting your feedback! File any feature requests or bugs in the vscode-docs repo.

Engineering
Move Markdown language server to separate repository
We moved the language server that powers VS Code's built-in Markdown IntelliSense into its own repository. Previously, this project was published from a subfolder of the main VS Code repository. This change makes it easier to contribute to the project.

The project is still published under the same name on npm: vscode-markdown-languageserver.

Progress on using ESM for VS Code
In this milestone, we picked up the work again to adopt ESM for VS Code core. Our goal in the future is to use ECMAScript Modules (ESM) loading and drop AMD entirely. This is a multi-milestone effort that will modernize overall code loading and bundling.

xterm.js depending upon VS Code
The new scroll bar in the terminal required a significant amount of behind-the-scenes work. The terminal in VS Code is built on the xterm.js OSS project, and in its upcoming release will also ship a small portion of VS Code's codebase, specifically part of the base/ folder.

Electron 30 update
In this milestone, we are promoting the Electron 30 update to users on our stable release. This update comes with Chromium 124.0.6367.243 and Node.js 20.14.0. We want to thank everyone who self-hosted on Insiders builds and provided early feedback.

Notice of breaking API change when spawning .bat or .cmd files:

The Node version with this Electron update contains a breaking change, in response to a CVE, which may affect you if you execute .bat or .cmd files on Windows. You can follow the guidelines set by Node.js when spawning these files using the shell option.

We have proactively notified extensions who may be affected based on a simple source code scan, but it's possible we may have missed yours. If you are affected, you will encounter an EINVAL exception when spawning .bat or .cmd files on Windows. Please refer to the Node.js documentation for guidance on how to handle these.

We recommend extension authors to always test their extension with our Insiders release to catch these changes in advance.

Notable fixes
211199 Ctrl+c in terminal does not scroll to the very bottom when smooth scroll is enabled
Thank you
Last but certainly not least, a big Thank You to the contributors of VS Code.

Issue tracking
Contributions to our issue tracking:

@gjsjohnmurray (John Murray)
@IllusionMH (Andrii Dieiev)
@manav014 (Manav Agarwal)
@RedCMD (RedCMD)
@starball5 (starball)
@ArturoDent (ArturoDent)
Pull requests
Contributions to vscode:

@a-stewart (Anthony Stewart): Ensure titlebar is at least as tall as the bounding rect of WCO PR #211440
@aaronchucarroll: Adds support for Github-style fenced math blocks in markdown editor and preview PR #213750
@c-claeys (Cristopher Claeys): Fix exponential runtime in service instantiation PR #218393
@cobey (Cody Beyer): adding js/py lib for tagging PR #219213
@etcadinfinitum (Lee Zee): shellscript: Register .eclass extension as shell-like PR #219631
@gabritto (Gabriela Araujo Britto): [typescript-language-features] Add diagnostics performance telemetry PR #220127
@gjsjohnmurray (John Murray)
Hide Local History commands when "workbench.localHistory.enabled": false PR #212936
Hide Panel Maximize when at top but not center-aligned PR #221549
Implement /spam issue triaging command PR #221940
@hotpxl (Yutian Li): Use the builtin local command in shell integration scripts PR #221772
@jeanp413 (Jean Pierre): Fix port label not applied when forwarding port with vscode.env.asExternalUri PR #220029
@kapodamy (kapodamy): fix: place regex in variables on shellIntegration-bash.sh script PR #221998
@Krzysztof-Cieslak (Krzysztof Cieślak)
Inline edit - implement side by side rendering of suggestions PR #219444
Inline edit - UI fixes for side-by-side rendering PR #221352
Inline edits - UI fixes for word wrap and scrolling PR #223076
@mering (Marcel): Setup rust in Devcontainer PR #221301
@mxts (Teik Seong): add option to dock terminal at top PR #207721
@Parasaran-Python (Parasaran): Fixes #218254 PR #219312
@rehmsen (Ole)
Support comments on notebook markup cells PR #219657
Show the first comment on a notebook cell, for any owner. PR #219926
Update notebook comment view in response to mutations PR #219927
@scop (Ville Skyttä): Fix terminal __vsc_first_prompt errors with bash in nounset mode PR #221980
@SimonSiefke (Simon Siefke)
feature: add setting whether or not to auto open a file after dropping it into the explorer PR #213498
reduce impact of memory leaks related to editor PR #219297
fix: memory leak in extension tabs PR #219726
feature: allow configuring default browser PR #219885
fix: memory leak in SelectBoxList PR #221507
fix: memory leak in settings widget PR #221518
fix: memory leak in StickyScrollFocus PR #221622
@syi0808 (Sung Ye In): fix(terminal): remove fixedRows line in add scrollbar PR #221976
@tisilent (xiejialong)
Add Icons. PR #219816
Window title use execution path. PR #221258
Add revealTerminal and focusInstance in terminalService PR #221684
@wdhongtw (Weida Hong): Reset shell-type context when the type is unknown PR #221277
Contributions to vscode-black-formatter:

@shayhurley (Shay Hurley): Update README.md PR #524
Contributions to vscode-hexeditor:

@tomilho (Tomás Silva): fix: removes duplicate webview/context PR #527
Contributions to vscode-languageserver-node:

@benmcmorran (Ben McMorran): Add supportThemeIcons in MarkdownString PR #1504
Contributions to vscode-markdown-tm-grammar:

@RedCMD (RedCMD): Fix FrontMatter integration PR #162
Contributions to vscode-pull-request-github:

@Santhoshmani1 (Santhosh Mani ): Feature : Add open pr on github from pr description node PR #6020
Contributions to vscode-textmate:

@aleclarson (Alec Larson): feat: add child combinator ">" (and fix a specificity bug) PR #233
Contributions to debug-adapter-protocol:

@dawedawe (dawe): Update overview.md to link to renamed package PR #489
Contributions to language-server-protocol:

@asukaminato0721 (Asuka Minato)
Update servers.md PR #1967
add Sonar PR #1981
@flaribbit (梦飞翔): Update servers.md PR #1968
@PrasangAPrajapati (Prasang A Prajapati): Add implementor for JCL LSP Server PR #1955
@StachuDotNet (Stachu Korick): Clarify deltaLine and deltaStart of SemanticTokens payload PR #1966
Contributions to monaco-editor:

@ScottCarda-MS (Scott Carda): Update Q# Keywords PR #4586
Contributions to node-request-light:

@remcohaszing (Remco Haszing): Add package exports PR #25
Contributions to python-environment-tools:

@cclauss (Christian Clauss): interpreterInfo.py: Create the object in a single operation PR #93
@hamirmahal (Hamir Mahal): style: simplify string formatting PR #88
