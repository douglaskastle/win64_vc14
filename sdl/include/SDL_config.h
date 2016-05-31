/*
  Simple DirectMedia Layer
  Copyright (C) 1997-2016 Sam Lantinga <slouken@libsdl.org>

  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
*/

#ifndef _SDL_config_h
#define _SDL_config_h

/**
 *  \file SDL_config.h.in
 *
 *  This is a set of defines to configure the SDL features
 */

/* General platform specific identifiers */
#include "SDL_platform.h"

/* C language features */
/* #undef const */
/* #undef inline */
/* #undef volatile */

/* C datatypes */
/* Define SIZEOF_VOIDP for 64/32 architectures */
#ifdef __LP64__
#define SIZEOF_VOIDP 8
#else
#define SIZEOF_VOIDP 4
#endif

/* #undef HAVE_GCC_ATOMICS */
/* #undef HAVE_GCC_SYNC_LOCK_TEST_AND_SET */

#define HAVE_D3D_H 1
#define HAVE_D3D11_H 1
#define HAVE_DDRAW_H 1
#define HAVE_DSOUND_H 1
#define HAVE_DINPUT_H 1
/* #undef HAVE_XAUDIO2_H */
#define HAVE_XINPUT_H 1
#define HAVE_DXGI_H 1

/* Comment this if you want to build without any C library requirements */
/* #undef HAVE_LIBC */
#if HAVE_LIBC

/* Useful headers */
/* #undef HAVE_ALLOCA_H */
/* #undef HAVE_SYS_TYPES_H */
/* #undef HAVE_STDIO_H */
/* #undef STDC_HEADERS */
/* #undef HAVE_STDLIB_H */
#define HAVE_STDARG_H 1
/* #undef HAVE_MALLOC_H */
/* #undef HAVE_MEMORY_H */
/* #undef HAVE_STRING_H */
/* #undef HAVE_STRINGS_H */
/* #undef HAVE_INTTYPES_H */
/* #undef HAVE_STDINT_H */
/* #undef HAVE_CTYPE_H */
/* #undef HAVE_MATH_H */
/* #undef HAVE_ICONV_H */
/* #undef HAVE_SIGNAL_H */
/* #undef HAVE_ALTIVEC_H */
/* #undef HAVE_PTHREAD_NP_H */
/* #undef HAVE_LIBUDEV_H */
/* #undef HAVE_DBUS_DBUS_H */

