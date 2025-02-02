#include <functionsahkshouldfuckinghave>
class includer {
	init(pathToFolder) {
		this.list := {}
		this.file := pathToFolder "/_includer.ahk"
		FileRead extensionlist, % this.file

		checklist := ""
		Loop Files, %pathToFolder%/*.ahk, FR
		{
			if (SubStr(A_LoopFileName, 1, 1) = "_" || SubStr(getLast(A_LoopFileDir), 1, 1) = "_") {
				continue
			}

			match := regex(A_LoopFileName, "^(?<name>\w+)\.ahk$")
			if !match.name {
				throw Exception("Error on command name: " A_LoopFileName, -1)
			}

			name := match.name
			checklist .= "#include *i " A_LoopFilePath "`n"
			this.list[A_LoopFileName] := {name: name, folder: A_LoopFileDir, path: A_LoopFilePath}
		}
		if (extensionlist != checklist) {
			file := FileOpen(this.file, "w")
			file.write(checklist)
			file.close()
			this.restart()
		}
	}

	restart() {
		;; Dont start outside of a debugger
		if !A_DebuggerName {
			Reload(Array2String(A_Args))
		}
		ExitApp 69
	}
}