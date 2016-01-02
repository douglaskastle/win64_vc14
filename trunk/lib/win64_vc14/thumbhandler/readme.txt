This is BF code, but is in the libs folder because:

* It has to be dynamic. The build systems aren't set up to create DLLs from source.
* Building requires both the Windows SDK and Visual Studio (for a header file).
* Since the DLL is loaded by Explorer, architecture is strict: the x86 build fails on x64
  Windows. We need to ship both builds in x86 packages, and once again the build systems
  can't handle that.