/* C library functions */
/* #undef HAVE_MALLOC */
/* #undef HAVE_CALLOC */
/* #undef HAVE_REALLOC */
/* #undef HAVE_FREE */
/* #undef HAVE_ALLOCA */
#ifndef __WIN32__ /* Don't use C runtime versions of these on Windows */
/* #undef HAVE_GETENV */
/* #undef HAVE_SETENV */
/* #undef HAVE_PUTENV */
/* #undef HAVE_UNSETENV */
#endif
/* #undef HAVE_QSORT */
/* #undef HAVE_ABS */
/* #undef HAVE_BCOPY */
/* #undef HAVE_MEMSET */
/* #undef HAVE_MEMCPY */
/* #undef HAVE_MEMMOVE */
/* #undef HAVE_MEMCMP */
/* #undef HAVE_STRLEN */
/* #undef HAVE_STRLCPY */
/* #undef HAVE_STRLCAT */
/* #undef HAVE_STRDUP */
/* #undef HAVE__STRREV */
/* #undef HAVE__STRUPR */
/* #undef HAVE__STRLWR */
/* #undef HAVE_INDEX */
/* #undef HAVE_RINDEX */
/* #undef HAVE_STRCHR */
/* #undef HAVE_STRRCHR */
/* #undef HAVE_STRSTR */
/* #undef HAVE_ITOA */
/* #undef HAVE__LTOA */
/* #undef HAVE__UITOA */
/* #undef HAVE__ULTOA */
/* #undef HAVE_STRTOL */
/* #undef HAVE_STRTOUL */
/* #undef HAVE__I64TOA */
/* #undef HAVE__UI64TOA */
/* #undef HAVE_STRTOLL */
/* #undef HAVE_STRTOULL */
/* #undef HAVE_STRTOD */
/* #undef HAVE_ATOI */
/* #undef HAVE_ATOF */
/* #undef HAVE_STRCMP */
/* #undef HAVE_STRNCMP */
/* #undef HAVE__STRICMP */
/* #undef HAVE_STRCASECMP */
/* #undef HAVE__STRNICMP */
/* #undef HAVE_STRNCASECMP */
/* #undef HAVE_VSSCANF */
/* #undef HAVE_VSNPRINTF */
/* #undef HAVE_M_PI */
/* #undef HAVE_ATAN */
/* #undef HAVE_ATAN2 */
/* #undef HAVE_ACOS */
/* #undef HAVE_ASIN */
/* #undef HAVE_CEIL */
/* #undef HAVE_COPYSIGN */
/* #undef HAVE_COS */
/* #undef HAVE_COSF */
/* #undef HAVE_FABS */
/* #undef HAVE_FLOOR */
/* #undef HAVE_LOG */
/* #undef HAVE_POW */
/* #undef HAVE_SCALBN */
/* #undef HAVE_SIN */
/* #undef HAVE_SINF */
/* #undef HAVE_SQRT */
/* #undef HAVE_SQRTF */
/* #undef HAVE_TAN */
/* #undef HAVE_TANF */
/* #undef HAVE_FSEEKO */
/* #undef HAVE_FSEEKO64 */
/* #undef HAVE_SIGACTION */
/* #undef HAVE_SA_SIGACTION */
/* #undef HAVE_SETJMP */
/* #undef HAVE_NANOSLEEP */
/* #undef HAVE_SYSCONF */
/* #undef HAVE_SYSCTLBYNAME */
/* #undef HAVE_CLOCK_GETTIME */
/* #undef HAVE_GETPAGESIZE */
/* #undef HAVE_MPROTECT */
/* #undef HAVE_ICONV */
/* #undef HAVE_PTHREAD_SETNAME_NP */
/* #undef HAVE_PTHREAD_SET_NAME_NP */
/* #undef HAVE_SEM_TIMEDWAIT */
#elif __WIN32__
#define HAVE_STDARG_H 1
#define HAVE_STDDEF_H 1
#else
/* We may need some replacement for stdarg.h here */
#include <stdarg.h>
#endif /* HAVE_LIBC */

/* SDL internal assertion support */
/* #undef SDL_DEFAULT_ASSERT_LEVEL */

/* Allow disabling of core subsystems */
/* #undef SDL_ATOMIC_DISABLED */
/* #undef SDL_AUDIO_DISABLED */
/* #undef SDL_CPUINFO_DISABLED */
/* #undef SDL_EVENTS_DISABLED */
/* #undef SDL_FILE_DISABLED */
/* #undef SDL_JOYSTICK_DISABLED */
/* #undef SDL_HAPTIC_DISABLED */
/* #undef SDL_LOADSO_DISABLED */
/* #undef SDL_RENDER_DISABLED */
/* #undef SDL_THREADS_DISABLED */
/* #undef SDL_TIMERS_DISABLED */
/* #undef SDL_VIDEO_DISABLED */
/* #undef SDL_POWER_DISABLED */
/* #undef SDL_FILESYSTEM_DISABLED */

