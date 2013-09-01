config =
  
  validate: (panel, workspace, callback) ->
    result = no
    
    KD.getSingleton("vmController").run "ls example.coffee example.js", (err, res) =>
      result = res is "example.coffee\nexample.js\n"
    
      callback result
  
  onSuccess : ->
    console.log "onSuccess"
  
  onFailed  : (error) ->
    console.log "onFailed"
  
  panel               :
    title             : "CoffeeScript on Terminal"
    hint              : """
      <p>Compile CoffeeScript code on Terminal.</p>
      <ul>
        <li><p>You need to check coffee is already installed on VM. If it's not you can install <code>npm install -g coffee-script</code></p></li>
        <li><p>When you have coffee, create a file with your terminal or finder called <code>example.coffee</code> on your vm root.</p></li>
        <li><p>Open <code>example.coffee</code> and define your name as a variable named <code>person</code></p></li>
        <li><p>When you done, execute the following command on terminal. <code>coffee --watch --compile example.coffee</code></p></li>
      </ul>
    """
    layout            : {
      direction       : "vertical"
      sizes           : [ "25%", null ]
      views           : [
        {
          type        : "finder"
          name        : "finder"
        }
        {
          type        : "split"
          options     :
            direction : "horizontal"
            sizes     : ["50%", null]
          views       : [
            {
              type    : "tabbedEditor"
              name    : "editor"
            }
            {
              type    : "terminal"
              name    : "terminal"
            }
          ]
        }
      ]
    }

