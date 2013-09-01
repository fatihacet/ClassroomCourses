config =
  
  validate: (panel, workspace, callback) ->
    code = panel.getPaneByName("editor").getActivePaneContent()
    code = """
      #{code}
      typeof person is "string"
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
    title          : "Variable Assignment"
    hint           : "<p>Assign your name as a string value to a variable named person.</p>"
    pane           : 
      type         : "tabbedEditor"
      name         : "editor"
