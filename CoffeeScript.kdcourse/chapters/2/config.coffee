config =
  
  validate: (panel, workspace, callback) ->
    code = panel.getPaneByName("editor").getActivePaneContent()
    code = """
      #{code}
      typeof greet is "function"
    """
    
    result = no
    try
      KD.utils.compileCoffeeOnClient code, (res) ->
        result = res

    callback result
  
  onSuccess : ->
    console.log "onSuccess"
  
  onFailed  : (error) ->
    console.log "onFailed"
  
  panel            :
    title          : "Functions"
    hint           : "<p>Define a function named greet that takes no argument and logs 'Hello CoffeeScript'</p>"
    pane           : 
      type         : "tabbedEditor"
      name         : "editor"