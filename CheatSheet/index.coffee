refreshFrequency: 3000

command: "python /usr/local/lib/python2.7/site-packages/markdown2.py --extras fenced-code-blocks,tables /Users/paul/Library/Application\\ Support/Notational\\ Data/\`cat /Users/paul/Desktop/CheatSheet/AlfredLauncher.txt\`"

style: """
  top: 5px
  left: 440px
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

  .todolist
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


render: -> """
  <link rel="stylesheet" href="CheatSheet/solarized-dark.css">
  <div class='todolist'></div>
"""

update: (output, domEl) ->
  $(domEl).find('.todolist').html(output)