/* Enable various audio drivers */
/* #undef SDL_AUDIO_DRIVER_ANDROID */
/* #undef SDL_AUDIO_DRIVER_ALSA */
/* #undef SDL_AUDIO_DRIVER_ALSA_DYNAMIC */
/* #undef SDL_AUDIO_DRIVER_ARTS */
/* #undef SDL_AUDIO_DRIVER_ARTS_DYNAMIC */
/* #undef SDL_AUDIO_DRIVER_PULSEAUDIO */
/* #undef SDL_AUDIO_DRIVER_PULSEAUDIO_DYNAMIC */
/* #undef SDL_AUDIO_DRIVER_HAIKU */
/* #undef SDL_AUDIO_DRIVER_BSD */
/* #undef SDL_AUDIO_DRIVER_COREAUDIO */
#define SDL_AUDIO_DRIVER_DISK 1
#define SDL_AUDIO_DRIVER_DUMMY 1
/* #undef SDL_AUDIO_DRIVER_XAUDIO2 */
#define SDL_AUDIO_DRIVER_DSOUND 1
/* #undef SDL_AUDIO_DRIVER_ESD */
/* #undef SDL_AUDIO_DRIVER_ESD_DYNAMIC */
/* #undef SDL_AUDIO_DRIVER_NAS */
/* #undef SDL_AUDIO_DRIVER_NAS_DYNAMIC */
/* #undef SDL_AUDIO_DRIVER_SNDIO */
/* #undef SDL_AUDIO_DRIVER_SNDIO_DYNAMIC */
/* #undef SDL_AUDIO_DRIVER_OSS */
/* #undef SDL_AUDIO_DRIVER_OSS_SOUNDCARD_H */
/* #undef SDL_AUDIO_DRIVER_PAUDIO */
/* #undef SDL_AUDIO_DRIVER_QSA */
/* #undef SDL_AUDIO_DRIVER_SUNAUDIO */
#define SDL_AUDIO_DRIVER_WINMM 1
/* #undef SDL_AUDIO_DRIVER_FUSIONSOUND */
/* #undef SDL_AUDIO_DRIVER_FUSIONSOUND_DYNAMIC */
/* #undef SDL_AUDIO_DRIVER_EMSCRIPTEN */

/* Enable various input drivers */
/* #undef SDL_INPUT_LINUXEV */
/* #undef SDL_INPUT_LINUXKD */
/* #undef SDL_INPUT_TSLIB */
/* #undef SDL_JOYSTICK_ANDROID */
/* #undef SDL_JOYSTICK_HAIKU */
#define SDL_JOYSTICK_DINPUT 1
#define SDL_JOYSTICK_XINPUT 1
/* #undef SDL_JOYSTICK_DUMMY */
/* #undef SDL_JOYSTICK_IOKIT */
/* #undef SDL_JOYSTICK_MFI */
/* #undef SDL_JOYSTICK_LINUX */
/* #undef SDL_JOYSTICK_WINMM */
/* #undef SDL_JOYSTICK_USBHID */
/* #undef SDL_JOYSTICK_USBHID_MACHINE_JOYSTICK_H */
/* #undef SDL_JOYSTICK_EMSCRIPTEN */
/* #undef SDL_HAPTIC_DUMMY */
/* #undef SDL_HAPTIC_LINUX */
/* #undef SDL_HAPTIC_IOKIT */
#define SDL_HAPTIC_DINPUT 1
#define SDL_HAPTIC_XINPUT 1

/* Enable various shared object loading systems */
/* #undef SDL_LOADSO_HAIKU */
/* #undef SDL_LOADSO_DLOPEN */
/* #undef SDL_LOADSO_DUMMY */
/* #undef SDL_LOADSO_LDG */
#define SDL_LOADSO_WINDOWS 1

/* Enable various threading systems */
/* #undef SDL_THREAD_PTHREAD */
/* #undef SDL_THREAD_PTHREAD_RECURSIVE_MUTEX */
/* #undef SDL_THREAD_PTHREAD_RECURSIVE_MUTEX_NP */
#define SDL_THREAD_WINDOWS 1

/* Enable various timer systems */
/* #undef SDL_TIMER_HAIKU */
/* #undef SDL_TIMER_DUMMY */
/* #undef SDL_TIMER_UNIX */
#define SDL_TIMER_WINDOWS 1
/* #undef SDL_TIMER_WINCE */

