<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">

<style>
.nav{
    border:1px solid #ccc;
    border-width:1px 0;
    list-style:none;
    margin:0;
    padding:0;
    text-align:center;
}
.nav li{
    display:inline-block;
}
.nav a{
    display:inline-block;
    padding:5px;
}
</style>
<ul class="nav">
<li>
<a href="#install">Install</a>
</li>
<li>
<a href="#documentation">Documentation</a>
</li>
<li>
<a href="#example">Example</a>
</li>
<li>
<a href="#citation">Citation</a>
</li>
<li>
<a href="#license">License</a>
</li>
<li>
<a href="https://github.com/nwfsc-timeseries/atsalibrary">GitHub</a>
</li>
</ul>

This package has the data for the University of Washington Fish550
Applied Time Series Analysis
[course](https://atsa-es.github.io/atsa) and [lab
book](https://atsa-es.github.io/atsa-labs).

### INSTALL

To install:

    library(devtools)
    devtools::install_github("atsa-es/atsalibrary")

Windows users:

You may need to turn off warning-error-conversion, because since the R
4.0 update, the tiniest warning stops installation of GitHub hosted
packages.

    Sys.setenv("R_REMOTES_NO_ERRORS_FROM_WARNINGS" = "true")

### EXAMPLE

Type `?` and the dataset name for the help file for each dataset.

``` r
data(package="atsalibrary")
```

### DOCUMENTATION

-   [ATSA lab book](https://atsa-es.github.io/atsa-labs/) - The
    atsalibrary is used in our Applied Time Series Analysis book
    developed from the labs in our course.
-   [ATSA course website](https://atsa-es.github.io/atsa/) - We
    have lectures and all material from our course on our course
    website.

### CITATION

Holmes, E.E., M.D. Scheuerell, and E.J. Ward. ‘atsalibrary’: Applied
Time Series Analysis datasets. Version 1.3.

### LICENSE

atsalibrary was developed by US federal government employees as part of
their official duties. As such, it is not subject to copyright
protection and is considered “public domain” (see 17 USC § 105). Public
domain software can be used by anyone for any purpose, and cannot be
released under a copyright license.
