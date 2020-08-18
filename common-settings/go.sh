# The GOGC variable sets the initial garbage collection target percentage.
# A collection is triggered when the ratio of freshly allocated data to live
# data remaining after the previous collection reaches this percentage.
# The default is GOGC=100. Setting GOGC=off disables the garbage collector
# entirely
#
readonly GO_GOGC=40

# The GOMAXPROCS variable limits the number of operating system threads
# that can execute user-level Go code simultaneously. There is no limit
# to the number of threads that can be blocked in system calls on behalf
# of Go code; those do not count against the GOMAXPROCS limit
#
readonly GO_GOMAXPROCS=2