/* Enable various video drivers */
/* #undef SDL_VIDEO_DRIVER_ANDROID */
/* #undef SDL_VIDEO_DRIVER_HAIKU */
/* #undef SDL_VIDEO_DRIVER_COCOA */
/* #undef SDL_VIDEO_DRIVER_DIRECTFB */
/* #undef SDL_VIDEO_DRIVER_DIRECTFB_DYNAMIC */
#define SDL_VIDEO_DRIVER_DUMMY 1
#define SDL_VIDEO_DRIVER_WINDOWS 1
/* #undef SDL_VIDEO_DRIVER_WAYLAND */
/* #undef SDL_VIDEO_DRIVER_RPI */
/* #undef SDL_VIDEO_DRIVER_VIVANTE */
/* #undef SDL_VIDEO_DRIVER_VIVANTE_VDK */

/* #undef SDL_VIDEO_DRIVER_WAYLAND_QT_TOUCH */
/* #undef SDL_VIDEO_DRIVER_WAYLAND_DYNAMIC */
/* #undef SDL_VIDEO_DRIVER_WAYLAND_DYNAMIC_EGL */
/* #undef SDL_VIDEO_DRIVER_WAYLAND_DYNAMIC_CURSOR */
/* #undef SDL_VIDEO_DRIVER_WAYLAND_DYNAMIC_XKBCOMMON */

/* #undef SDL_VIDEO_DRIVER_MIR */
/* #undef SDL_VIDEO_DRIVER_MIR_DYNAMIC */
/* #undef SDL_VIDEO_DRIVER_MIR_DYNAMIC_XKBCOMMON */
/* #undef SDL_VIDEO_DRIVER_EMSCRIPTEN */
/* #undef SDL_VIDEO_DRIVER_X11 */
/* #undef SDL_VIDEO_DRIVER_X11_DYNAMIC */
/* #undef SDL_VIDEO_DRIVER_X11_DYNAMIC_XEXT */
/* #undef SDL_VIDEO_DRIVER_X11_DYNAMIC_XCURSOR */
/* #undef SDL_VIDEO_DRIVER_X11_DYNAMIC_XINERAMA */
/* #undef SDL_VIDEO_DRIVER_X11_DYNAMIC_XINPUT2 */
/* #undef SDL_VIDEO_DRIVER_X11_DYNAMIC_XRANDR */
/* #undef SDL_VIDEO_DRIVER_X11_DYNAMIC_XSS */
/* #undef SDL_VIDEO_DRIVER_X11_DYNAMIC_XVIDMODE */
/* #undef SDL_VIDEO_DRIVER_X11_XCURSOR */
/* #undef SDL_VIDEO_DRIVER_X11_XDBE */
/* #undef SDL_VIDEO_DRIVER_X11_XINERAMA */
/* #undef SDL_VIDEO_DRIVER_X11_XINPUT2 */
/* #undef SDL_VIDEO_DRIVER_X11_XINPUT2_SUPPORTS_MULTITOUCH */
/* #undef SDL_VIDEO_DRIVER_X11_XRANDR */
/* #undef SDL_VIDEO_DRIVER_X11_XSCRNSAVER */
/* #undef SDL_VIDEO_DRIVER_X11_XSHAPE */
/* #undef SDL_VIDEO_DRIVER_X11_XVIDMODE */
/* #undef SDL_VIDEO_DRIVER_X11_SUPPORTS_GENERIC_EVENTS */
/* #undef SDL_VIDEO_DRIVER_X11_CONST_PARAM_XEXTADDDISPLAY */
/* #undef SDL_VIDEO_DRIVER_X11_HAS_XKBKEYCODETOKEYSYM */

#define SDL_VIDEO_RENDER_D3D 1
#define SDL_VIDEO_RENDER_D3D11 1
#define SDL_VIDEO_RENDER_OGL 1
/* #undef SDL_VIDEO_RENDER_OGL_ES */
#define SDL_VIDEO_RENDER_OGL_ES2 1
/* #undef SDL_VIDEO_RENDER_DIRECTFB */

