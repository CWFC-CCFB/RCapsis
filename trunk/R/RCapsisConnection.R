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
settingEnv <- new.env()


#' @export
connectToCapsis <- function() {
  if (J4R::isConnectedToJava()) {
    message("R is already connected to Java. The library will be added dynamically. This could have an expected behaviour if the libraries are already in the classpath!")
    capsisPath <- getCapsisPath()
    J4R::addToClassPath(file.path(getCapsisPath(), "class"))
    extensionPath <- file.path(getCapsisPath(), "ext")
    extensionFiles <- dir(extensionPath)
    for (filename in extensionFiles) {
      if (endsWith(filename, ".jar")) {
        J4R::addToClassPath(file.path(extensionPath, filename))
      }
    }
  }
}



#' @export
getCapsisPath <- function() {
  if (!exists("capsisPath", envir = settingEnv, inherits = F)) {
    stop("It seems the path to CAPSIS has not been set. Please use the setCapsisPath function.")
  } else {
    capsisPath <- get("capsisPath", envir = settingEnv, inherits = F)
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
  assign("capsisPath", path, envir = settingEnv, inherits = F)
}


