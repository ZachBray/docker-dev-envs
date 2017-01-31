function GetClasspath(...)
  if !eclim#project#util#IsCurrentFileInProject()
    return
  endif

  let project = eclim#project#util#GetCurrentProjectName()
  let command = '-command java_classpath -p "<project>"'
  let command = substitute(command, '<project>', project, '')
  for arg in a:000
    if arg == '\n'
      let arg = "\n"
    endif
    let command .= " \"" . arg . "\""
  endfor
  let result = eclim#Execute(command)
  if result == '0'
    return
  endif
  return result
endfunction

function TestDebug()
  call eclim#util#MakeWithCompiler('eclim_mvn', '', 'install -DskipTests')
  let classpath = GetClasspath()
  let classname = eclim#java#util#GetFullyQualifiedClassname()
	let options = {
    \		'classpath': classpath,
    \		'srcpath': './src/main/java',
    \		'args':[classname]
    \ }
	call vebugger#jdb#start('org.junit.runner.JUnitCore', options)
endfunction

if !exists(":JUnitDebug")
  command JUnitDebug :call TestDebug()
endif
