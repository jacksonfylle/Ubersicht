refreshFrequency: 3000

#To convert markdown to html
#python /usr/local/lib/python2.7/site-packages/markdown2.py --extras fenced-code-blocks,tables
#Visit [Extras · trentm/python-markdown2 Wiki](https://github.com/trentm/python-markdown2/wiki/Extras) for more information

#And the path of your file "/Users/name/cheatsheet.txt"
#A Path like "~/Library/Application\ Support/" As to be like "~/Library/Application\\ Support/"

#I'am using a launch app to select wich cheatsheet i want to display in my desktop that's why i've got something like : "~/Library/Application\\ Support/Notational\\ Data/\`cat ~/Desktop/CheatSheet/AlfredLauncher.txt\`"

#Alfred workflow will be add in the repository

#Command exemple : "python /usr/local/lib/python2.7/site-packages/markdown2.py --extras fenced-code-blocks,tables ~/Desktop/cheatsheet.txt"

command: "python /usr/local/lib/python2.7/site-packages/markdown2.py --extras fenced-code-blocks,tables ~/Library/Application\\ Support/Notational\\ Data/\`cat ~/Desktop/CheatSheet/AlfredLauncher.txt\`"

style: """
  top: 5px //adjust to resize
  left: 440px //adjust to resize
  color: #fff
  font-family: Helvetica Neue
  width 670px
  height: 770px
  font-size: 10px
  overflow: auto

  h
    display: block
    text-align: center
    font-size: 24px
    font-weight: 100

  .cheatsheet
    display: block
    text-shadow: 0 0 1px rgba(#000, 0.5)
    font-size: 10px
    background rgba(0,0,0,.50)
    border-radius 5px
    column-count: 2
    word-wrap: break-word

  h1
    margin: 0px
    border-radius 5px 5px 0px 0px
    font-size: 25px
    font-weight: 100
    text-align: center
    column-span: all
    background rgba(203, 75, 22, 0.9)
 
  h2
    margin: 0px
    font-size: 15px
    font-weight: 100
    padding-left: 5px
  
  h3
    font-size: 10px
    font-weight: 90
    padding-left: 5px
 
  li
    padding-left: 5px
    font-size: 10px

  p
    padding-left: 5px

  strong
    color: rgb(60, 160, 189)

  pre
    margin: 5px
    display: block
    border-radius 5px
    border: 1px solid #cb4b16
    background-color: rgba(0, 43, 54, 0.5)

  code
    padding-left: 5px
 
  .completed
    color: #888
    font-weight: regular
    text-decoration:line-through
"""

#select a css for the fenced code blocks
render: -> """
  <link rel="stylesheet" href="CheatSheet/solarized-dark.css"> 
  <div class='cheatsheet'></div>
"""

update: (output, domEl) ->
  $(domEl).find('.cheatsheet').html(output)
