# RCapsis

An R package allowing access to Capsis through J4R

## Introduction

The RCapsis package is a light client that relies on the J4R package to connect to 
a local version of CAPSIS. It provides functions to instantiate a C4Script instances.

## Requirements

Java 8 must be installed. If not, please visit www.java.com/en/download
Ideally, it should be the default Java on the Operating System. Should it 
not be the case, it is then possible to set the path to Java 8 using the 
J4R package. See below.

A CAPSIS release must be installed prior to using this package. This 
release does come with this package. Please visit capsis.cirad.fr or 
reach out to a member of the CAPSIS community to get a proper release.

## License 

The RCapsis package is released under a Lesser General Public License version 3.0 (LGPL 3.0). It comes with absolutely
no warranty with the expectation that it will be useful. The details of the LGPL-3.0 can be found at 
www.gnu.org/licenses/lgpl-3.0.en.html .

## Source code

The source code is available on GitHub at [github.com/CWFC-CCFB/RCapsis](https://github.com/CWFC-CCFB/RCapsis).

## Bug reporting

Any bug or suggestion can be logged as a issue on the project website at [github.com/CWFC-CCFB/RCapsis/issues](https://github.com/CWFC-CCFB/RCapsis/issues).

## How to install the RCapsis package

The RCapsis package depends on the J4R package. To make it work you will have 
to go through the following steps:

1- Install the J4R package by copying this line of code in your R console:
~~~
install.packages("https://sourceforge.net/projects/repiceasource/files/latest", repos = NULL,  type="source")
~~~

2- Then download and install the RCapsis package by copying this line of code in your R console:
~~~
install.packages("https://sourceforge.net/projects/rcapsis.capsisbridge.p/files/latest", repos = NULL,  type="source")
~~~
