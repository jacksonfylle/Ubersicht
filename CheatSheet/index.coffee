refreshFrequency: 3000

#   To use this widget you you need python-markdown2
#   • Visit [Extras · trentm/python-markdown2 Wiki](https://github.com/trentm/python-markdown2/wiki/Extras) for more information
#
#   The path of your  Markdown file "/Users/name/cheatsheet.txt"
#    • A Path like "/Users/paul/Library/Application\ Support/" As to be like "/Users/paul/Library/Application\\ Support/"
#
#   There is three mode
#   Normal Mode :
#   You only have to specify the path of your markdown file to preview. Use this command and change the path of your file
#   Command: "python /usr/local/lib/python2.7/site-packages/markdown2.py --extras fenced-code-blocks,tables ~/Desktop/your-file.md"
#
#   Selector Mode
#   this mode select the file to preview by buttons on top of your screen
#   Suppose you have a folder with 5 markdown file, on the top of your screen there will be 5 button with the name of your files
#   When you clikc on one of them a command will write the name of the selected markdown file in a txt file (selectorFile.txt)
#   And the default Ubersicht Command will display the file in the selectorFile.txt
#   You have to set the path of your selectorFile.txt and the path of your folder who contain the markdown file (~/Library/Application\\ Support/Notational\\ Data/) for exemple
#   command: "python /usr/local/lib/python2.7/site-packages/markdown2.py --extras fenced-code-blocks,tables ~/Library/Application\\ Support/Notational\\ Data/\`cat /Users/paul/Desktop/Pro/Configuration/selectorFile.txt\`"
#   You also have to change the path of your folder in the script button.sh
#
#   Laucher Mode
#   Same as selector mode but the name of the file to preview is writing with a launcher like "Alfred"
#   The workflow is in the repo. (you have to set the path of the selectorFile.txt)
#   command: "python /usr/local/lib/python2.7/site-packages/markdown2.py --extras fenced-code-blocks,tables ~/Library/Application\\ Support/Notational\\ Data/\`cat /Users/paul/Desktop/Pro/Configuration/selectorFile.txt\`"

#   For testing you can use this command :
#   command: "echo \"#hello World \n Yo  \" | python /usr/local/lib/python2.7/site-packages/markdown2.py"

#   Normal Mode:
#Command: "python /usr/local/lib/python2.7/site-packages/markdown2.py --extras fenced-code-blocks,tables ~/Desktop/your-file.md"
#   Selector mode and Launcher Mode:
# command: "python /usr/local/lib/python2.7/site-packages/markdown2.py --extras fenced-code-blocks,tables /Users/paul/Library/Application\\ Support/Notational\\ Data/\`cat /Users/paul/Desktop/Pro/Configuration/selectorFile.txt\`"
#   Test mode:
command: "echo \"#hello World \n Yo  \" | python /usr/local/lib/python2.7/site-packages/markdown2.py"

#   By default the selector mode is enable. Comment specified line below to disable.

style: """
  top: 5px //adjust to resize
  right: 5px
  color: #fff
  font-family: Helvetica Neue
  width 835px
  height: 770px
  font-size: 10px
  overflow: auto

  .selector
    display: block
    text-shadow: 0 0 1px rgba(#000, 0.5)
    font-size: 10px
    background rgba(0,0,0,.80)
    border-radius 5px
    word-wrap: break-word

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
    column-count: 3
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
  <div class='selector'></div>
  <div class='cheatsheet'></div>
"""

########### 1.A Comment if you don't want to use selector ###########
afterRender: (domEl) ->                                             #
  @run("~/Desktop/Temp/Launcher/button.sh", (err, output) ->        #
      $(domEl).find('.selector').html(output)                       #
    )                                                               #
############################## 1.A ##################################

update: (output, domEl) ->
  $(domEl).find('.cheatsheet').html(output)

########### 1.B Comment if you don't want to use selector ###########################################################################
  $(domEl).find('button').on 'click', => @run "echo " + event.target.id + " > ~/Desktop/Pro/Configuration/selectorFile.txt"       #
############################## 1.B ##################################################################################################