/* Enable OpenGL support */
#define SDL_VIDEO_OPENGL 1
/* #undef SDL_VIDEO_OPENGL_ES */
#define SDL_VIDEO_OPENGL_ES2 1
/* #undef SDL_VIDEO_OPENGL_BGL */
/* #undef SDL_VIDEO_OPENGL_CGL */
/* #undef SDL_VIDEO_OPENGL_GLX */
#define SDL_VIDEO_OPENGL_WGL 1
#define SDL_VIDEO_OPENGL_EGL 1
/* #undef SDL_VIDEO_OPENGL_OSMESA */
/* #undef SDL_VIDEO_OPENGL_OSMESA_DYNAMIC */

/* Enable system power support */
/* #undef SDL_POWER_ANDROID */
/* #undef SDL_POWER_LINUX */
#define SDL_POWER_WINDOWS 1
/* #undef SDL_POWER_MACOSX */
/* #undef SDL_POWER_HAIKU */
/* #undef SDL_POWER_EMSCRIPTEN */
/* #undef SDL_POWER_HARDWIRED */

/* Enable system filesystem support */
/* #undef SDL_FILESYSTEM_ANDROID */
/* #undef SDL_FILESYSTEM_HAIKU */
/* #undef SDL_FILESYSTEM_COCOA */
/* #undef SDL_FILESYSTEM_DUMMY */
/* #undef SDL_FILESYSTEM_UNIX */
#define SDL_FILESYSTEM_WINDOWS 1
/* #undef SDL_FILESYSTEM_EMSCRIPTEN */

/* Enable assembly routines */
#define SDL_ASSEMBLY_ROUTINES 1
/* #undef SDL_ALTIVEC_BLITTERS */


/* Platform specific definitions */
#if !defined(__WIN32__)
#  if !defined(_STDINT_H_) && !defined(_STDINT_H) && !defined(HAVE_STDINT_H) && !defined(_HAVE_STDINT_H)
typedef unsigned int size_t;
typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef signed short int16_t;
typedef unsigned short uint16_t;
typedef signed int int32_t;
typedef unsigned int uint32_t;
typedef signed long long int64_t;
typedef unsigned long long uint64_t;
typedef unsigned long uintptr_t;
#  endif /* if (stdint.h isn't available) */
#else /* __WIN32__ */
#  if !defined(_STDINT_H_) && !defined(HAVE_STDINT_H) && !defined(_HAVE_STDINT_H)
#    if defined(__GNUC__) || defined(__DMC__) || defined(__WATCOMC__)
#define HAVE_STDINT_H	1
#    elif defined(_MSC_VER)
typedef signed __int8 int8_t;
typedef unsigned __int8 uint8_t;
typedef signed __int16 int16_t;
typedef unsigned __int16 uint16_t;
typedef signed __int32 int32_t;
typedef unsigned __int32 uint32_t;
typedef signed __int64 int64_t;
typedef unsigned __int64 uint64_t;
#      ifndef _UINTPTR_T_DEFINED
#        ifdef  _WIN64
typedef unsigned __int64 uintptr_t;
#          else
typedef unsigned int uintptr_t;
#        endif
#define _UINTPTR_T_DEFINED
#      endif
/* Older Visual C++ headers don't have the Win64-compatible typedefs... */
#      if ((_MSC_VER <= 1200) && (!defined(DWORD_PTR)))
#define DWORD_PTR DWORD
#      endif
#      if ((_MSC_VER <= 1200) && (!defined(LONG_PTR)))
#define LONG_PTR LONG
#      endif
#    else /* !__GNUC__ && !_MSC_VER */
typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef signed short int16_t;
typedef unsigned short uint16_t;
typedef signed int int32_t;
typedef unsigned int uint32_t;
typedef signed long long int64_t;
typedef unsigned long long uint64_t;
#      ifndef _SIZE_T_DEFINED_
#define _SIZE_T_DEFINED_
typedef unsigned int size_t;
#      endif
typedef unsigned int uintptr_t;
#    endif /* __GNUC__ || _MSC_VER */
#  endif /* !_STDINT_H_ && !HAVE_STDINT_H */
#endif /* __WIN32__ */

#endif /* _SDL_config_h */
