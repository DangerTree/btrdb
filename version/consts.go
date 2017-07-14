package version

import "fmt"

const VersionMajor = 4
const VersionMinor = 4
const VersionSubminor = 13

//Will be set at build time to Major.Minor.Build
var VersionString = fmt.Sprintf("%d.%d.%d", Major, Minor, Subminor)
var BuildDate string
