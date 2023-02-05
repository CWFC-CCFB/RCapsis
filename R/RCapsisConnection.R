########################################################
# R functions for connection to CAPSIS
# Author: Mathieu Fortin, Canadian Wood Fibre Centre
# Date: June 2021
########################################################



#'
#' The settings environment for this package
#'
#' This environment contains the general settings of the package.
#'
#' @export
rcapsisSettingEnv <- new.env()


#' @export
connectToCapsis <- function(memorySize = NULL) {
  if (J4R::isConnectedToJava()) {
    if (.checkClassPath()) {
      message("R is already connected to CAPSIS.")
    } else {
      message("It seems R is already connected to Java, but the CAPSIS extensions have not been loaded.")
      message("You should first disconnect using the J4R::shutdownClient() function.")
      stop("CAPSIS is not part of the classpath.")
    }
  } else {
    classPath <- c(file.path(getCapsisPath(),"class"), file.path(getCapsisPath(), "ext/*"))
    J4R::connectToJava(memorySize = memorySize, extensionPath = classPath)
  }
}

.checkClassPath <- function() {
  return (J4R::checkIfClasspathContains("biosimclient") &
            J4R::checkIfClasspathContains("repicea") &
            J4R::checkIfClasspathContains("lerfobforesttools") &
            J4R::checkIfClasspathContains("jeeb-util"))
}


#' @export
getCapsisPath <- function() {
  if (!exists("capsisPath", envir = rcapsisSettingEnv, inherits = F)) {
    stop("It seems the path to CAPSIS has not been set. Please use the setCapsisPath function.")
  } else {
    capsisPath <- get("capsisPath", envir = rcapsisSettingEnv, inherits = F)
    if (!dir.exists(capsisPath)) {
      stop("It seems the path to CAPSIS does not exist or is not a directory. Please use the setCapsisPath function to set the correct path to your local distribution of the CAPSIS platform.")
    }
    return(capsisPath)
  }
}


#'
#' Set the path to the Capsis Platform
#'
#' @param path the complete path to Capsis as in the example below. The file.path function should be used to
#' define the path
#'
#' @seealso file.path
#'
#' @examples
#' myPath <- file.path("C:","MyFolder","Capsis")
#' # setCapsisPath(myPath)  ### not run
#'
#' @export
setCapsisPath <- function(path) {
  if (is.null(path)) {
    stop("The path argument cannot be null!")
  } else if (!dir.exists(path)) {
    stop("The path argument does not point to a directory!")
  }
  assign("capsisPath", path, envir = rcapsisSettingEnv, inherits = F)
}


#'
#' Create an instance of C4Script for a particular model
#'
#' @param  modelName the anme of the model (e.g. artemis)
#'
#' @export
createC4ScriptInstance <- function(modelName) {
  myScript <- J4R::createJavaObject("capsis.app.C4Script", modelName)
  return(myScript)
}


#'
#' Shut down CAPSIS if there is a connection.
#'
#' It calls the shutdownClient function in J4R.
#'
#' @export
shutdownCapsis <- function() {
  if (J4R::isConnectedToJava() & .checkClassPath()) {
    J4R::shutdownClient()
  }
}
