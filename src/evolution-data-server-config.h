/* evolution-data-server-config.h generated by CMake */

/* Name of the package */
#define PACKAGE "evolution-data-server"

/* Define to the address where bug reports for this package should be sent. */
#define PACKAGE_BUGREPORT "https://gitlab.gnome.org/GNOME/evolution-data-server/issues/"

/* Version number of the project */
#define VERSION "3.38.1"

/* API version (Major.Minor) */
#define API_VERSION "1.2"

/* Base version (Major.Minor) */
#define BASE_VERSION "3.38"

/* Package name for gettext */
#define GETTEXT_PACKAGE "evolution-data-server"

/* Defined to prefix used by the D-Bus services (usually when run in Flatpak) */
/* #undef DBUS_SERVICES_PREFIX */

/* D-Bus service name for the address book factory */
#define ADDRESS_BOOK_DBUS_SERVICE_NAME "org.gnome.evolution.dataserver.AddressBook10"

/* D-Bus service name for the calendar factory */
#define CALENDAR_DBUS_SERVICE_NAME "org.gnome.evolution.dataserver.Calendar8"

/* D-Bus service name for the source registry */
#define SOURCES_DBUS_SERVICE_NAME "org.gnome.evolution.dataserver.Sources5"

/* D-Bus service name for the user prompter */
#define USER_PROMPTER_DBUS_SERVICE_NAME "org.gnome.evolution.dataserver.UserPrompter0"

/* Define Google OAuth 2.0 Client ID to use */
#define GOOGLE_CLIENT_ID "590402290962-2i0b7rqma8b9nmtfrcp7fa06g6cf7g74.apps.googleusercontent.com"

/* Define Google OAuth 2.0 Client Secret to use */
#define GOOGLE_CLIENT_SECRET "mtfUe5W8Aal9DcgVipOY1T9G"

/* Define Outlook.com OAuth 2.0 Client ID to use */
#define OUTLOOK_CLIENT_ID "cc6e0693-0e26-4220-8322-9d363e308fc6"

/* Define Outlook.com OAuth 2.0 Client Secret to use */
#define OUTLOOK_CLIENT_SECRET ""

/* Path to a sendmail binary, or equivalent */
#define SENDMAIL_PATH "/usr/sbin/sendmail"

/* Configured with enabled maintainer mode */
/* #undef ENABLE_MAINTAINER_MODE */

/* Define to 1 if you have <sys/wait.h> that is POSIX.1 compatible. */
#define HAVE_SYS_WAIT_H 1

/* Define to 1 if you have the `fsync' function. */
#define HAVE_FSYNC 1

/* Define to 1 if you have the `strptime' function. */
#define HAVE_STRPTIME 1

/* Define to 1 if you have the `nl_langinfo' function. */
#define HAVE_NL_LANGINFO 1

/* Define to 1 if you have the gtk+-3.0 package. */
#define HAVE_GTK 1

/* Define to 1 if OAuth2 autentication support is enabled. */
#define ENABLE_OAUTH2 1

/* Define to 1 if the examples should be built. */
#define BUILD_EXAMPLES 1

/* Define to 1 if you have the goa-1.0 package. */
#define HAVE_GOA 1

/* If backend-per-process is enabled */
/* #undef ENABLE_BACKEND_PER_PROCESS */

/* Have libdb */
#define HAVE_LIBDB 1

/* libc provides backtrace_symbols function */
/* #undef HAVE_BACKTRACE_SYMBOLS */

/* have elfutils/libdwfl.h functions */
/* #undef HAVE_ELFUTILS_LIBDWFL */

/* Have nl_langinfo (CODESET) */
#define HAVE_CODESET 1

/* Have nl_langinfo (_NL_ADDRESS_COUNTRY_AB2) */
#define HAVE__NL_ADDRESS_COUNTRY_AB2 1

/* strftime supports use of l and k */
#define HAVE_LKSTRFTIME 1

/* Define if SMIME should be enabled */
#define ENABLE_SMIME 1

/* Define if struct tm has a tm_gmtoff member */
#define HAVE_TM_GMTOFF 1

/* Define if libc defines a timezone variable */
#define HAVE_TIMEZONE 1

/* Define if libc defines an altzone variable */
/* #undef HAVE_ALTZONE */

/* Define to 1 if you have the `gethostbyaddr_r' function. */
/* #undef HAVE_GETHOSTBYADDR_R */

/* Define to 1 if you have the `gethostbyname_r' function. */
/* #undef HAVE_GETHOSTBYNAME_R */

/* Enable IPv6 support */
/* #undef ENABLE_IPv6 */

/* Enable getaddrinfo emulation */
/* #undef NEED_ADDRINFO */

/* Define if the system defines the AI_ADDRCONFIG flag for getaddrinfo */
#define HAVE_AI_ADDRCONFIG 1

/* Have <wspiapi.h> */
/* #undef HAVE_WSPIAPI_H */

/* Define to use dot locking for mbox files */
#define USE_DOT_LOCKING 1

/* Define to use fcntl locking for mbox files */
#define USE_FCNTL_LOCKING 1

/* Define to use flock locking for mbox files */
/* #undef USE_FLOCK_LOCKING */

/* Define if mail delivered to the system mail directory is in broken Content-Length format */
/* #undef ENABLE_BROKEN_SPOOL */

/* Define if you have Krb5 */
#define HAVE_KRB5 1

/* Define if you have MIT Krb5 */
#define HAVE_MIT_KRB5 1

/* Define if you have Heimdal */
/* #undef HAVE_HEIMDAL_KRB5 */

/* Define if you have Sun Kerberosv5 */
/* #undef HAVE_SUN_KRB5 */

/* Enable libphonenumber parsing */
/* #undef ENABLE_PHONENUMBER */

/* Whether Parse() or ParseAndKeepRawInput() must be used to get the country-code source */
/* #undef PHONENUMBER_RAW_INPUT_NEEDED */

/* Define if you have LDAP support */
#define HAVE_LDAP 1

/* Define if you use SunLDAP */
/* #undef SUNLDAP */

/* Solaris-style gethostbyaddr_r */
/* #undef GETHOSTBYADDR_R_SEVEN_ARGS */

/* Solaris-style gethostbyname_r */
/* #undef GETHOSTBYNAME_R_FIVE_ARGS */

/* Have <com_err.h> */
#define HAVE_COM_ERR_H 1

/* Have <et/com_err.h> */
#define HAVE_ET_COM_ERR_H 1

/* Define to 1 if you have the libgdata package */
#define HAVE_LIBGDATA 1

/* Define to 1 when the libgdata provides GTasks pagination functions */
#define HAVE_LIBGDATA_TASKS_PAGINATION_FUNCTIONS 1

/* Define to 1 when have O_LARGEFILE open flag */
#define HAVE_O_LARGEFILE 1

#ifndef HAVE_O_LARGEFILE
/* Define to 0 if your system does not have the O_LARGEFILE flag */
#define O_LARGEFILE 0
#endif /* HAVE_O_LARGEFILE */

/* gweather_info_new() has only one argument */
#define HAVE_ONE_ARG_GWEATHER_INFO_NEW 1

/* evolution-alarm-notify - Define if using Canberra-GTK for sound */
#define HAVE_CANBERRA 1
