
# require(J4R)
# connectToJava()
# myArray <- createJavaObject("java.util.ArrayList")
# myArray$size()

require(RCapsis)

myPath <- file.path("C:","Users", "matforti", "Documents", "7_Developpement", "JavaProjects", "capsis")
dir.exists(myPath)
setCapsisPath(myPath)
getCapsisPath()

connectToCapsis()
# myArray$size()
# J4R::getClassLoaderPaths()
# myEmptyArray <- J4R::as.JavaArray("")
# callJavaMethod("capsis.app.Starter", "main", myEmptyArray)
myScript <- createC4ScriptInstance("artemis")
shutdownCapsis()
