require(RCapsis)

java8path <- file.path("C:", "Program Files", "Java", "jdk1.8.0_321", "jre", "bin", "java.exe")
setJavaPath(java8path)

myCapsisPath <- file.path("C:","Users", "matforti", "Documents", "7_Developpement", "JavaProjects", "capsis")
dir.exists(myCapsisPath)
setCapsisPath(myCapsisPath)
getCapsisPath()

connectToCapsis()
myScript <- createC4ScriptInstance("artemis")


shutdownCapsis()
