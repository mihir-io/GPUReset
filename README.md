GPUReset
========

GPUReset is a small script that runs as Administrator and restarts the
configured GPU device.

This is an early version of the script -- planned enhancements include setting
up the task in Task Scheduler, and being able to invoke that task directly
through this script.

## Why?

On my Lenovo Thinkpad P1 Gen 2 with the Lenovo Thunderbolt dock, I find that
sometimes if I use the machine undocked, then go to dock it and shut the lid,
the things on my external display will show micro-stutters. Apparently this is
a known bug with NVIDIA Optimus, and the workaround is to disable and re-enable
the Intel GPU inside the manager. This tool does that quickly.

## How?

The recommended approach is to set up a task in Task Scheduler so that this can
be run without the UAC prompt, but essentially the usage is:

~~~powershell
GPUReset.ps1 -Gpu ['intel'|'nvidia']"
~~~

You can of course fork this and customize it to your own GPU devices.

I'm still fairly new at shell scripting, and extremely new to Powershell. If
anyone is reading this and has ideas to improve it, feel free to open an issue
or open a pull request!