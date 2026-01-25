/// C types for glib2 library
module glib.c.types;

public import gid.basictypes;

/**
    Integer representing a day of the month; between 1 and 31.
    
    The `G_DATE_BAD_DAY` value represents an invalid day of the month.
*/
alias GDateDay = ubyte;

/**
    Integer type representing a year.
    
    The `G_DATE_BAD_YEAR` value is the invalid value. The year
    must be 1 or higher; negative ([BCE](https://en.wikipedia.org/wiki/Common_Era))
    years are not allowed.
    
    The year is represented with four digits.
*/
alias GDateYear = ushort;

/**
    Opaque type. See g_main_context_pusher_new() for details.
*/
alias GMainContextPusher = void;

/**
    Opaque type. See g_mutex_locker_new() for details.
*/
alias GMutexLocker = void;

/**
    A type which is used to hold a process identification.
    
    On UNIX, processes are identified by a process id (an integer),
    while Windows uses process handles (which are pointers).
    
    GPid is used in GLib only for descendant processes spawned with
    the g_spawn functions.
*/
alias GPid = int;

/**
    A GQuark is a non-zero integer which uniquely identifies a
    particular string.
    
    A GQuark value of zero is associated to `NULL`.
    
    Given either the string or the `GQuark` identifier it is possible to
    retrieve the other.
    
    Quarks are used for both
    [datasets and keyed data lists](datalist-and-dataset.html).
    
    To create a new quark from a string, use `func@GLib.quark_from_string`
    or `func@GLib.quark_from_static_string`.
    
    To find the string corresponding to a given `GQuark`, use
    `func@GLib.quark_to_string`.
    
    To find the `GQuark` corresponding to a given string, use
    `func@GLib.quark_try_string`.
    
    Another use for the string pool maintained for the quark functions
    is string interning, using `func@GLib.intern_string` or
    `func@GLib.intern_static_string`. An interned string is a canonical
    representation for a string. One important advantage of interned
    strings is that they can be compared for equality by a simple
    pointer comparison, rather than using `strcmp()`.
*/
alias GQuark = uint;

/**
    Opaque type. See g_rw_lock_reader_locker_new() for details.
*/
alias GRWLockReaderLocker = void;

/**
    Opaque type. See g_rw_lock_writer_locker_new() for details.
*/
alias GRWLockWriterLocker = void;

/**
    Opaque type. See g_rec_mutex_locker_new() for details.
*/
alias GRecMutexLocker = void;

/**
    A typedef for a reference-counted string. A pointer to a #GRefString can be
    treated like a standard `char*` array by all code, but can additionally have
    `g_ref_string_*()` methods called on it. `g_ref_string_*()` methods cannot be
    called on `char*` arrays not allocated using [glib.global.refStringNew].
    
    If using #GRefString with autocleanups, g_autoptr() must be used rather than
    g_autofree(), so that the reference counting metadata is also freed.
*/
alias GRefString = char;

/**
    A typedef alias for gchar**. This is mostly useful when used together with
    `g_auto()`.
*/
alias GStrv = char**;

/**
    Simply a replacement for `time_t`. It has been deprecated
    since it is not equivalent to `time_t` on 64-bit platforms
    with a 64-bit `time_t`.
    
    Unrelated to #GTimer.
    
    Note that #GTime is defined to always be a 32-bit integer,
    unlike `time_t` which may be 64-bit on some systems. Therefore,
    #GTime will overflow in the year 2038, and you cannot use the
    address of a #GTime variable as argument to the UNIX time()
    function.
    
    Instead, do the following:
    
    ```c
    time_t ttime;
    GTime gtime;
    
    time (&ttime);
    gtime = (GTime)ttime;
    ```

    Deprecated: This is not [Y2038-safe](https://en.wikipedia.org/wiki/Year_2038_problem).
         Use #GDateTime or #time_t instead.
*/
alias GTime = int;

/**
    A value representing an interval of time, in microseconds.
*/
alias GTimeSpan = long;

/** */
alias GIConv = void*;

/** */
enum GAsciiType : uint
{
  /** */
  Alnum = 1,

  /** */
  Alpha = 2,

  /** */
  Cntrl = 4,

  /** */
  Digit = 8,

  /** */
  Graph = 16,

  /** */
  Lower = 32,

  /** */
  Print = 64,

  /** */
  Punct = 128,

  /** */
  Space = 256,

  /** */
  Upper = 512,

  /** */
  Xdigit = 1024,
}

/**
    Error codes returned by bookmark file parsing.
*/
enum GBookmarkFileError
{
  /**
      URI was ill-formed
  */
  InvalidUri = 0,

  /**
      a requested field was not found
  */
  InvalidValue = 1,

  /**
      a requested application did
          not register a bookmark
  */
  AppNotRegistered = 2,

  /**
      a requested URI was not found
  */
  UriNotFound = 3,

  /**
      document was ill formed
  */
  Read = 4,

  /**
      the text being parsed was
          in an unknown encoding
  */
  UnknownEncoding = 5,

  /**
      an error occurred while writing
  */
  Write = 6,

  /**
      requested file was not found
  */
  FileNotFound = 7,
}

/**
    The hashing algorithm to be used by #GChecksum when performing the
    digest of some data.
    
    Note that the #GChecksumType enumeration may be extended at a later
    date to include new hashing algorithm types.
*/
enum GChecksumType
{
  /**
      Use the MD5 hashing algorithm
  */
  Md5 = 0,

  /**
      Use the SHA-1 hashing algorithm
  */
  Sha1 = 1,

  /**
      Use the SHA-256 hashing algorithm
  */
  Sha256 = 2,

  /**
      Use the SHA-512 hashing algorithm (Since: 2.36)
  */
  Sha512 = 3,

  /**
      Use the SHA-384 hashing algorithm (Since: 2.51)
  */
  Sha384 = 4,
}

/**
    Error codes returned by character set conversion routines.
*/
enum GConvertError
{
  /**
      Conversion between the requested character
          sets is not supported.
  */
  NoConversion = 0,

  /**
      Invalid byte sequence in conversion input;
         or the character sequence could not be represented in the target
         character set.
  */
  IllegalSequence = 1,

  /**
      Conversion failed for some reason.
  */
  Failed = 2,

  /**
      Partial character sequence at end of input.
  */
  PartialInput = 3,

  /**
      URI is invalid.
  */
  BadUri = 4,

  /**
      Pathname is not an absolute path.
  */
  NotAbsolutePath = 5,

  /**
      No memory available. Since: 2.40
  */
  NoMemory = 6,

  /**
      An embedded NUL character is present in
          conversion output where a NUL-terminated string is expected.
          Since: 2.56
  */
  EmbeddedNul = 7,
}

/**
    This enumeration isn't used in the API, but may be useful if you need
    to mark a number as a day, month, or year.
*/
enum GDateDMY
{
  /**
      a day
  */
  Day = 0,

  /**
      a month
  */
  Month = 1,

  /**
      a year
  */
  Year = 2,
}

/**
    Enumeration representing a month; values are `G_DATE_JANUARY`,
    `G_DATE_FEBRUARY`, etc. `G_DATE_BAD_MONTH` is the invalid value.
*/
enum GDateMonth
{
  /**
      invalid value
  */
  BadMonth = 0,

  /**
      January
  */
  January = 1,

  /**
      February
  */
  February = 2,

  /**
      March
  */
  March = 3,

  /**
      April
  */
  April = 4,

  /**
      May
  */
  May = 5,

  /**
      June
  */
  June = 6,

  /**
      July
  */
  July = 7,

  /**
      August
  */
  August = 8,

  /**
      September
  */
  September = 9,

  /**
      October
  */
  October = 10,

  /**
      November
  */
  November = 11,

  /**
      December
  */
  December = 12,
}

/**
    Enumeration representing a day of the week; `G_DATE_MONDAY`,
    `G_DATE_TUESDAY`, etc. `G_DATE_BAD_WEEKDAY` is an invalid weekday.
*/
enum GDateWeekday
{
  /**
      invalid value
  */
  BadWeekday = 0,

  /**
      Monday
  */
  Monday = 1,

  /**
      Tuesday
  */
  Tuesday = 2,

  /**
      Wednesday
  */
  Wednesday = 3,

  /**
      Thursday
  */
  Thursday = 4,

  /**
      Friday
  */
  Friday = 5,

  /**
      Saturday
  */
  Saturday = 6,

  /**
      Sunday
  */
  Sunday = 7,
}

/**
    The possible errors, used in the @v_error field
    of #GTokenValue, when the token is a `G_TOKEN_ERROR`.
*/
enum GErrorType
{
  /**
      unknown error
  */
  Unknown = 0,

  /**
      unexpected end of file
  */
  UnexpEof = 1,

  /**
      unterminated string constant
  */
  UnexpEofInString = 2,

  /**
      unterminated comment
  */
  UnexpEofInComment = 3,

  /**
      non-digit character in a number
  */
  NonDigitInConst = 4,

  /**
      digit beyond radix in a number
  */
  DigitRadix = 5,

  /**
      non-decimal floating point number
  */
  FloatRadix = 6,

  /**
      malformed floating point number
  */
  FloatMalformed = 7,
}

/**
    Values corresponding to @errno codes returned from file operations
    on UNIX. Unlike @errno codes, GFileError values are available on
    all systems, even Windows. The exact meaning of each code depends
    on what sort of file operation you were performing; the UNIX
    documentation gives more details. The following error code descriptions
    come from the GNU C Library manual, and are under the copyright
    of that manual.
    
    It's not very portable to make detailed assumptions about exactly
    which errors will be returned from a given operation. Some errors
    don't occur on some systems, etc., sometimes there are subtle
    differences in when a system will report a given error, etc.
*/
enum GFileError
{
  /**
      Operation not permitted; only the owner of
          the file (or other resource) or processes with special privileges
          can perform the operation.
  */
  Exist = 0,

  /**
      File is a directory; you cannot open a directory
          for writing, or create or remove hard links to it.
  */
  Isdir = 1,

  /**
      Permission denied; the file permissions do not
          allow the attempted operation.
  */
  Acces = 2,

  /**
      Filename too long.
  */
  Nametoolong = 3,

  /**
      No such file or directory. This is a "file
          doesn't exist" error for ordinary files that are referenced in
          contexts where they are expected to already exist.
  */
  Noent = 4,

  /**
      A file that isn't a directory was specified when
          a directory is required.
  */
  Notdir = 5,

  /**
      No such device or address. The system tried to
          use the device represented by a file you specified, and it
          couldn't find the device. This can mean that the device file was
          installed incorrectly, or that the physical device is missing or
          not correctly attached to the computer.
  */
  Nxio = 6,

  /**
      The underlying file system of the specified file
          does not support memory mapping.
  */
  Nodev = 7,

  /**
      The directory containing the new link can't be
          modified because it's on a read-only file system.
  */
  Rofs = 8,

  /**
      Text file busy.
  */
  Txtbsy = 9,

  /**
      You passed in a pointer to bad memory.
          (GLib won't reliably return this, don't pass in pointers to bad
          memory.)
  */
  Fault = 10,

  /**
      Too many levels of symbolic links were encountered
          in looking up a file name. This often indicates a cycle of symbolic
          links.
  */
  Loop = 11,

  /**
      No space left on device; write operation on a
          file failed because the disk is full.
  */
  Nospc = 12,

  /**
      No memory available. The system cannot allocate
          more virtual memory because its capacity is full.
  */
  Nomem = 13,

  /**
      The current process has too many files open and
          can't open any more. Duplicate descriptors do count toward this
          limit.
  */
  Mfile = 14,

  /**
      There are too many distinct file openings in the
          entire system.
  */
  Nfile = 15,

  /**
      Bad file descriptor; for example, I/O on a
          descriptor that has been closed or reading from a descriptor open
          only for writing (or vice versa).
  */
  Badf = 16,

  /**
      Invalid argument. This is used to indicate
          various kinds of problems with passing the wrong argument to a
          library function.
  */
  Inval = 17,

  /**
      Broken pipe; there is no process reading from the
          other end of a pipe. Every library function that returns this
          error code also generates a 'SIGPIPE' signal; this signal
          terminates the program if not handled or blocked. Thus, your
          program will never actually see this code unless it has handled
          or blocked 'SIGPIPE'.
  */
  Pipe = 18,

  /**
      Resource temporarily unavailable; the call might
          work if you try again later.
  */
  Again = 19,

  /**
      Interrupted function call; an asynchronous signal
          occurred and prevented completion of the call. When this
          happens, you should try the call again.
  */
  Intr = 20,

  /**
      Input/output error; usually used for physical read
         or write errors. i.e. the disk or other physical device hardware
         is returning errors.
  */
  Io = 21,

  /**
      Operation not permitted; only the owner of the
         file (or other resource) or processes with special privileges can
         perform the operation.
  */
  Perm = 22,

  /**
      Function not implemented; this indicates that
         the system is missing some functionality.
  */
  Nosys = 23,

  /**
      Does not correspond to a UNIX error code; this
         is the standard "failed for unspecified reason" error code present
         in all #GError error code enumerations. Returned if no specific
         code applies.
  */
  Failed = 24,
}

/**
    Flags to pass to [glib.global.fileSetContentsFull] to affect its safety and
    performance.
*/
enum GFileSetContentsFlags : uint
{
  /**
      No guarantees about file consistency or durability.
        The most dangerous setting, which is slightly faster than other settings.
  */
  None = 0,

  /**
      Guarantee file consistency: after a crash,
        either the old version of the file or the new version of the file will be
        available, but not a mixture. On Unix systems this equates to an `fsync()`
        on the file and use of an atomic `rename()` of the new version of the file
        over the old.
  */
  Consistent = 1,

  /**
      Guarantee file durability: after a crash, the
        new version of the file will be available. On Unix systems this equates to
        an `fsync()` on the file (if `G_FILE_SET_CONTENTS_CONSISTENT` is unset), or
        the effects of `G_FILE_SET_CONTENTS_CONSISTENT` plus an `fsync()` on the
        directory containing the file after calling `rename()`.
  */
  Durable = 2,

  /**
      Only apply consistency and durability
        guarantees if the file already exists. This may speed up file operations
        if the file doesn’t currently exist, but may result in a corrupted version
        of the new file if the system crashes while writing it.
  */
  OnlyExisting = 4,
}

/**
    A test to perform on a file using [glib.global.fileTest].
*/
enum GFileTest : uint
{
  /**
      true if the file is a regular file
          (not a directory). Note that this test will also return true
          if the tested file is a symlink to a regular file.
  */
  IsRegular = 1,

  /**
      true if the file is a symlink.
  */
  IsSymlink = 2,

  /**
      true if the file is a directory.
  */
  IsDir = 4,

  /**
      true if the file is executable.
  */
  IsExecutable = 8,

  /**
      true if the file exists. It may or may not
          be a regular file.
  */
  Exists = 16,
}

/**
    Flags to modify the format of the string returned by [glib.global.formatSizeFull].
*/
enum GFormatSizeFlags : uint
{
  /**
      behave the same as [glib.global.formatSize]
  */
  Default = 0,

  /**
      include the exact number of bytes as part
          of the returned string.  For example, "45.6 kB (45,612 bytes)".
  */
  LongFormat = 1,

  /**
      use IEC (base 1024) units with "KiB"-style
          suffixes. IEC units should only be used for reporting things with
          a strong "power of 2" basis, like RAM sizes or RAID stripe sizes.
          Network and storage sizes should be reported in the normal SI units.
  */
  IecUnits = 2,

  /**
      set the size as a quantity in bits, rather than
          bytes, and return units in bits. For example, ‘Mbit’ rather than ‘MB’.
  */
  Bits = 4,

  /**
      return only value, without unit; this should
          not be used together with @G_FORMAT_SIZE_LONG_FORMAT
          nor @G_FORMAT_SIZE_ONLY_UNIT. Since: 2.74
  */
  OnlyValue = 8,

  /**
      return only unit, without value; this should
          not be used together with @G_FORMAT_SIZE_LONG_FORMAT
          nor @G_FORMAT_SIZE_ONLY_VALUE. Since: 2.74
  */
  OnlyUnit = 16,
}

/**
    Flags used internally in the #GHook implementation.
*/
enum GHookFlagMask : uint
{
  /**
      set if the hook has not been destroyed
  */
  Active = 1,

  /**
      set if the hook is currently being run
  */
  InCall = 2,

  /**
      A mask covering all bits reserved for
        hook flags; see `G_HOOK_FLAG_USER_SHIFT`
  */
  Mask = 15,
}

/**
    Error codes returned by #GIOChannel operations.
*/
enum GIOChannelError
{
  /**
      File too large.
  */
  Fbig = 0,

  /**
      Invalid argument.
  */
  Inval = 1,

  /**
      IO error.
  */
  Io = 2,

  /**
      File is a directory.
  */
  Isdir = 3,

  /**
      No space left on device.
  */
  Nospc = 4,

  /**
      No such device or address.
  */
  Nxio = 5,

  /**
      Value too large for defined datatype.
  */
  Overflow = 6,

  /**
      Broken pipe.
  */
  Pipe = 7,

  /**
      Some other error.
  */
  Failed = 8,
}

/**
    A bitwise combination representing a condition to watch for on an
    event source.
*/
enum GIOCondition : uint
{
  /**
      There is data to read.
  */
  In = 1,

  /**
      Data can be written (without blocking).
  */
  Out = 4,

  /**
      There is urgent data to read.
  */
  Pri = 2,

  /**
      Error condition.
  */
  Err = 8,

  /**
      Hung up (the connection has been broken, usually for
                 pipes and sockets).
  */
  Hup = 16,

  /**
      Invalid request. The file descriptor is not open.
  */
  Nval = 32,
}

/**
    #GIOError is only used by the deprecated functions
    [glib.iochannel.IOChannel.read], [glib.iochannel.IOChannel.write], and [glib.iochannel.IOChannel.seek].
*/
enum GIOError
{
  /**
      no error
  */
  None = 0,

  /**
      an EAGAIN error occurred
  */
  Again = 1,

  /**
      an EINVAL error occurred
  */
  Inval = 2,

  /**
      another error occurred
  */
  Unknown = 3,
}

/**
    Specifies properties of a #GIOChannel. Some of the flags can only be
    read with [glib.iochannel.IOChannel.getFlags], but not changed with
    [glib.iochannel.IOChannel.setFlags].
*/
enum GIOFlags : uint
{
  /**
      no special flags set. Since: 2.74
  */
  None = 0,

  /**
      turns on append mode, corresponds to `O_APPEND`
          (see the documentation of the UNIX open() syscall)
  */
  Append = 1,

  /**
      turns on nonblocking mode, corresponds to
          `O_NONBLOCK`/`O_NDELAY` (see the documentation of the UNIX open()
          syscall)
  */
  Nonblock = 2,

  /**
      indicates that the io channel is readable.
          This flag cannot be changed.
  */
  IsReadable = 4,

  /**
      indicates that the io channel is writable.
          This flag cannot be changed.
  */
  IsWritable = 8,

  /**
      a misspelled version of @G_IO_FLAG_IS_WRITABLE
          that existed before the spelling was fixed in GLib 2.30. It is kept
          here for compatibility reasons. Deprecated since 2.30
  */
  IsWriteable = 8,

  /**
      indicates that the io channel is seekable,
          i.e. that [glib.iochannel.IOChannel.seekPosition] can be used on it.
          This flag cannot be changed.
  */
  IsSeekable = 16,

  /**
      the mask that specifies all the valid flags.
  */
  Mask = 31,

  /**
      the mask of the flags that are returned from
          [glib.iochannel.IOChannel.getFlags]
  */
  GetMask = 31,

  /**
      the mask of the flags that the user can modify
          with [glib.iochannel.IOChannel.setFlags]
  */
  SetMask = 3,
}

/**
    Statuses returned by most of the #GIOFuncs functions.
*/
enum GIOStatus
{
  /**
      An error occurred.
  */
  Error = 0,

  /**
      Success.
  */
  Normal = 1,

  /**
      End of file.
  */
  Eof = 2,

  /**
      Resource temporarily unavailable.
  */
  Again = 3,
}

/**
    Error codes returned by key file parsing.
*/
enum GKeyFileError
{
  /**
      the text being parsed was in
        an unknown encoding
  */
  UnknownEncoding = 0,

  /**
      document was ill-formed
  */
  Parse = 1,

  /**
      the file was not found
  */
  NotFound = 2,

  /**
      a requested key was not found
  */
  KeyNotFound = 3,

  /**
      a requested group was not found
  */
  GroupNotFound = 4,

  /**
      a value could not be parsed
  */
  InvalidValue = 5,
}

/**
    Flags which influence the parsing.
*/
enum GKeyFileFlags : uint
{
  /**
      No flags, default behaviour
  */
  None = 0,

  /**
      Use this flag if you plan to write the
        (possibly modified) contents of the key file back to a file;
        otherwise all comments will be lost when the key file is
        written back.
  */
  KeepComments = 1,

  /**
      Use this flag if you plan to write the
        (possibly modified) contents of the key file back to a file;
        otherwise only the translations for the current language will be
        written back.
  */
  KeepTranslations = 2,
}

/**
    Flags specifying the level of log messages.
    
    It is possible to change how GLib treats messages of the various
    levels using `func@GLib.log_set_handler` and `func@GLib.log_set_fatal_mask`.
*/
enum GLogLevelFlags : uint
{
  /**
      internal flag
  */
  FlagRecursion = 1,

  /**
      internal flag
  */
  FlagFatal = 2,

  /**
      log level for errors, see `func@GLib.error`.
        This level is also used for messages produced by `func@GLib.assert`.
  */
  LevelError = 4,

  /**
      log level for critical warning messages, see
        `func@GLib.critical`. This level is also used for messages produced by
        `func@GLib.return_if_fail` and `func@GLib.return_val_if_fail`.
  */
  LevelCritical = 8,

  /**
      log level for warnings, see `func@GLib.warning`
  */
  LevelWarning = 16,

  /**
      log level for messages, see `func@GLib.message`
  */
  LevelMessage = 32,

  /**
      log level for informational messages, see `func@GLib.info`
  */
  LevelInfo = 64,

  /**
      log level for debug messages, see `func@GLib.debug`
  */
  LevelDebug = 128,

  /**
      a mask including all log levels
  */
  LevelMask = -4,
}

/**
    Return values from #GLogWriterFuncs to indicate whether the given log entry
    was successfully handled by the writer, or whether there was an error in
    handling it (and hence a fallback writer should be used).
    
    If a #GLogWriterFunc ignores a log entry, it should return
    `G_LOG_WRITER_HANDLED`.
*/
enum GLogWriterOutput
{
  /**
      Log writer has handled the log entry.
  */
  Handled = 1,

  /**
      Log writer could not handle the log entry.
  */
  Unhandled = 0,
}

/**
    Flags to pass to [glib.main_context.MainContext.newWithFlags] which affect the behaviour
    of a #GMainContext.
*/
enum GMainContextFlags : uint
{
  /**
      Default behaviour.
  */
  None = 0,

  /**
      Assume that polling for events will
      free the thread to process other jobs. That's useful if you're using
      `g_main_context_{prepare,query,check,dispatch}` to integrate GMainContext in
      other event loops.
  */
  OwnerlessPolling = 1,
}

/**
    A mixed enumerated type and flags field. You must specify one type
    (string, strdup, boolean, tristate).  Additionally, you may  optionally
    bitwise OR the type with the flag `G_MARKUP_COLLECT_OPTIONAL`.
    
    It is likely that this enum will be extended in the future to
    support other types.
*/
enum GMarkupCollectType : uint
{
  /**
      used to terminate the list of attributes
          to collect
  */
  Invalid = 0,

  /**
      collect the string pointer directly from
          the attribute_values[] array. Expects a parameter of type (const
          char **). If `G_MARKUP_COLLECT_OPTIONAL` is specified and the
          attribute isn't present then the pointer will be set to null
  */
  String = 1,

  /**
      as with `G_MARKUP_COLLECT_STRING`, but
          expects a parameter of type (char **) and [glib.global.strdup]s the
          returned pointer. The pointer must be freed with [glib.global.gfree]
  */
  Strdup = 2,

  /**
      expects a parameter of type (gboolean *)
          and parses the attribute value as a boolean. Sets false if the
          attribute isn't present. Valid boolean values consist of
          (case-insensitive) "false", "f", "no", "n", "0" and "true", "t",
          "yes", "y", "1"
  */
  Boolean = 3,

  /**
      as with `G_MARKUP_COLLECT_BOOLEAN`, but
          in the case of a missing attribute a value is set that compares
          equal to neither false nor true G_MARKUP_COLLECT_OPTIONAL is
          implied
  */
  Tristate = 4,

  /**
      can be bitwise ORed with the other fields.
          If present, allows the attribute not to appear. A default value
          is set depending on what value type is used
  */
  Optional = 65536,
}

/**
    Error codes returned by markup parsing.
*/
enum GMarkupError
{
  /**
      text being parsed was not valid UTF-8
  */
  BadUtf8 = 0,

  /**
      document contained nothing, or only whitespace
  */
  Empty = 1,

  /**
      document was ill-formed
  */
  Parse = 2,

  /**
      error should be set by #GMarkupParser
          functions; element wasn't known
  */
  UnknownElement = 3,

  /**
      error should be set by #GMarkupParser
          functions; attribute wasn't known
  */
  UnknownAttribute = 4,

  /**
      error should be set by #GMarkupParser
          functions; content was invalid
  */
  InvalidContent = 5,

  /**
      error should be set by #GMarkupParser
          functions; a required attribute was missing
  */
  MissingAttribute = 6,
}

/**
    Flags that affect the behaviour of the parser.
*/
enum GMarkupParseFlags : uint
{
  /**
      No special behaviour. Since: 2.74
  */
  DefaultFlags = 0,

  /**
      flag you should not use
  */
  DoNotUseThisUnsupportedFlag = 1,

  /**
      When this flag is set, CDATA marked
          sections are not passed literally to the @passthrough function of
          the parser. Instead, the content of the section (without the
          `<![CDATA[` and `]]>`) is
          passed to the @text function. This flag was added in GLib 2.12
  */
  TreatCdataAsText = 2,

  /**
      Normally errors caught by GMarkup
          itself have line/column information prefixed to them to let the
          caller know the location of the error. When this flag is set the
          location information is also prefixed to errors generated by the
          #GMarkupParser implementation functions
  */
  PrefixErrorPosition = 4,

  /**
      Ignore (don't report) qualified
          attributes and tags, along with their contents.  A qualified
          attribute or tag is one that contains ':' in its name (ie: is in
          another namespace).  Since: 2.40.
  */
  IgnoreQualified = 8,
}

/**
    Defines how a Unicode string is transformed in a canonical
    form, standardizing such issues as whether a character with
    an accent is represented as a base character and combining
    accent or as a single precomposed character. Unicode strings
    should generally be normalized before comparing them.
*/
enum GNormalizeMode
{
  /**
      standardize differences that do not affect the
          text content, such as the above-mentioned accent representation
  */
  Default = 0,

  /**
      another name for [glib.types.NormalizeMode.Default]
  */
  Nfd = 0,

  /**
      like [glib.types.NormalizeMode.Default], but with
          composed forms rather than a maximally decomposed form
  */
  DefaultCompose = 1,

  /**
      another name for [glib.types.NormalizeMode.DefaultCompose]
  */
  Nfc = 1,

  /**
      beyond [glib.types.NormalizeMode.Default] also standardize the
          "compatibility" characters in Unicode, such as SUPERSCRIPT THREE
          to the standard forms (in this case DIGIT THREE). Formatting
          information may be lost but for most text operations such
          characters should be considered the same
  */
  All = 2,

  /**
      another name for [glib.types.NormalizeMode.All]
  */
  Nfkd = 2,

  /**
      like [glib.types.NormalizeMode.All], but with composed
          forms rather than a maximally decomposed form
  */
  AllCompose = 3,

  /**
      another name for [glib.types.NormalizeMode.AllCompose]
  */
  Nfkc = 3,
}

/**
    Error codes returned by functions converting a string to a number.
*/
enum GNumberParserError
{
  /**
      string was not a valid number
  */
  Invalid = 0,

  /**
      string was a number, but out of bounds
  */
  OutOfBounds = 1,
}

/**
    The possible statuses of a one-time initialization function
    controlled by a #GOnce struct.
*/
enum GOnceStatus
{
  /**
      the function has not been called yet.
  */
  Notcalled = 0,

  /**
      the function call is currently in progress.
  */
  Progress = 1,

  /**
      the function has been called.
  */
  Ready = 2,
}

/**
    The #GOptionArg enum values determine which type of extra argument the
    options expect to find. If an option expects an extra argument, it can
    be specified in several ways; with a short option: `-x arg`, with a long
    option: `--name arg` or combined in a single argument: `--name=arg`.
*/
enum GOptionArg
{
  /**
      No extra argument. This is useful for simple flags or booleans.
  */
  None = 0,

  /**
      The option takes a UTF-8 string argument.
  */
  String = 1,

  /**
      The option takes an integer argument.
  */
  Int = 2,

  /**
      The option provides a callback (of type
          #GOptionArgFunc) to parse the extra argument.
  */
  Callback = 3,

  /**
      The option takes a filename as argument, which will
             be in the GLib filename encoding rather than UTF-8.
  */
  Filename = 4,

  /**
      The option takes a string argument, multiple
          uses of the option are collected into an array of strings.
  */
  StringArray = 5,

  /**
      The option takes a filename as argument,
          multiple uses of the option are collected into an array of strings.
  */
  FilenameArray = 6,

  /**
      The option takes a double argument. The argument
          can be formatted either for the user's locale or for the "C" locale.
          Since 2.12
  */
  Double = 7,

  /**
      The option takes a 64-bit integer. Like
          `G_OPTION_ARG_INT` but for larger numbers. The number can be in
          decimal base, or in hexadecimal (when prefixed with `0x`, for
          example, `0xffffffff`). Since 2.12
  */
  Int64 = 8,
}

/**
    Error codes returned by option parsing.
*/
enum GOptionError
{
  /**
      An option was not known to the parser.
       This error will only be reported, if the parser hasn't been instructed
       to ignore unknown options, see [glib.option_context.OptionContext.setIgnoreUnknownOptions].
  */
  UnknownOption = 0,

  /**
      A value couldn't be parsed.
  */
  BadValue = 1,

  /**
      A #GOptionArgFunc callback failed.
  */
  Failed = 2,
}

/**
    Flags which modify individual options.
*/
enum GOptionFlags : uint
{
  /**
      No flags. Since: 2.42.
  */
  None = 0,

  /**
      The option doesn't appear in `--help` output.
  */
  Hidden = 1,

  /**
      The option appears in the main section of the
          `--help` output, even if it is defined in a group.
  */
  InMain = 2,

  /**
      For options of the `G_OPTION_ARG_NONE` kind, this
          flag indicates that the sense of the option is reversed. i.e. false will
          be stored into the argument rather than true.
  */
  Reverse = 4,

  /**
      For options of the `G_OPTION_ARG_CALLBACK` kind,
          this flag indicates that the callback does not take any argument
          (like a `G_OPTION_ARG_NONE` option). Since 2.8
  */
  NoArg = 8,

  /**
      For options of the `G_OPTION_ARG_CALLBACK`
          kind, this flag indicates that the argument should be passed to the
          callback in the GLib filename encoding rather than UTF-8. Since 2.8
  */
  Filename = 16,

  /**
      For options of the `G_OPTION_ARG_CALLBACK`
          kind, this flag indicates that the argument supply is optional.
          If no argument is given then data of [glib.types.OptionParseFunc] will be
          set to NULL. Since 2.8
  */
  OptionalArg = 32,

  /**
      This flag turns off the automatic conflict
          resolution which prefixes long option names with `groupname-` if
          there is a conflict. This option should only be used in situations
          where aliasing is necessary to model some legacy commandline interface.
          It is not safe to use this option, unless all option groups are under
          your direct control. Since 2.8.
  */
  Noalias = 64,
}

/**
    Flags specifying compile-time options.
*/
enum GRegexCompileFlags : uint
{
  /**
      No special options set. Since: 2.74
  */
  Default = 0,

  /**
      Letters in the pattern match both upper- and
          lowercase letters. This option can be changed within a pattern
          by a "(?i)" option setting.
  */
  Caseless = 1,

  /**
      By default, GRegex treats the strings as consisting
          of a single line of characters (even if it actually contains
          newlines). The "start of line" metacharacter ("^") matches only
          at the start of the string, while the "end of line" metacharacter
          ("$") matches only at the end of the string, or before a terminating
          newline (unless `G_REGEX_DOLLAR_ENDONLY` is set). When
          `G_REGEX_MULTILINE` is set, the "start of line" and "end of line"
          constructs match immediately following or immediately before any
          newline in the string, respectively, as well as at the very start
          and end. This can be changed within a pattern by a "(?m)" option
          setting.
  */
  Multiline = 2,

  /**
      A dot metacharacter (".") in the pattern matches all
          characters, including newlines. Without it, newlines are excluded.
          This option can be changed within a pattern by a ("?s") option setting.
  */
  Dotall = 4,

  /**
      Whitespace data characters in the pattern are
          totally ignored except when escaped or inside a character class.
          Whitespace does not include the VT character (code 11). In addition,
          characters between an unescaped "#" outside a character class and
          the next newline character, inclusive, are also ignored. This can
          be changed within a pattern by a "(?x)" option setting.
  */
  Extended = 8,

  /**
      The pattern is forced to be "anchored", that is,
          it is constrained to match only at the first matching point in the
          string that is being searched. This effect can also be achieved by
          appropriate constructs in the pattern itself such as the "^"
          metacharacter.
  */
  Anchored = 16,

  /**
      A dollar metacharacter ("$") in the pattern
          matches only at the end of the string. Without this option, a
          dollar also matches immediately before the final character if
          it is a newline (but not before any other newlines). This option
          is ignored if `G_REGEX_MULTILINE` is set.
  */
  DollarEndonly = 32,

  /**
      Inverts the "greediness" of the quantifiers so that
          they are not greedy by default, but become greedy if followed by "?".
          It can also be set by a "(?U)" option setting within the pattern.
  */
  Ungreedy = 512,

  /**
      Usually strings must be valid UTF-8 strings, using this
          flag they are considered as a raw sequence of bytes.
  */
  Raw = 2048,

  /**
      Disables the use of numbered capturing
          parentheses in the pattern. Any opening parenthesis that is not
          followed by "?" behaves as if it were followed by "?:" but named
          parentheses can still be used for capturing (and they acquire numbers
          in the usual way).
  */
  NoAutoCapture = 4096,

  /**
      Since 2.74 and the port to pcre2, requests JIT
          compilation, which, if the just-in-time compiler is available, further
          processes a compiled pattern into machine code that executes much
          faster. However, it comes at the cost of extra processing before the
          match is performed, so it is most beneficial to use this when the same
          compiled pattern is used for matching many times. Before 2.74 this
          option used the built-in non-JIT optimizations in pcre1.
  */
  Optimize = 8192,

  /**
      Limits an unanchored pattern to match before (or at) the
          first newline. Since: 2.34
  */
  Firstline = 262144,

  /**
      Names used to identify capturing subpatterns need not
          be unique. This can be helpful for certain types of pattern when it
          is known that only one instance of the named subpattern can ever be
          matched.
  */
  Dupnames = 524288,

  /**
      Usually any newline character or character sequence is
          recognized. If this option is set, the only recognized newline character
          is '\r'.
  */
  NewlineCr = 1048576,

  /**
      Usually any newline character or character sequence is
          recognized. If this option is set, the only recognized newline character
          is '\n'.
  */
  NewlineLf = 2097152,

  /**
      Usually any newline character or character sequence is
          recognized. If this option is set, the only recognized newline character
          sequence is '\r\n'.
  */
  NewlineCrlf = 3145728,

  /**
      Usually any newline character or character sequence
          is recognized. If this option is set, the only recognized newline character
          sequences are '\r', '\n', and '\r\n'. Since: 2.34
  */
  NewlineAnycrlf = 5242880,

  /**
      Usually any newline character or character sequence
          is recognised. If this option is set, then "\R" only recognizes the newline
         characters '\r', '\n' and '\r\n'. Since: 2.34
  */
  BsrAnycrlf = 8388608,

  /**
      Changes behaviour so that it is compatible with
          JavaScript rather than PCRE. Since GLib 2.74 this is no longer supported,
          as libpcre2 does not support it. Since: 2.34 Deprecated: 2.74
  */
  JavascriptCompat = 33554432,
}

/**
    Error codes returned by regular expressions functions.
*/
enum GRegexError
{
  /**
      Compilation of the regular expression failed.
  */
  Compile = 0,

  /**
      Optimization of the regular expression failed.
  */
  Optimize = 1,

  /**
      Replacement failed due to an ill-formed replacement
          string.
  */
  Replace = 2,

  /**
      The match process failed.
  */
  Match = 3,

  /**
      Internal error of the regular expression engine.
          Since 2.16
  */
  Internal = 4,

  /**
      "\\" at end of pattern. Since 2.16
  */
  StrayBackslash = 101,

  /**
      "\\c" at end of pattern. Since 2.16
  */
  MissingControlChar = 102,

  /**
      Unrecognized character follows "\\".
          Since 2.16
  */
  UnrecognizedEscape = 103,

  /**
      Numbers out of order in "{}"
          quantifier. Since 2.16
  */
  QuantifiersOutOfOrder = 104,

  /**
      Number too big in "{}" quantifier.
          Since 2.16
  */
  QuantifierTooBig = 105,

  /**
      Missing terminating "]" for
          character class. Since 2.16
  */
  UnterminatedCharacterClass = 106,

  /**
      Invalid escape sequence
          in character class. Since 2.16
  */
  InvalidEscapeInCharacterClass = 107,

  /**
      Range out of order in character class.
          Since 2.16
  */
  RangeOutOfOrder = 108,

  /**
      Nothing to repeat. Since 2.16
  */
  NothingToRepeat = 109,

  /**
      Unrecognized character after "(?",
          "(?<" or "(?P". Since 2.16
  */
  UnrecognizedCharacter = 112,

  /**
      POSIX named classes are
          supported only within a class. Since 2.16
  */
  PosixNamedClassOutsideClass = 113,

  /**
      Missing terminating ")" or ")"
          without opening "(". Since 2.16
  */
  UnmatchedParenthesis = 114,

  /**
      Reference to non-existent
          subpattern. Since 2.16
  */
  InexistentSubpatternReference = 115,

  /**
      Missing terminating ")" after comment.
          Since 2.16
  */
  UnterminatedComment = 118,

  /**
      Regular expression too large.
          Since 2.16
  */
  ExpressionTooLarge = 120,

  /**
      Failed to get memory. Since 2.16
  */
  MemoryError = 121,

  /**
      Lookbehind assertion is not
          fixed length. Since 2.16
  */
  VariableLengthLookbehind = 125,

  /**
      Malformed number or name after "(?(".
          Since 2.16
  */
  MalformedCondition = 126,

  /**
      Conditional group contains
          more than two branches. Since 2.16
  */
  TooManyConditionalBranches = 127,

  /**
      Assertion expected after "(?(".
          Since 2.16
  */
  AssertionExpected = 128,

  /**
      Unknown POSIX class name.
          Since 2.16
  */
  UnknownPosixClassName = 130,

  /**
      POSIX collating
          elements are not supported. Since 2.16
  */
  PosixCollatingElementsNotSupported = 131,

  /**
      Character value in "\\x{...}" sequence
          is too large. Since 2.16
  */
  HexCodeTooLarge = 134,

  /**
      Invalid condition "(?(0)". Since 2.16
  */
  InvalidCondition = 135,

  /**
      \\C not allowed in
          lookbehind assertion. Since 2.16
  */
  SingleByteMatchInLookbehind = 136,

  /**
      Recursive call could loop indefinitely.
          Since 2.16
  */
  InfiniteLoop = 140,

  /**
      Missing terminator
          in subpattern name. Since 2.16
  */
  MissingSubpatternNameTerminator = 142,

  /**
      Two named subpatterns have
          the same name. Since 2.16
  */
  DuplicateSubpatternName = 143,

  /**
      Malformed "\\P" or "\\p" sequence.
          Since 2.16
  */
  MalformedProperty = 146,

  /**
      Unknown property name after "\\P" or
          "\\p". Since 2.16
  */
  UnknownProperty = 147,

  /**
      Subpattern name is too long
          (maximum 32 characters). Since 2.16
  */
  SubpatternNameTooLong = 148,

  /**
      Too many named subpatterns (maximum
          10,000). Since 2.16
  */
  TooManySubpatterns = 149,

  /**
      Octal value is greater than "\\377".
          Since 2.16
  */
  InvalidOctalValue = 151,

  /**
      "DEFINE" group contains more
          than one branch. Since 2.16
  */
  TooManyBranchesInDefine = 154,

  /**
      Repeating a "DEFINE" group is not allowed.
          This error is never raised. Since: 2.16 Deprecated: 2.34
  */
  DefineRepetion = 155,

  /**
      Inconsistent newline options.
          Since 2.16
  */
  InconsistentNewlineOptions = 156,

  /**
      "\\g" is not followed by a braced,
           angle-bracketed, or quoted name or number, or by a plain number. Since: 2.16
  */
  MissingBackReference = 157,

  /**
      relative reference must not be zero. Since: 2.34
  */
  InvalidRelativeReference = 158,

  /**
      the backtracing
          control verb used does not allow an argument. Since: 2.34
  */
  BacktrackingControlVerbArgumentForbidden = 159,

  /**
      unknown backtracing
          control verb. Since: 2.34
  */
  UnknownBacktrackingControlVerb = 160,

  /**
      number is too big in escape sequence. Since: 2.34
  */
  NumberTooBig = 161,

  /**
      Missing subpattern name. Since: 2.34
  */
  MissingSubpatternName = 162,

  /**
      Missing digit. Since 2.34
  */
  MissingDigit = 163,

  /**
      In JavaScript compatibility mode,
          "[" is an invalid data character. Since: 2.34
  */
  InvalidDataCharacter = 164,

  /**
      different names for subpatterns of the
          same number are not allowed. Since: 2.34
  */
  ExtraSubpatternName = 165,

  /**
      the backtracing control
          verb requires an argument. Since: 2.34
  */
  BacktrackingControlVerbArgumentRequired = 166,

  /**
      "\\c" must be followed by an ASCII
          character. Since: 2.34
  */
  InvalidControlChar = 168,

  /**
      "\\k" is not followed by a braced, angle-bracketed, or
          quoted name. Since: 2.34
  */
  MissingName = 169,

  /**
      "\\N" is not supported in a class. Since: 2.34
  */
  NotSupportedInClass = 171,

  /**
      too many forward references. Since: 2.34
  */
  TooManyForwardReferences = 172,

  /**
      the name is too long in "(*MARK)", "(*PRUNE)",
          "(*SKIP)", or "(*THEN)". Since: 2.34
  */
  NameTooLong = 175,

  /**
      the character value in the \\u sequence is
          too large. Since: 2.34
  */
  CharacterValueTooLarge = 176,
}

/**
    Flags specifying match-time options.
*/
enum GRegexMatchFlags : uint
{
  /**
      No special options set. Since: 2.74
  */
  Default = 0,

  /**
      The pattern is forced to be "anchored", that is,
          it is constrained to match only at the first matching point in the
          string that is being searched. This effect can also be achieved by
          appropriate constructs in the pattern itself such as the "^"
          metacharacter.
  */
  Anchored = 16,

  /**
      Specifies that first character of the string is
          not the beginning of a line, so the circumflex metacharacter should
          not match before it. Setting this without `G_REGEX_MULTILINE` (at
          compile time) causes circumflex never to match. This option affects
          only the behaviour of the circumflex metacharacter, it does not
          affect "\A".
  */
  Notbol = 128,

  /**
      Specifies that the end of the subject string is
          not the end of a line, so the dollar metacharacter should not match
          it nor (except in multiline mode) a newline immediately before it.
          Setting this without `G_REGEX_MULTILINE` (at compile time) causes
          dollar never to match. This option affects only the behaviour of
          the dollar metacharacter, it does not affect "\Z" or "\z".
  */
  Noteol = 256,

  /**
      An empty string is not considered to be a valid
          match if this option is set. If there are alternatives in the pattern,
          they are tried. If all the alternatives match the empty string, the
          entire match fails. For example, if the pattern "a?b?" is applied to
          a string not beginning with "a" or "b", it matches the empty string
          at the start of the string. With this flag set, this match is not
          valid, so GRegex searches further into the string for occurrences
          of "a" or "b".
  */
  Notempty = 1024,

  /**
      Turns on the partial matching feature, for more
          documentation on partial matching see [glib.match_info.MatchInfo.isPartialMatch].
  */
  Partial = 32768,

  /**
      Overrides the newline definition set when
          creating a new #GRegex, setting the '\r' character as line terminator.
  */
  NewlineCr = 1048576,

  /**
      Overrides the newline definition set when
          creating a new #GRegex, setting the '\n' character as line terminator.
  */
  NewlineLf = 2097152,

  /**
      Overrides the newline definition set when
          creating a new #GRegex, setting the '\r\n' characters sequence as line terminator.
  */
  NewlineCrlf = 3145728,

  /**
      Overrides the newline definition set when
          creating a new #GRegex, any Unicode newline sequence
          is recognised as a newline. These are '\r', '\n' and '\rn', and the
          single characters U+000B LINE TABULATION, U+000C FORM FEED (FF),
          U+0085 NEXT LINE (NEL), U+2028 LINE SEPARATOR and
          U+2029 PARAGRAPH SEPARATOR.
  */
  NewlineAny = 4194304,

  /**
      Overrides the newline definition set when
          creating a new #GRegex; any '\r', '\n', or '\r\n' character sequence
          is recognized as a newline. Since: 2.34
  */
  NewlineAnycrlf = 5242880,

  /**
      Overrides the newline definition for "\R" set when
          creating a new #GRegex; only '\r', '\n', or '\r\n' character sequences
          are recognized as a newline by "\R". Since: 2.34
  */
  BsrAnycrlf = 8388608,

  /**
      Overrides the newline definition for "\R" set when
          creating a new #GRegex; any Unicode newline character or character sequence
          are recognized as a newline by "\R". These are '\r', '\n' and '\rn', and the
          single characters U+000B LINE TABULATION, U+000C FORM FEED (FF),
          U+0085 NEXT LINE (NEL), U+2028 LINE SEPARATOR and
          U+2029 PARAGRAPH SEPARATOR. Since: 2.34
  */
  BsrAny = 16777216,

  /**
      An alias for `G_REGEX_MATCH_PARTIAL`. Since: 2.34
  */
  PartialSoft = 32768,

  /**
      Turns on the partial matching feature. In contrast to
          to `G_REGEX_MATCH_PARTIAL_SOFT`, this stops matching as soon as a partial match
          is found, without continuing to search for a possible complete match. See
          [glib.match_info.MatchInfo.isPartialMatch] for more information. Since: 2.34
  */
  PartialHard = 134217728,

  /**
      Like `G_REGEX_MATCH_NOTEMPTY`, but only applied to
          the start of the matched string. For anchored
          patterns this can only happen for pattern containing "\K". Since: 2.34
  */
  NotemptyAtstart = 268435456,
}

/**
    An enumeration specifying the base position for a
    [glib.iochannel.IOChannel.seekPosition] operation.
*/
enum GSeekType
{
  /**
      the current position in the file.
  */
  Cur = 0,

  /**
      the start of the file.
  */
  Set = 1,

  /**
      the end of the file.
  */
  End = 2,
}

/**
    Error codes returned by shell functions.
*/
enum GShellError
{
  /**
      Mismatched or otherwise mangled quoting.
  */
  BadQuoting = 0,

  /**
      String to be parsed was empty.
  */
  EmptyString = 1,

  /**
      Some other error.
  */
  Failed = 2,
}

/** */
enum GSliceConfig
{
  /** */
  AlwaysMalloc = 1,

  /** */
  BypassMagazines = 2,

  /** */
  WorkingSetMsecs = 3,

  /** */
  ColorIncrement = 4,

  /** */
  ChunkSizes = 5,

  /** */
  ContentionCounter = 6,
}

/**
    Error codes returned by spawning processes.
*/
enum GSpawnError
{
  /**
      Fork failed due to lack of memory.
  */
  Fork = 0,

  /**
      Read or select on pipes failed.
  */
  Read = 1,

  /**
      Changing to working directory failed.
  */
  Chdir = 2,

  /**
      execv() returned `EACCES`
  */
  Acces = 3,

  /**
      execv() returned `EPERM`
  */
  Perm = 4,

  /**
      execv() returned `E2BIG`
  */
  TooBig = 5,

  /**
      deprecated alias for `G_SPAWN_ERROR_TOO_BIG` (deprecated since GLib 2.32)
  */
  _2big = 5,

  /**
      execv() returned `ENOEXEC`
  */
  Noexec = 6,

  /**
      execv() returned `ENAMETOOLONG`
  */
  Nametoolong = 7,

  /**
      execv() returned `ENOENT`
  */
  Noent = 8,

  /**
      execv() returned `ENOMEM`
  */
  Nomem = 9,

  /**
      execv() returned `ENOTDIR`
  */
  Notdir = 10,

  /**
      execv() returned `ELOOP`
  */
  Loop = 11,

  /**
      execv() returned `ETXTBUSY`
  */
  Txtbusy = 12,

  /**
      execv() returned `EIO`
  */
  Io = 13,

  /**
      execv() returned `ENFILE`
  */
  Nfile = 14,

  /**
      execv() returned `EMFILE`
  */
  Mfile = 15,

  /**
      execv() returned `EINVAL`
  */
  Inval = 16,

  /**
      execv() returned `EISDIR`
  */
  Isdir = 17,

  /**
      execv() returned `ELIBBAD`
  */
  Libbad = 18,

  /**
      Some other fatal failure,
        `error->message` should explain.
  */
  Failed = 19,
}

/**
    Flags passed to [glib.global.spawnSync], [glib.global.spawnAsync] and [glib.global.spawnAsyncWithPipes].
*/
enum GSpawnFlags : uint
{
  /**
      no flags, default behaviour
  */
  Default = 0,

  /**
      the parent's open file descriptors will
          be inherited by the child; otherwise all descriptors except stdin,
          stdout and stderr will be closed before calling exec() in the child.
  */
  LeaveDescriptorsOpen = 1,

  /**
      the child will not be automatically reaped;
          you must use [glib.global.childWatchAdd] yourself (or call waitpid() or handle
          `SIGCHLD` yourself), or the child will become a zombie.
  */
  DoNotReapChild = 2,

  /**
      `argv[0]` need not be an absolute path, it will be
          looked for in the user's `PATH`.
  */
  SearchPath = 4,

  /**
      the child's standard output will be discarded,
          instead of going to the same location as the parent's standard output.
  */
  StdoutToDevNull = 8,

  /**
      the child's standard error will be discarded.
  */
  StderrToDevNull = 16,

  /**
      the child will inherit the parent's standard
          input (by default, the child's standard input is attached to `/dev/null`).
  */
  ChildInheritsStdin = 32,

  /**
      the first element of `argv` is the file to
          execute, while the remaining elements are the actual argument vector
          to pass to the file. Normally [glib.global.spawnAsyncWithPipes] uses `argv[0]`
          as the file to execute, and passes all of `argv` to the child.
  */
  FileAndArgvZero = 64,

  /**
      if `argv[0]` is not an absolute path,
          it will be looked for in the `PATH` from the passed child environment.
          Since: 2.34
  */
  SearchPathFromEnvp = 128,

  /**
      create all pipes with the `O_CLOEXEC` flag set.
          Since: 2.40
  */
  CloexecPipes = 256,

  /**
      The child will inherit the parent's standard output.
  */
  ChildInheritsStdout = 512,

  /**
      The child will inherit the parent's standard error.
  */
  ChildInheritsStderr = 1024,

  /**
      The child's standard input is attached to `/dev/null`.
  */
  StdinFromDevNull = 2048,
}

/**
    The type of file to return the filename for, when used with
    [glib.global.testBuildFilename].
    
    These two options correspond rather directly to the 'dist' and
    'built' terminology that automake uses and are explicitly used to
    distinguish between the 'srcdir' and 'builddir' being separate.  All
    files in your project should either be dist (in the
    `EXTRA_DIST` or `dist_schema_DATA`
    sense, in which case they will always be in the srcdir) or built (in
    the `BUILT_SOURCES` sense, in which case they will
    always be in the builddir).
    
    Note: as a general rule of automake, files that are generated only as
    part of the build-from-git process (but then are distributed with the
    tarball) always go in srcdir (even if doing a srcdir != builddir
    build from git) and are considered as distributed files.
*/
enum GTestFileType
{
  /**
      a file that was included in the distribution tarball
  */
  Dist = 0,

  /**
      a file that was built on the compiling machine
  */
  Built = 1,
}

/** */
enum GTestLogType
{
  /** */
  None = 0,

  /** */
  Error = 1,

  /** */
  StartBinary = 2,

  /** */
  ListCase = 3,

  /** */
  SkipCase = 4,

  /** */
  StartCase = 5,

  /** */
  StopCase = 6,

  /** */
  MinResult = 7,

  /** */
  MaxResult = 8,

  /** */
  Message = 9,

  /** */
  StartSuite = 10,

  /** */
  StopSuite = 11,
}

/** */
enum GTestResult
{
  /** */
  Success = 0,

  /** */
  Skipped = 1,

  /** */
  Failure = 2,

  /** */
  Incomplete = 3,
}

/**
    Flags to pass to [glib.global.testTrapSubprocess] to control input and output.
    
    Note that in contrast with [glib.global.testTrapFork], the default is to
    not show stdout and stderr.
*/
enum GTestSubprocessFlags : uint
{
  /**
      Default behaviour. Since: 2.74
  */
  Default = 0,

  /**
      If this flag is given, the child
          process will inherit the parent's stdin. Otherwise, the child's
          stdin is redirected to `/dev/null`.
  */
  InheritStdin = 1,

  /**
      If this flag is given, the child
          process will inherit the parent's stdout. Otherwise, the child's
          stdout will not be visible, but it will be captured to allow
          later tests with g_test_trap_assert_stdout().
  */
  InheritStdout = 2,

  /**
      If this flag is given, the child
          process will inherit the parent's stderr. Otherwise, the child's
          stderr will not be visible, but it will be captured to allow
          later tests with g_test_trap_assert_stderr().
  */
  InheritStderr = 4,
}

/**
    Test traps are guards around forked tests.
    These flags determine what traps to set.

    Deprecated: #GTestTrapFlags is used only with [glib.global.testTrapFork],
      which is deprecated. [glib.global.testTrapSubprocess] uses
      #GTestSubprocessFlags.
*/
enum GTestTrapFlags : uint
{
  /**
      Default behaviour. Since: 2.74
  */
  Default = 0,

  /**
      Redirect stdout of the test child to
          `/dev/null` so it cannot be observed on the console during test
          runs. The actual output is still captured though to allow later
          tests with g_test_trap_assert_stdout().
  */
  SilenceStdout = 128,

  /**
      Redirect stderr of the test child to
          `/dev/null` so it cannot be observed on the console during test
          runs. The actual output is still captured though to allow later
          tests with g_test_trap_assert_stderr().
  */
  SilenceStderr = 256,

  /**
      If this flag is given, stdin of the
          child process is shared with stdin of its parent process.
          It is redirected to `/dev/null` otherwise.
  */
  InheritStdin = 512,
}

/**
    Possible errors of thread related functions.
*/
enum GThreadError
{
  /**
      a thread couldn't be created due to resource
                             shortage. Try again later.
  */
  ThreadErrorAgain = 0,
}

/**
    Thread priorities.

    Deprecated: Thread priorities no longer have any effect.
*/
enum GThreadPriority
{
  /**
      a priority lower than normal
  */
  Low = 0,

  /**
      the default priority
  */
  Normal = 1,

  /**
      a priority higher than normal
  */
  High = 2,

  /**
      the highest priority
  */
  Urgent = 3,
}

/**
    Disambiguates a given time in two ways.
    
    First, specifies if the given time is in universal or local time.
    
    Second, if the time is in local time, specifies if it is local
    standard time or local daylight time.  This is important for the case
    where the same local time occurs twice (during daylight savings time
    transitions, for example).
*/
enum GTimeType
{
  /**
      the time is in local standard time
  */
  Standard = 0,

  /**
      the time is in local daylight time
  */
  Daylight = 1,

  /**
      the time is in UTC
  */
  Universal = 2,
}

/**
    The possible types of token returned from each
    [glib.scanner.Scanner.getNextToken] call.
*/
enum GTokenType
{
  /**
      the end of the file
  */
  Eof = 0,

  /**
      a '(' character
  */
  LeftParen = 40,

  /**
      a ')' character
  */
  RightParen = 41,

  /**
      a '{' character
  */
  LeftCurly = 123,

  /**
      a '}' character
  */
  RightCurly = 125,

  /**
      a '[' character
  */
  LeftBrace = 91,

  /**
      a ']' character
  */
  RightBrace = 93,

  /**
      a '=' character
  */
  EqualSign = 61,

  /**
      a ',' character
  */
  Comma = 44,

  /**
      not a token
  */
  None = 256,

  /**
      an error occurred
  */
  Error = 257,

  /**
      a character
  */
  Char = 258,

  /**
      a binary integer
  */
  Binary = 259,

  /**
      an octal integer
  */
  Octal = 260,

  /**
      an integer
  */
  Int = 261,

  /**
      a hex integer
  */
  Hex = 262,

  /**
      a floating point number
  */
  Float = 263,

  /**
      a string
  */
  String = 264,

  /**
      a symbol
  */
  Symbol = 265,

  /**
      an identifier
  */
  Identifier = 266,

  /**
      a null identifier
  */
  IdentifierNull = 267,

  /**
      one line comment
  */
  CommentSingle = 268,

  /**
      multi line comment
  */
  CommentMulti = 269,
}

/**
    Specifies which nodes are visited during several of the tree
    functions, including [glib.node.Node.traverse] and [glib.node.Node.find].
*/
enum GTraverseFlags : uint
{
  /**
      only leaf nodes should be visited. This name has
                          been introduced in 2.6, for older version use
                          `G_TRAVERSE_LEAFS`.
  */
  Leaves = 1,

  /**
      only non-leaf nodes should be visited. This
                              name has been introduced in 2.6, for older
                              version use `G_TRAVERSE_NON_LEAFS`.
  */
  NonLeaves = 2,

  /**
      all nodes should be visited.
  */
  All = 3,

  /**
      a mask of all traverse flags.
  */
  Mask = 3,

  /**
      identical to `G_TRAVERSE_LEAVES`.
  */
  Leafs = 1,

  /**
      identical to `G_TRAVERSE_NON_LEAVES`.
  */
  NonLeafs = 2,
}

/**
    Specifies the type of traversal performed by [glib.tree.Tree.traverse],
    [glib.node.Node.traverse] and [glib.node.Node.find]. The different orders are
    illustrated here:
    $(LIST
      * In order: A, B, C, D, E, F, G, H, I
        ![](Sorted_binary_tree_inorder.svg)
      * Pre order: F, B, A, D, C, E, G, I, H
        ![](Sorted_binary_tree_preorder.svg)
      * Post order: A, C, E, D, B, H, I, G, F
        ![](Sorted_binary_tree_postorder.svg)
      * Level order: F, B, G, A, D, I, C, E, H
        ![](Sorted_binary_tree_breadth-first_traversal.svg)
    )
*/
enum GTraverseType
{
  /**
      vists a node's left child first, then the node itself,
                   then its right child. This is the one to use if you
                   want the output sorted according to the compare
                   function.
  */
  InOrder = 0,

  /**
      visits a node, then its children.
  */
  PreOrder = 1,

  /**
      visits the node's children, then the node itself.
  */
  PostOrder = 2,

  /**
      is not implemented for
                   [balanced binary trees][glib-Balanced-Binary-Trees].
                   For [n-ary trees][glib-N-ary-Trees], it
                   vists the root node first, then its children, then
                   its grandchildren, and so on. Note that this is less
                   efficient than the other orders.
  */
  LevelOrder = 3,
}

/**
    These are the possible line break classifications.
    
    Since new Unicode versions may add new types here, applications should be ready
    to handle unknown values. They may be regarded as [glib.types.UnicodeBreakType.Unknown].
    
    See [Unicode Line Breaking Algorithm](https://www.unicode.org/reports/tr14/).
*/
enum GUnicodeBreakType
{
  /**
      Mandatory Break (BK)
  */
  Mandatory = 0,

  /**
      Carriage Return (CR)
  */
  CarriageReturn = 1,

  /**
      Line Feed (LF)
  */
  LineFeed = 2,

  /**
      Attached Characters and Combining Marks (CM)
  */
  CombiningMark = 3,

  /**
      Surrogates (SG)
  */
  Surrogate = 4,

  /**
      Zero Width Space (ZW)
  */
  ZeroWidthSpace = 5,

  /**
      Inseparable (IN)
  */
  Inseparable = 6,

  /**
      Non-breaking ("Glue") (GL)
  */
  NonBreakingGlue = 7,

  /**
      Contingent Break Opportunity (CB)
  */
  Contingent = 8,

  /**
      Space (SP)
  */
  Space = 9,

  /**
      Break Opportunity After (BA)
  */
  After = 10,

  /**
      Break Opportunity Before (BB)
  */
  Before = 11,

  /**
      Break Opportunity Before and After (B2)
  */
  BeforeAndAfter = 12,

  /**
      Hyphen (HY)
  */
  Hyphen = 13,

  /**
      Nonstarter (NS)
  */
  NonStarter = 14,

  /**
      Opening Punctuation (OP)
  */
  OpenPunctuation = 15,

  /**
      Closing Punctuation (CL)
  */
  ClosePunctuation = 16,

  /**
      Ambiguous Quotation (QU)
  */
  Quotation = 17,

  /**
      Exclamation/Interrogation (EX)
  */
  Exclamation = 18,

  /**
      Ideographic (ID)
  */
  Ideographic = 19,

  /**
      Numeric (NU)
  */
  Numeric = 20,

  /**
      Infix Separator (Numeric) (IS)
  */
  InfixSeparator = 21,

  /**
      Symbols Allowing Break After (SY)
  */
  Symbol = 22,

  /**
      Ordinary Alphabetic and Symbol Characters (AL)
  */
  Alphabetic = 23,

  /**
      Prefix (Numeric) (PR)
  */
  Prefix = 24,

  /**
      Postfix (Numeric) (PO)
  */
  Postfix = 25,

  /**
      Complex Content Dependent (South East Asian) (SA)
  */
  ComplexContext = 26,

  /**
      Ambiguous (Alphabetic or Ideographic) (AI)
  */
  Ambiguous = 27,

  /**
      Unknown (XX)
  */
  Unknown = 28,

  /**
      Next Line (NL)
  */
  NextLine = 29,

  /**
      Word Joiner (WJ)
  */
  WordJoiner = 30,

  /**
      Hangul L Jamo (JL)
  */
  HangulLJamo = 31,

  /**
      Hangul V Jamo (JV)
  */
  HangulVJamo = 32,

  /**
      Hangul T Jamo (JT)
  */
  HangulTJamo = 33,

  /**
      Hangul LV Syllable (H2)
  */
  HangulLvSyllable = 34,

  /**
      Hangul LVT Syllable (H3)
  */
  HangulLvtSyllable = 35,

  /**
      Closing Parenthesis (CP). Since 2.28. Deprecated: 2.70: Use [glib.types.UnicodeBreakType.CloseParenthesis] instead.
  */
  CloseParanthesis = 36,

  /**
      Closing Parenthesis (CP). Since 2.70
  */
  CloseParenthesis = 36,

  /**
      Conditional Japanese Starter (CJ). Since: 2.32
  */
  ConditionalJapaneseStarter = 37,

  /**
      Hebrew Letter (HL). Since: 2.32
  */
  HebrewLetter = 38,

  /**
      Regional Indicator (RI). Since: 2.36
  */
  RegionalIndicator = 39,

  /**
      Emoji Base (EB). Since: 2.50
  */
  EmojiBase = 40,

  /**
      Emoji Modifier (EM). Since: 2.50
  */
  EmojiModifier = 41,

  /**
      Zero Width Joiner (ZWJ). Since: 2.50
  */
  ZeroWidthJoiner = 42,

  /**
      Aksara (AK). Since: 2.80
      @G_UNICODE_BREAK_AKSARA_PRE_BASE (AP). Since: 2.80
      @G_UNICODE_BREAK_AKSARA_START (AS). Since: 2.80
      @G_UNICODE_BREAK_VIRAMA_FINAL (VF). Since: 2.80
      @G_UNICODE_BREAK_VIRAMA (VI). Since: 2.80
  */
  Aksara = 43,

  /** */
  AksaraPreBase = 44,

  /** */
  AksaraStart = 45,

  /** */
  ViramaFinal = 46,

  /** */
  Virama = 47,
}

/**
    The #GUnicodeScript enumeration identifies different writing
    systems. The values correspond to the names as defined in the
    Unicode standard. The enumeration has been added in GLib 2.14,
    and is interchangeable with #PangoScript.
    
    Note that new types may be added in the future. Applications
    should be ready to handle unknown values.
    See [Unicode Standard Annex #24: Script names](http://www.unicode.org/reports/tr24/).
*/
enum GUnicodeScript
{
  /**
      a value never returned from [glib.global.unicharGetScript]
  */
  InvalidCode = -1,

  /**
      a character used by multiple different scripts
  */
  Common = 0,

  /**
      a mark glyph that takes its script from the
                                    base glyph to which it is attached
  */
  Inherited = 1,

  /**
      Arabic
  */
  Arabic = 2,

  /**
      Armenian
  */
  Armenian = 3,

  /**
      Bengali
  */
  Bengali = 4,

  /**
      Bopomofo
  */
  Bopomofo = 5,

  /**
      Cherokee
  */
  Cherokee = 6,

  /**
      Coptic
  */
  Coptic = 7,

  /**
      Cyrillic
  */
  Cyrillic = 8,

  /**
      Deseret
  */
  Deseret = 9,

  /**
      Devanagari
  */
  Devanagari = 10,

  /**
      Ethiopic
  */
  Ethiopic = 11,

  /**
      Georgian
  */
  Georgian = 12,

  /**
      Gothic
  */
  Gothic = 13,

  /**
      Greek
  */
  Greek = 14,

  /**
      Gujarati
  */
  Gujarati = 15,

  /**
      Gurmukhi
  */
  Gurmukhi = 16,

  /**
      Han
  */
  Han = 17,

  /**
      Hangul
  */
  Hangul = 18,

  /**
      Hebrew
  */
  Hebrew = 19,

  /**
      Hiragana
  */
  Hiragana = 20,

  /**
      Kannada
  */
  Kannada = 21,

  /**
      Katakana
  */
  Katakana = 22,

  /**
      Khmer
  */
  Khmer = 23,

  /**
      Lao
  */
  Lao = 24,

  /**
      Latin
  */
  Latin = 25,

  /**
      Malayalam
  */
  Malayalam = 26,

  /**
      Mongolian
  */
  Mongolian = 27,

  /**
      Myanmar
  */
  Myanmar = 28,

  /**
      Ogham
  */
  Ogham = 29,

  /**
      Old Italic
  */
  OldItalic = 30,

  /**
      Oriya
  */
  Oriya = 31,

  /**
      Runic
  */
  Runic = 32,

  /**
      Sinhala
  */
  Sinhala = 33,

  /**
      Syriac
  */
  Syriac = 34,

  /**
      Tamil
  */
  Tamil = 35,

  /**
      Telugu
  */
  Telugu = 36,

  /**
      Thaana
  */
  Thaana = 37,

  /**
      Thai
  */
  Thai = 38,

  /**
      Tibetan
  */
  Tibetan = 39,

  /**
      Canadian Aboriginal
  */
  CanadianAboriginal = 40,

  /**
      Yi
  */
  Yi = 41,

  /**
      Tagalog
  */
  Tagalog = 42,

  /**
      Hanunoo
  */
  Hanunoo = 43,

  /**
      Buhid
  */
  Buhid = 44,

  /**
      Tagbanwa
  */
  Tagbanwa = 45,

  /**
      Braille
  */
  Braille = 46,

  /**
      Cypriot
  */
  Cypriot = 47,

  /**
      Limbu
  */
  Limbu = 48,

  /**
      Osmanya
  */
  Osmanya = 49,

  /**
      Shavian
  */
  Shavian = 50,

  /**
      Linear B
  */
  LinearB = 51,

  /**
      Tai Le
  */
  TaiLe = 52,

  /**
      Ugaritic
  */
  Ugaritic = 53,

  /**
      New Tai Lue
  */
  NewTaiLue = 54,

  /**
      Buginese
  */
  Buginese = 55,

  /**
      Glagolitic
  */
  Glagolitic = 56,

  /**
      Tifinagh
  */
  Tifinagh = 57,

  /**
      Syloti Nagri
  */
  SylotiNagri = 58,

  /**
      Old Persian
  */
  OldPersian = 59,

  /**
      Kharoshthi
  */
  Kharoshthi = 60,

  /**
      an unassigned code point
  */
  Unknown = 61,

  /**
      Balinese
  */
  Balinese = 62,

  /**
      Cuneiform
  */
  Cuneiform = 63,

  /**
      Phoenician
  */
  Phoenician = 64,

  /**
      Phags-pa
  */
  PhagsPa = 65,

  /**
      N'Ko
  */
  Nko = 66,

  /**
      Kayah Li. Since 2.16.3
  */
  KayahLi = 67,

  /**
      Lepcha. Since 2.16.3
  */
  Lepcha = 68,

  /**
      Rejang. Since 2.16.3
  */
  Rejang = 69,

  /**
      Sundanese. Since 2.16.3
  */
  Sundanese = 70,

  /**
      Saurashtra. Since 2.16.3
  */
  Saurashtra = 71,

  /**
      Cham. Since 2.16.3
  */
  Cham = 72,

  /**
      Ol Chiki. Since 2.16.3
  */
  OlChiki = 73,

  /**
      Vai. Since 2.16.3
  */
  Vai = 74,

  /**
      Carian. Since 2.16.3
  */
  Carian = 75,

  /**
      Lycian. Since 2.16.3
  */
  Lycian = 76,

  /**
      Lydian. Since 2.16.3
  */
  Lydian = 77,

  /**
      Avestan. Since 2.26
  */
  Avestan = 78,

  /**
      Bamum. Since 2.26
  */
  Bamum = 79,

  /**
      Egyptian Hieroglpyhs. Since 2.26
  */
  EgyptianHieroglyphs = 80,

  /**
      Imperial Aramaic. Since 2.26
  */
  ImperialAramaic = 81,

  /**
      Inscriptional Pahlavi. Since 2.26
  */
  InscriptionalPahlavi = 82,

  /**
      Inscriptional Parthian. Since 2.26
  */
  InscriptionalParthian = 83,

  /**
      Javanese. Since 2.26
  */
  Javanese = 84,

  /**
      Kaithi. Since 2.26
  */
  Kaithi = 85,

  /**
      Lisu. Since 2.26
  */
  Lisu = 86,

  /**
      Meetei Mayek. Since 2.26
  */
  MeeteiMayek = 87,

  /**
      Old South Arabian. Since 2.26
  */
  OldSouthArabian = 88,

  /**
      Old Turkic. Since 2.28
  */
  OldTurkic = 89,

  /**
      Samaritan. Since 2.26
  */
  Samaritan = 90,

  /**
      Tai Tham. Since 2.26
  */
  TaiTham = 91,

  /**
      Tai Viet. Since 2.26
  */
  TaiViet = 92,

  /**
      Batak. Since 2.28
  */
  Batak = 93,

  /**
      Brahmi. Since 2.28
  */
  Brahmi = 94,

  /**
      Mandaic. Since 2.28
  */
  Mandaic = 95,

  /**
      Chakma. Since: 2.32
  */
  Chakma = 96,

  /**
      Meroitic Cursive. Since: 2.32
  */
  MeroiticCursive = 97,

  /**
      Meroitic Hieroglyphs. Since: 2.32
  */
  MeroiticHieroglyphs = 98,

  /**
      Miao. Since: 2.32
  */
  Miao = 99,

  /**
      Sharada. Since: 2.32
  */
  Sharada = 100,

  /**
      Sora Sompeng. Since: 2.32
  */
  SoraSompeng = 101,

  /**
      Takri. Since: 2.32
  */
  Takri = 102,

  /**
      Bassa. Since: 2.42
  */
  BassaVah = 103,

  /**
      Caucasian Albanian. Since: 2.42
  */
  CaucasianAlbanian = 104,

  /**
      Duployan. Since: 2.42
  */
  Duployan = 105,

  /**
      Elbasan. Since: 2.42
  */
  Elbasan = 106,

  /**
      Grantha. Since: 2.42
  */
  Grantha = 107,

  /**
      Kjohki. Since: 2.42
  */
  Khojki = 108,

  /**
      Khudawadi, Sindhi. Since: 2.42
  */
  Khudawadi = 109,

  /**
      Linear A. Since: 2.42
  */
  LinearA = 110,

  /**
      Mahajani. Since: 2.42
  */
  Mahajani = 111,

  /**
      Manichaean. Since: 2.42
  */
  Manichaean = 112,

  /**
      Mende Kikakui. Since: 2.42
  */
  MendeKikakui = 113,

  /**
      Modi. Since: 2.42
  */
  Modi = 114,

  /**
      Mro. Since: 2.42
  */
  Mro = 115,

  /**
      Nabataean. Since: 2.42
  */
  Nabataean = 116,

  /**
      Old North Arabian. Since: 2.42
  */
  OldNorthArabian = 117,

  /**
      Old Permic. Since: 2.42
  */
  OldPermic = 118,

  /**
      Pahawh Hmong. Since: 2.42
  */
  PahawhHmong = 119,

  /**
      Palmyrene. Since: 2.42
  */
  Palmyrene = 120,

  /**
      Pau Cin Hau. Since: 2.42
  */
  PauCinHau = 121,

  /**
      Psalter Pahlavi. Since: 2.42
  */
  PsalterPahlavi = 122,

  /**
      Siddham. Since: 2.42
  */
  Siddham = 123,

  /**
      Tirhuta. Since: 2.42
  */
  Tirhuta = 124,

  /**
      Warang Citi. Since: 2.42
  */
  WarangCiti = 125,

  /**
      Ahom. Since: 2.48
  */
  Ahom = 126,

  /**
      Anatolian Hieroglyphs. Since: 2.48
  */
  AnatolianHieroglyphs = 127,

  /**
      Hatran. Since: 2.48
  */
  Hatran = 128,

  /**
      Multani. Since: 2.48
  */
  Multani = 129,

  /**
      Old Hungarian. Since: 2.48
  */
  OldHungarian = 130,

  /**
      Signwriting. Since: 2.48
  */
  Signwriting = 131,

  /**
      Adlam. Since: 2.50
  */
  Adlam = 132,

  /**
      Bhaiksuki. Since: 2.50
  */
  Bhaiksuki = 133,

  /**
      Marchen. Since: 2.50
  */
  Marchen = 134,

  /**
      Newa. Since: 2.50
  */
  Newa = 135,

  /**
      Osage. Since: 2.50
  */
  Osage = 136,

  /**
      Tangut. Since: 2.50
  */
  Tangut = 137,

  /**
      Masaram Gondi. Since: 2.54
  */
  MasaramGondi = 138,

  /**
      Nushu. Since: 2.54
  */
  Nushu = 139,

  /**
      Soyombo. Since: 2.54
  */
  Soyombo = 140,

  /**
      Zanabazar Square. Since: 2.54
  */
  ZanabazarSquare = 141,

  /**
      Dogra. Since: 2.58
  */
  Dogra = 142,

  /**
      Gunjala Gondi. Since: 2.58
  */
  GunjalaGondi = 143,

  /**
      Hanifi Rohingya. Since: 2.58
  */
  HanifiRohingya = 144,

  /**
      Makasar. Since: 2.58
  */
  Makasar = 145,

  /**
      Medefaidrin. Since: 2.58
  */
  Medefaidrin = 146,

  /**
      Old Sogdian. Since: 2.58
  */
  OldSogdian = 147,

  /**
      Sogdian. Since: 2.58
  */
  Sogdian = 148,

  /**
      Elym. Since: 2.62
  */
  Elymaic = 149,

  /**
      Nand. Since: 2.62
  */
  Nandinagari = 150,

  /**
      Rohg. Since: 2.62
  */
  NyiakengPuachueHmong = 151,

  /**
      Wcho. Since: 2.62
  */
  Wancho = 152,

  /**
      Chorasmian. Since: 2.66
  */
  Chorasmian = 153,

  /**
      Dives Akuru. Since: 2.66
  */
  DivesAkuru = 154,

  /**
      Khitan small script. Since: 2.66
  */
  KhitanSmallScript = 155,

  /**
      Yezidi. Since: 2.66
  */
  Yezidi = 156,

  /**
      Cypro-Minoan. Since: 2.72
  */
  CyproMinoan = 157,

  /**
      Old Uyghur. Since: 2.72
  */
  OldUyghur = 158,

  /**
      Tangsa. Since: 2.72
  */
  Tangsa = 159,

  /**
      Toto. Since: 2.72
  */
  Toto = 160,

  /**
      Vithkuqi. Since: 2.72
  */
  Vithkuqi = 161,

  /**
      Mathematical notation. Since: 2.72
  */
  Math = 162,

  /**
      Kawi. Since 2.74
  */
  Kawi = 163,

  /**
      Nag Mundari. Since 2.74
  */
  NagMundari = 164,
}

/**
    These are the possible character classifications from the
    Unicode specification.
    See [Unicode Character Database](http://www.unicode.org/reports/tr44/#General_Category_Values).
*/
enum GUnicodeType
{
  /**
      General category "Other, Control" (Cc)
  */
  Control = 0,

  /**
      General category "Other, Format" (Cf)
  */
  Format = 1,

  /**
      General category "Other, Not Assigned" (Cn)
  */
  Unassigned = 2,

  /**
      General category "Other, Private Use" (Co)
  */
  PrivateUse = 3,

  /**
      General category "Other, Surrogate" (Cs)
  */
  Surrogate = 4,

  /**
      General category "Letter, Lowercase" (Ll)
  */
  LowercaseLetter = 5,

  /**
      General category "Letter, Modifier" (Lm)
  */
  ModifierLetter = 6,

  /**
      General category "Letter, Other" (Lo)
  */
  OtherLetter = 7,

  /**
      General category "Letter, Titlecase" (Lt)
  */
  TitlecaseLetter = 8,

  /**
      General category "Letter, Uppercase" (Lu)
  */
  UppercaseLetter = 9,

  /**
      General category "Mark, Spacing" (Mc)
  */
  SpacingMark = 10,

  /**
      General category "Mark, Enclosing" (Me)
  */
  EnclosingMark = 11,

  /**
      General category "Mark, Nonspacing" (Mn)
  */
  NonSpacingMark = 12,

  /**
      General category "Number, Decimal Digit" (Nd)
  */
  DecimalNumber = 13,

  /**
      General category "Number, Letter" (Nl)
  */
  LetterNumber = 14,

  /**
      General category "Number, Other" (No)
  */
  OtherNumber = 15,

  /**
      General category "Punctuation, Connector" (Pc)
  */
  ConnectPunctuation = 16,

  /**
      General category "Punctuation, Dash" (Pd)
  */
  DashPunctuation = 17,

  /**
      General category "Punctuation, Close" (Pe)
  */
  ClosePunctuation = 18,

  /**
      General category "Punctuation, Final quote" (Pf)
  */
  FinalPunctuation = 19,

  /**
      General category "Punctuation, Initial quote" (Pi)
  */
  InitialPunctuation = 20,

  /**
      General category "Punctuation, Other" (Po)
  */
  OtherPunctuation = 21,

  /**
      General category "Punctuation, Open" (Ps)
  */
  OpenPunctuation = 22,

  /**
      General category "Symbol, Currency" (Sc)
  */
  CurrencySymbol = 23,

  /**
      General category "Symbol, Modifier" (Sk)
  */
  ModifierSymbol = 24,

  /**
      General category "Symbol, Math" (Sm)
  */
  MathSymbol = 25,

  /**
      General category "Symbol, Other" (So)
  */
  OtherSymbol = 26,

  /**
      General category "Separator, Line" (Zl)
  */
  LineSeparator = 27,

  /**
      General category "Separator, Paragraph" (Zp)
  */
  ParagraphSeparator = 28,

  /**
      General category "Separator, Space" (Zs)
  */
  SpaceSeparator = 29,
}

/**
    Mnemonic constants for the ends of a Unix pipe.
*/
enum GUnixPipeEnd
{
  /**
      The readable file descriptor 0
  */
  Read = 0,

  /**
      The writable file descriptor 1
  */
  Write = 1,
}

/**
    Error codes returned by #GUri methods.
*/
enum GUriError
{
  /**
      Generic error if no more specific error is available.
          See the error message for details.
  */
  Failed = 0,

  /**
      The scheme of a URI could not be parsed.
  */
  BadScheme = 1,

  /**
      The user/userinfo of a URI could not be parsed.
  */
  BadUser = 2,

  /**
      The password of a URI could not be parsed.
  */
  BadPassword = 3,

  /**
      The authentication parameters of a URI could not be parsed.
  */
  BadAuthParams = 4,

  /**
      The host of a URI could not be parsed.
  */
  BadHost = 5,

  /**
      The port of a URI could not be parsed.
  */
  BadPort = 6,

  /**
      The path of a URI could not be parsed.
  */
  BadPath = 7,

  /**
      The query of a URI could not be parsed.
  */
  BadQuery = 8,

  /**
      The fragment of a URI could not be parsed.
  */
  BadFragment = 9,
}

/**
    Flags that describe a URI.
    
    When parsing a URI, if you need to choose different flags based on
    the type of URI, you can use [glib.uri.Uri.peekScheme] on the URI string
    to check the scheme first, and use that to decide what flags to
    parse it with.
*/
enum GUriFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Parse the URI more relaxedly than the
          [RFC 3986](https://tools.ietf.org/html/rfc3986) grammar specifies,
          fixing up or ignoring common mistakes in URIs coming from external
          sources. This is also needed for some obscure URI schemes where `;`
          separates the host from the path. Don’t use this flag unless you need to.
  */
  ParseRelaxed = 1,

  /**
      The userinfo field may contain a password,
          which will be separated from the username by `:`.
  */
  HasPassword = 2,

  /**
      The userinfo may contain additional
          authentication-related parameters, which will be separated from
          the username and/or password by `;`.
  */
  HasAuthParams = 4,

  /**
      When parsing a URI, this indicates that `%`-encoded
          characters in the userinfo, path, query, and fragment fields
          should not be decoded. (And likewise the host field if
          `G_URI_FLAGS_NON_DNS` is also set.) When building a URI, it indicates
          that you have already `%`-encoded the components, and so #GUri
          should not do any encoding itself.
  */
  Encoded = 8,

  /**
      The host component should not be assumed to be a
          DNS hostname or IP address (for example, for `smb` URIs with NetBIOS
          hostnames).
  */
  NonDns = 16,

  /**
      Same as `G_URI_FLAGS_ENCODED`, for the query
          field only.
  */
  EncodedQuery = 32,

  /**
      Same as `G_URI_FLAGS_ENCODED`, for the path only.
  */
  EncodedPath = 64,

  /**
      Same as `G_URI_FLAGS_ENCODED`, for the
          fragment only.
  */
  EncodedFragment = 128,

  /**
      A scheme-based normalization will be applied.
          For example, when parsing an HTTP URI changing omitted path to `/` and
          omitted port to `80`; and when building a URI, changing empty path to `/`
          and default port `80`). This only supports a subset of known schemes. (Since: 2.68)
  */
  SchemeNormalize = 256,
}

/**
    Flags describing what parts of the URI to hide in
    [glib.uri.Uri.toStringPartial]. Note that `G_URI_HIDE_PASSWORD` and
    `G_URI_HIDE_AUTH_PARAMS` will only work if the #GUri was parsed with
    the corresponding flags.
*/
enum GUriHideFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Hide the userinfo.
  */
  Userinfo = 1,

  /**
      Hide the password.
  */
  Password = 2,

  /**
      Hide the auth_params.
  */
  AuthParams = 4,

  /**
      Hide the query.
  */
  Query = 8,

  /**
      Hide the fragment.
  */
  Fragment = 16,
}

/**
    Flags modifying the way parameters are handled by [glib.uri.Uri.parseParams] and
    #GUriParamsIter.
*/
enum GUriParamsFlags : uint
{
  /**
      No flags set.
  */
  None = 0,

  /**
      Parameter names are case insensitive.
  */
  CaseInsensitive = 1,

  /**
      Replace `+` with space character. Only useful for
          URLs on the web, using the `https` or `http` schemas.
  */
  WwwForm = 2,

  /**
      See `G_URI_FLAGS_PARSE_RELAXED`.
  */
  ParseRelaxed = 4,
}

/**
    These are logical ids for special directories which are defined
    depending on the platform used. You should use [glib.global.getUserSpecialDir]
    to retrieve the full path associated to the logical id.
    
    The #GUserDirectory enumeration can be extended at later date. Not
    every platform has a directory for every logical id in this
    enumeration.
*/
enum GUserDirectory
{
  /**
      the user's Desktop directory
  */
  DirectoryDesktop = 0,

  /**
      the user's Documents directory
  */
  DirectoryDocuments = 1,

  /**
      the user's Downloads directory
  */
  DirectoryDownload = 2,

  /**
      the user's Music directory
  */
  DirectoryMusic = 3,

  /**
      the user's Pictures directory
  */
  DirectoryPictures = 4,

  /**
      the user's shared directory
  */
  DirectoryPublicShare = 5,

  /**
      the user's Templates directory
  */
  DirectoryTemplates = 6,

  /**
      the user's Movies directory
  */
  DirectoryVideos = 7,

  /**
      the number of enum values
  */
  NDirectories = 8,
}

/**
    The range of possible top-level types of #GVariant instances.
*/
enum GVariantClass
{
  /**
      The #GVariant is a boolean.
  */
  Boolean = 98,

  /**
      The #GVariant is a byte.
  */
  Byte = 121,

  /**
      The #GVariant is a signed 16 bit integer.
  */
  Int16 = 110,

  /**
      The #GVariant is an unsigned 16 bit integer.
  */
  Uint16 = 113,

  /**
      The #GVariant is a signed 32 bit integer.
  */
  Int32 = 105,

  /**
      The #GVariant is an unsigned 32 bit integer.
  */
  Uint32 = 117,

  /**
      The #GVariant is a signed 64 bit integer.
  */
  Int64 = 120,

  /**
      The #GVariant is an unsigned 64 bit integer.
  */
  Uint64 = 116,

  /**
      The #GVariant is a file handle index.
  */
  Handle = 104,

  /**
      The #GVariant is a double precision floating
                               point value.
  */
  Double = 100,

  /**
      The #GVariant is a normal string.
  */
  String = 115,

  /**
      The #GVariant is a D-Bus object path
                                    string.
  */
  ObjectPath = 111,

  /**
      The #GVariant is a D-Bus signature string.
  */
  Signature = 103,

  /**
      The #GVariant is a variant.
  */
  Variant = 118,

  /**
      The #GVariant is a maybe-typed value.
  */
  Maybe = 109,

  /**
      The #GVariant is an array.
  */
  Array = 97,

  /**
      The #GVariant is a tuple.
  */
  Tuple = 40,

  /**
      The #GVariant is a dictionary entry.
  */
  DictEntry = 123,
}

/**
    Error codes returned by parsing text-format GVariants.
*/
enum GVariantParseError
{
  /**
      generic error (unused)
  */
  Failed = 0,

  /**
      a non-basic #GVariantType was given where a basic type was expected
  */
  BasicTypeExpected = 1,

  /**
      cannot infer the #GVariantType
  */
  CannotInferType = 2,

  /**
      an indefinite #GVariantType was given where a definite type was expected
  */
  DefiniteTypeExpected = 3,

  /**
      extra data after parsing finished
  */
  InputNotAtEnd = 4,

  /**
      invalid character in number or unicode escape
  */
  InvalidCharacter = 5,

  /**
      not a valid #GVariant format string
  */
  InvalidFormatString = 6,

  /**
      not a valid object path
  */
  InvalidObjectPath = 7,

  /**
      not a valid type signature
  */
  InvalidSignature = 8,

  /**
      not a valid #GVariant type string
  */
  InvalidTypeString = 9,

  /**
      could not find a common type for array entries
  */
  NoCommonType = 10,

  /**
      the numerical value is out of range of the given type
  */
  NumberOutOfRange = 11,

  /**
      the numerical value is out of range for any type
  */
  NumberTooBig = 12,

  /**
      cannot parse as variant of the specified type
  */
  TypeError = 13,

  /**
      an unexpected token was encountered
  */
  UnexpectedToken = 14,

  /**
      an unknown keyword was encountered
  */
  UnknownKeyword = 15,

  /**
      unterminated string constant
  */
  UnterminatedStringConstant = 16,

  /**
      no value given
  */
  ValueExpected = 17,

  /**
      variant was too deeply nested; #GVariant is only guaranteed to handle nesting up to 64 levels (Since: 2.64)
  */
  Recursion = 18,
}

/** */
struct GAllocator;

/**
    Contains the public fields of a GArray.
*/
struct GArray
{
  /**
      a pointer to the element data. The data may be moved as
          elements are added to the #GArray.
  */
  char* data;

  /**
      the number of elements in the #GArray not including the
          possible terminating zero element.
  */
  uint len;
}

/**
    An opaque data structure which represents an asynchronous queue.
    
    It should only be accessed through the `g_async_queue_*` functions.
*/
struct GAsyncQueue;

/**
    [glib.bookmark_file.BookmarkFile] lets you parse, edit or create files containing bookmarks.
    
    Bookmarks refer to a URI, along with some meta-data about the resource
    pointed by the URI like its MIME type, the application that is registering
    the bookmark and the icon that should be used to represent the bookmark.
    The data is stored using the
    [Desktop Bookmark Specification](http://www.gnome.org/~ebassi/bookmark-spec).
    
    The syntax of the bookmark files is described in detail inside the
    Desktop Bookmark Specification, here is a quick summary: bookmark
    files use a sub-class of the XML Bookmark Exchange Language
    specification, consisting of valid UTF-8 encoded XML, under the
    `<xbel>` root element; each bookmark is stored inside a
    `<bookmark>` element, using its URI: no relative paths can
    be used inside a bookmark file. The bookmark may have a user defined
    title and description, to be used instead of the URI. Under the
    `<metadata>` element, with its owner attribute set to
    `http://freedesktop.org`, is stored the meta-data about a resource
    pointed by its URI. The meta-data consists of the resource's MIME
    type; the applications that have registered a bookmark; the groups
    to which a bookmark belongs to; a visibility flag, used to set the
    bookmark as "private" to the applications and groups that has it
    registered; the URI and MIME type of an icon, to be used when
    displaying the bookmark inside a GUI.
    
    Here is an example of a bookmark file:
    [bookmarks.xbel](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/glib/tests/bookmarks.xbel)
    
    A bookmark file might contain more than one bookmark; each bookmark
    is accessed through its URI.
    
    The important caveat of bookmark files is that when you add a new
    bookmark you must also add the application that is registering it, using
    [glib.bookmark_file.BookmarkFile.addApplication] or [glib.bookmark_file.BookmarkFile.setApplicationInfo].
    If a bookmark has no applications then it won't be dumped when creating
    the on disk representation, using [glib.bookmark_file.BookmarkFile.toData] or
    [glib.bookmark_file.BookmarkFile.toFile].
*/
struct GBookmarkFile;

/**
    Contains the public fields of a GByteArray.
*/
struct GByteArray
{
  /**
      a pointer to the element data. The data may be moved as
          elements are added to the #GByteArray
  */
  ubyte* data;

  /**
      the number of elements in the #GByteArray
  */
  uint len;
}

/**
    A simple refcounted data type representing an immutable sequence of zero or
    more bytes from an unspecified origin.
    
    The purpose of a #GBytes is to keep the memory region that it holds
    alive for as long as anyone holds a reference to the bytes.  When
    the last reference count is dropped, the memory is released. Multiple
    unrelated callers can use byte data in the #GBytes without coordinating
    their activities, resting assured that the byte data will not change or
    move while they hold a reference.
    
    A #GBytes can come from many different origins that may have
    different procedures for freeing the memory region.  Examples are
    memory from [glib.global.gmalloc], from memory slices, from a #GMappedFile or
    memory from other allocators.
    
    #GBytes work well as keys in #GHashTable. Use [glib.bytes.Bytes.equal] and
    [glib.bytes.Bytes.hash] as parameters to [glib.hash_table.HashTable.new_] or [glib.hash_table.HashTable.newFull].
    #GBytes can also be used as keys in a #GTree by passing the [glib.bytes.Bytes.compare]
    function to [glib.tree.Tree.new_].
    
    The data pointed to by this bytes must not be modified. For a mutable
    array of bytes see #GByteArray. Use [glib.bytes.Bytes.unrefToArray] to create a
    mutable array for a #GBytes sequence. To create an immutable #GBytes from
    a mutable #GByteArray, use the [glib.byte_array.ByteArray.freeToBytes] function.
*/
struct GBytes;

/**
    A [glib.cache.Cache] allows sharing of complex data structures, in order to
    save system resources.
    
    [glib.cache.Cache] uses keys and values. A [glib.cache.Cache] key describes the properties
    of a particular resource. A [glib.cache.Cache] value is the actual resource.
    
    [glib.cache.Cache] has been marked as deprecated, since this API is rarely
    used and not very actively maintained.

    Deprecated: Use a #GHashTable instead
*/
struct GCache;

/**
    GLib provides a generic API for computing checksums (or ‘digests’)
    for a sequence of arbitrary bytes, using various hashing algorithms
    like MD5, SHA-1 and SHA-256. Checksums are commonly used in various
    environments and specifications.
    
    To create a new [glib.checksum.Checksum], use [glib.checksum.Checksum.new_]. To free
    a [glib.checksum.Checksum], use [glib.checksum.Checksum.free].
    
    GLib supports incremental checksums using the [glib.checksum.Checksum] data
    structure, by calling [glib.checksum.Checksum.update] as long as there’s data
    available and then using [glib.checksum.Checksum.getString] or
    [glib.checksum.Checksum.getDigest] to compute the checksum and return it
    either as a string in hexadecimal form, or as a raw sequence of bytes. To
    compute the checksum for binary blobs and nul-terminated strings in
    one go, use the convenience functions `func@GLib.compute_checksum_for_data`
    and `func@GLib.compute_checksum_for_string`, respectively.
*/
struct GChecksum;

/**
    [glib.completion.Completion] provides support for automatic completion of a string
    using any group of target strings. It is typically used for file
    name completion as is common in many UNIX shells.
    
    A [glib.completion.Completion] is created using [glib.completion.Completion.new_]. Target items are
    added and removed with [glib.completion.Completion.addItems],
    [glib.completion.Completion.removeItems] and
    [glib.completion.Completion.clearItems]. A completion attempt is requested with
    [glib.completion.Completion.complete] or [glib.completion.Completion.completeUtf8].
    When no longer needed, the [glib.completion.Completion] is freed with
    [glib.completion.Completion.free].
    
    Items in the completion can be simple strings (e.g. filenames), or
    pointers to arbitrary data structures. If data structures are used
    you must provide a [glib.types.CompletionFunc] in [glib.completion.Completion.new_],
    which retrieves the item’s string from the data structure. You can change
    the way in which strings are compared by setting a different
    [glib.types.CompletionStrncmpFunc] in [glib.completion.Completion.setCompare].
    
    [glib.completion.Completion] has been marked as deprecated, since this API is rarely
    used and not very actively maintained.

    Deprecated: Rarely used API
*/
struct GCompletion
{
  /**
      list of target items (strings or data structures).
  */
  GList* items;

  /**
      function which is called to get the string associated with a
             target item. It is null if the target items are strings.
  */
  GCompletionFunc func;

  /**
      the last prefix passed to [glib.completion.Completion.complete] or
               [glib.completion.Completion.completeUtf8].
  */
  char* prefix;

  /**
      the list of items which begin with @prefix.
  */
  GList* cache;

  /**
      The function to use when comparing strings.  Use
                     [glib.completion.Completion.setCompare] to modify this function.
  */
  GCompletionStrncmpFunc strncmpFunc;
}

/**
    The #GCond struct is an opaque data structure that represents a
    condition. Threads can block on a #GCond if they find a certain
    condition to be false. If other threads change the state of this
    condition they signal the #GCond, and that causes the waiting
    threads to be woken up.
    
    Consider the following example of a shared variable.  One or more
    threads can wait for data to be published to the variable and when
    another thread publishes the data, it can signal one of the waiting
    threads to wake up to collect the data.
    
    Here is an example for using GCond to block a thread until a condition
    is satisfied:
    ```c
      gpointer current_data = NULL;
      GMutex data_mutex;
      GCond data_cond;
    
      void
      push_data (gpointer data)
      {
        g_mutex_lock (&data_mutex);
        current_data = data;
        g_cond_signal (&data_cond);
        g_mutex_unlock (&data_mutex);
      }
    
      gpointer
      pop_data (void)
      {
        gpointer data;
    
        g_mutex_lock (&data_mutex);
        while (!current_data)
          g_cond_wait (&data_cond, &data_mutex);
        data = current_data;
        current_data = NULL;
        g_mutex_unlock (&data_mutex);
    
        return data;
      }
    ```
    Whenever a thread calls pop_data() now, it will wait until
    current_data is non-null, i.e. until some other thread
    has called push_data().
    
    The example shows that use of a condition variable must always be
    paired with a mutex.  Without the use of a mutex, there would be a
    race between the check of @current_data by the while loop in
    pop_data() and waiting. Specifically, another thread could set
    @current_data after the check, and signal the cond (with nobody
    waiting on it) before the first thread goes to sleep. #GCond is
    specifically useful for its ability to release the mutex and go
    to sleep atomically.
    
    It is also important to use the [glib.cond.Cond.wait] and [glib.cond.Cond.waitUntil]
    functions only inside a loop which checks for the condition to be
    true.  See [glib.cond.Cond.wait] for an explanation of why the condition may
    not be true even after it returns.
    
    If a #GCond is allocated in static storage then it can be used
    without initialisation.  Otherwise, you should call [glib.cond.Cond.init_]
    on it and [glib.cond.Cond.clear] when done.
    
    A #GCond should only be accessed via the g_cond_ functions.
*/
struct GCond
{
  /** */
  void* p;

  /** */
  uint[2] i;
}

/**
    An opaque data structure that represents a keyed data list.
    
    See also: [Keyed data lists](datalist-and-dataset.html).
*/
struct GData;

/**
    [glib.date.Date] is a struct for calendrical calculations.
    
    The [glib.date.Date] data structure represents a day between January 1, Year 1,
    and sometime a few thousand years in the future (right now it will go
    to the year 65535 or so, but [glib.date.Date.setParse] only parses up to the
    year 8000 or so - just count on "a few thousand"). [glib.date.Date] is meant to
    represent everyday dates, not astronomical dates or historical dates
    or ISO timestamps or the like. It extrapolates the current Gregorian
    calendar forward and backward in time; there is no attempt to change
    the calendar to match time periods or locations. [glib.date.Date] does not store
    time information; it represents a day.
    
    The [glib.date.Date] implementation has several nice features; it is only a
    64-bit struct, so storing large numbers of dates is very efficient. It
    can keep both a Julian and day-month-year representation of the date,
    since some calculations are much easier with one representation or the
    other. A Julian representation is simply a count of days since some
    fixed day in the past; for #GDate the fixed day is January 1, 1 AD.
    ("Julian" dates in the #GDate API aren't really Julian dates in the
    technical sense; technically, Julian dates count from the start of the
    Julian period, Jan 1, 4713 BC).
    
    [glib.date.Date] is simple to use. First you need a "blank" date; you can get a
    dynamically allocated date from [glib.date.Date.new_], or you can declare an
    automatic variable or array and initialize it by calling [glib.date.Date.clear].
    A cleared date is safe; it's safe to call [glib.date.Date.setDmy] and the other
    mutator functions to initialize the value of a cleared date. However, a cleared date
    is initially invalid, meaning that it doesn't represent a day that exists.
    It is undefined to call any of the date calculation routines on an invalid date.
    If you obtain a date from a user or other unpredictable source, you should check
    its validity with the [glib.date.Date.valid] predicate. [glib.date.Date.valid]
    is also used to check for errors with [glib.date.Date.setParse] and other functions
    that can fail. Dates can be invalidated by calling [glib.date.Date.clear] again.
    
    It is very important to use the API to access the [glib.date.Date] struct. Often only the
    day-month-year or only the Julian representation is valid. Sometimes neither is valid.
    Use the API.
    
    GLib also features [glib.date_time.DateTime] which represents a precise time.
*/
struct GDate
{
  /**
      the Julian representation of the date
  */
  uint julianDays;

  /**
      this bit is set if @julian_days is valid
  */
  uint julian;

  /**
      this is set if @day, @month and @year are valid
  */
  uint dmy;

  /**
      the day of the day-month-year representation of the date,
        as a number between 1 and 31
  */
  uint day;

  /**
      the month of the day-month-year representation of the date,
        as a number between 1 and 12
  */
  uint month;

  /**
      the year of the day-month-year representation of the date
  */
  uint year;
}

/**
    [glib.date_time.DateTime] is a structure that combines a Gregorian date and time
    into a single structure.
    
    [glib.date_time.DateTime] provides many conversion and methods to manipulate dates and times.
    Time precision is provided down to microseconds and the time can range
    (proleptically) from 0001-01-01 00:00:00 to 9999-12-31 23:59:59.999999.
    [glib.date_time.DateTime] follows POSIX time in the sense that it is oblivious to leap
    seconds.
    
    [glib.date_time.DateTime] is an immutable object; once it has been created it cannot
    be modified further. All modifiers will create a new [glib.date_time.DateTime].
    Nearly all such functions can fail due to the date or time going out
    of range, in which case null will be returned.
    
    [glib.date_time.DateTime] is reference counted: the reference count is increased by calling
    [glib.date_time.DateTime.ref_] and decreased by calling [glib.date_time.DateTime.unref].
    When the reference count drops to 0, the resources allocated by the [glib.date_time.DateTime]
    structure are released.
    
    Many parts of the API may produce non-obvious results. As an
    example, adding two months to January 31st will yield March 31st
    whereas adding one month and then one month again will yield either
    March 28th or March 29th.  Also note that adding 24 hours is not
    always the same as adding one day (since days containing daylight
    savings time transitions are either 23 or 25 hours in length).
*/
struct GDateTime;

/**
    Associates a string with a bit flag.
    Used in [glib.global.parseDebugString].
*/
struct GDebugKey
{
  /**
      the string
  */
  const(char)* key;

  /**
      the flag
  */
  uint value;
}

/**
    An opaque structure representing an opened directory.
*/
struct GDir;

/**
    The [glib.error.ErrorWrap] structure contains information about
    an error that has occurred.
*/
struct GError
{
  /**
      error domain, e.g. `G_FILE_ERROR`
  */
  GQuark domain;

  /**
      error code, e.g. `G_FILE_ERROR_NOENT`
  */
  int code;

  /**
      human-readable informative error message
  */
  char* message;
}

/**
    The #GHashTable struct is an opaque data structure to represent a
    [Hash Table][glib-Hash-Tables]. It should only be accessed via the
    following functions.
*/
struct GHashTable;

/**
    A GHashTableIter structure represents an iterator that can be used
    to iterate over the elements of a #GHashTable. GHashTableIter
    structures are typically allocated on the stack and then initialized
    with [glib.hash_table_iter.HashTableIter.init_].
    
    The iteration order of a #GHashTableIter over the keys/values in a hash
    table is not defined.
*/
struct GHashTableIter
{
  /** */
  void* dummy1;

  /** */
  void* dummy2;

  /** */
  void* dummy3;

  /** */
  int dummy4;

  /** */
  gboolean dummy5;

  /** */
  void* dummy6;
}

/**
    HMACs should be used when producing a cookie or hash based on data
    and a key. Simple mechanisms for using SHA1 and other algorithms to
    digest a key and data together are vulnerable to various security
    issues.
    [HMAC](http://en.wikipedia.org/wiki/HMAC)
    uses algorithms like SHA1 in a secure way to produce a digest of a
    key and data.
    
    Both the key and data are arbitrary byte arrays of bytes or characters.
    
    Support for HMAC Digests has been added in GLib 2.30, and support for SHA-512
    in GLib 2.42. Support for SHA-384 was added in GLib 2.52.
    
    To create a new [glib.hmac.Hmac], use [glib.hmac.Hmac.new_]. To free a [glib.hmac.Hmac], use
    [glib.hmac.Hmac.unref].
*/
struct GHmac;

/**
    The #GHook struct represents a single hook function in a #GHookList.
*/
struct GHook
{
  /**
      data which is passed to func when this hook is invoked
  */
  void* data;

  /**
      pointer to the next hook in the list
  */
  GHook* next;

  /**
      pointer to the previous hook in the list
  */
  GHook* prev;

  /**
      the reference count of this hook
  */
  uint refCount;

  /**
      the id of this hook, which is unique within its list
  */
  gulong hookId;

  /**
      flags which are set for this hook. See #GHookFlagMask for
          predefined flags
  */
  uint flags;

  /**
      the function to call when this hook is invoked. The possible
          signatures for this function are #GHookFunc and #GHookCheckFunc
  */
  void* func;

  /**
      the default @finalize_hook function of a #GHookList calls
          this member of the hook that is being finalized
  */
  GDestroyNotify destroy;
}

/**
    The #GHookList struct represents a list of hook functions.
*/
struct GHookList
{
  /**
      the next free #GHook id
  */
  gulong seqId;

  /**
      the size of the #GHookList elements, in bytes
  */
  uint hookSize;

  /**
      1 if the #GHookList has been initialized
  */
  uint isSetup;

  /**
      the first #GHook element in the list
  */
  GHook* hooks;

  /**
      unused
  */
  void* dummy3;

  /**
      the function to call to finalize a #GHook element.
          The default behaviour is to call the hooks @destroy function
  */
  GHookFinalizeFunc finalizeHook;

  /**
      unused
  */
  void*[2] dummy;
}

/**
    The [glib.iochannel.IOChannel] data type aims to provide a portable method for
    using file descriptors, pipes, and sockets, and integrating them
    into the main event loop (see [glib.main_context.MainContext]). Currently,
    full support is available on UNIX platforms; support for Windows
    is only partially complete.
    
    To create a new [glib.iochannel.IOChannel] on UNIX systems use
    [glib.iochannel.IOChannel.unixNew]. This works for plain file descriptors,
    pipes and sockets. Alternatively, a channel can be created for a
    file in a system independent manner using [glib.iochannel.IOChannel.newFile].
    
    Once a [glib.iochannel.IOChannel] has been created, it can be used in a generic
    manner with the functions [glib.iochannel.IOChannel.readChars],
    [glib.iochannel.IOChannel.writeChars], [glib.iochannel.IOChannel.seekPosition],
    and [glib.iochannel.IOChannel.shutdown].
    
    To add a [glib.iochannel.IOChannel] to the main event loop, use `func@GLib.io_add_watch` or
    `func@GLib.io_add_watch_full`. Here you specify which events you are
    interested in on the [glib.iochannel.IOChannel], and provide a function to be called
    whenever these events occur.
    
    [glib.iochannel.IOChannel] instances are created with an initial reference count of 1.
    [glib.iochannel.IOChannel.ref_] and [glib.iochannel.IOChannel.unref] can be used to
    increment or decrement the reference count respectively. When the
    reference count falls to 0, the [glib.iochannel.IOChannel] is freed. (Though it
    isn’t closed automatically, unless it was created using
    [glib.iochannel.IOChannel.newFile].) Using `func@GLib.io_add_watch` or
    `func@GLib.io_add_watch_full` increments a channel’s reference count.
    
    The new functions [glib.iochannel.IOChannel.readChars],
    [glib.iochannel.IOChannel.readLine], [glib.iochannel.IOChannel.readLineString],
    [glib.iochannel.IOChannel.readToEnd], [glib.iochannel.IOChannel.writeChars],
    [glib.iochannel.IOChannel.seekPosition], and [glib.iochannel.IOChannel.flush]
    should not be mixed with the deprecated functions
    [glib.iochannel.IOChannel.read], [glib.iochannel.IOChannel.write], and
    [glib.iochannel.IOChannel.seek] on the same channel.
*/
struct GIOChannel;

/**
    A table of functions used to handle different types of #GIOChannel
    in a generic way.
*/
struct GIOFuncs
{
  /**
      reads raw bytes from the channel.  This is called from
                various functions such as [glib.iochannel.IOChannel.readChars] to
                read raw bytes from the channel.  Encoding and buffering
                issues are dealt with at a higher level.
  */
  extern(C) GIOStatus function(GIOChannel* channel, char* buf, size_t count, size_t* bytesRead, GError** _err) ioRead;

  /**
      writes raw bytes to the channel.  This is called from
                 various functions such as [glib.iochannel.IOChannel.writeChars] to
                 write raw bytes to the channel.  Encoding and buffering
                 issues are dealt with at a higher level.
  */
  extern(C) GIOStatus function(GIOChannel* channel, const(char)* buf, size_t count, size_t* bytesWritten, GError** _err) ioWrite;

  /**
      seeks the channel.  This is called from
                [glib.iochannel.IOChannel.seek] on channels that support it.
  */
  extern(C) GIOStatus function(GIOChannel* channel, long offset, GSeekType type, GError** _err) ioSeek;

  /**
      closes the channel.  This is called from
                 [glib.iochannel.IOChannel.close] after flushing the buffers.
  */
  extern(C) GIOStatus function(GIOChannel* channel, GError** _err) ioClose;

  /**
      creates a watch on the channel.  This call
                        corresponds directly to [glib.global.ioCreateWatch].
  */
  extern(C) GSource* function(GIOChannel* channel, GIOCondition condition) ioCreateWatch;

  /**
      called from [glib.iochannel.IOChannel.unref] when the channel needs to
                be freed.  This function must free the memory associated
                with the channel, including freeing the #GIOChannel
                structure itself.  The channel buffers have been flushed
                and possibly @io_close has been called by the time this
                function is called.
  */
  extern(C) void function(GIOChannel* channel) ioFree;

  /**
      sets the #GIOFlags on the channel.  This is called
                     from [glib.iochannel.IOChannel.setFlags] with all flags except
                     for `G_IO_FLAG_APPEND` and `G_IO_FLAG_NONBLOCK` masked
                     out.
  */
  extern(C) GIOStatus function(GIOChannel* channel, GIOFlags flags, GError** _err) ioSetFlags;

  /**
      gets the #GIOFlags for the channel.  This function
                     need only return the `G_IO_FLAG_APPEND` and
                     `G_IO_FLAG_NONBLOCK` flags; [glib.iochannel.IOChannel.getFlags]
                     automatically adds the others as appropriate.
  */
  extern(C) GIOFlags function(GIOChannel* channel) ioGetFlags;
}

/**
    [glib.key_file.KeyFile] parses .ini-like config files.
    
    [glib.key_file.KeyFile] lets you parse, edit or create files containing groups of
    key-value pairs, which we call "key files" for lack of a better name.
    Several freedesktop.org specifications use key files now, e.g the
    [Desktop Entry Specification](http://freedesktop.org/Standards/desktop-entry-spec)
    and the [Icon Theme Specification](http://freedesktop.org/Standards/icon-theme-spec).
    
    The syntax of key files is described in detail in the
    [Desktop Entry Specification](http://freedesktop.org/Standards/desktop-entry-spec),
    here is a quick summary: Key files consists of groups of key-value pairs, interspersed
    with comments.
    
    ```txt
    # this is just an example
    # there can be comments before the first group
    
    [First Group]
    
    Name=Key File Example\tthis value shows\nescaping
    
    # localized strings are stored in multiple key-value pairs
    Welcome=Hello
    Welcome[de]=Hallo
    Welcome[fr_FR]=Bonjour
    Welcome[it]=Ciao
    
    [Another Group]
    
    Numbers=2;20;-200;0
    
    Booleans=true;false;true;true
    ```
    
    Lines beginning with a '#' and blank lines are considered comments.
    
    Groups are started by a header line containing the group name enclosed
    in '[' and ']', and ended implicitly by the start of the next group or
    the end of the file. Each key-value pair must be contained in a group.
    
    Key-value pairs generally have the form `key=value`, with the exception
    of localized strings, which have the form `key[locale]=value`, with a
    locale identifier of the form `lang_COUNTRY@MODIFIER` where `COUNTRY`
    and `MODIFIER` are optional. Space before and after the '=' character
    are ignored. Newline, tab, carriage return and backslash characters in
    value are escaped as `\n`, `\t`, `\r`, and `\\\\`, respectively. To preserve
    leading spaces in values, these can also be escaped as `\s`.
    
    Key files can store strings (possibly with localized variants), integers,
    booleans and lists of these. Lists are separated by a separator character,
    typically ';' or ','. To use the list separator character in a value in
    a list, it has to be escaped by prefixing it with a backslash.
    
    This syntax is obviously inspired by the .ini files commonly met
    on Windows, but there are some important differences:
    
    $(LIST
      * .ini files use the ';' character to begin comments,
        key files use the '#' character.
      
      * Key files do not allow for ungrouped keys meaning only
        comments can precede the first group.
      
      * Key files are always encoded in UTF-8.
      
      * Key and Group names are case-sensitive. For example, a group called
        [GROUP] is a different from [group].
      
      * .ini files don't have a strongly typed boolean entry type,
         they only have GetProfileInt(). In key files, only
         true and false (in lower case) are allowed.
    )
      
    Note that in contrast to the
    [Desktop Entry Specification](http://freedesktop.org/Standards/desktop-entry-spec),
    groups in key files may contain the same key multiple times; the last entry wins.
    Key files may also contain multiple groups with the same name; they are merged
    together. Another difference is that keys and group names in key files are not
    restricted to ASCII characters.
    
    Here is an example of loading a key file and reading a value:
    
    ```c
    g_autoptr(GError) error = NULL;
    g_autoptr(GKeyFile) key_file = g_key_file_new ();
    
    if (!g_key_file_load_from_file (key_file, "key-file.ini", flags, &error))
      {
        if (!g_error_matches (error, G_FILE_ERROR, G_FILE_ERROR_NOENT))
          g_warning ("Error loading key file: %s", error->message);
        return;
      }
    
    g_autofree gchar *val = g_key_file_get_string (key_file, "Group Name", "SomeKey", &error);
    if (val == NULL &&
        !g_error_matches (error, G_KEY_FILE_ERROR, G_KEY_FILE_ERROR_KEY_NOT_FOUND))
      {
        g_warning ("Error finding key in key file: %s", error->message);
        return;
      }
    else if (val == NULL)
      {
        // Fall back to a default value.
        val = g_strdup ("default-value");
      }
    ```
    
    Here is an example of creating and saving a key file:
    
    ```c
    g_autoptr(GKeyFile) key_file = g_key_file_new ();
    const gchar *val = …;
    g_autoptr(GError) error = NULL;
    
    g_key_file_set_string (key_file, "Group Name", "SomeKey", val);
    
    // Save as a file.
    if (!g_key_file_save_to_file (key_file, "key-file.ini", &error))
      {
        g_warning ("Error saving key file: %s", error->message);
        return;
      }
    
    // Or store to a GBytes for use elsewhere.
    gsize data_len;
    g_autofree guint8 *data = (guint8 *) g_key_file_to_data (key_file, &data_len, &error);
    if (data == NULL)
      {
        g_warning ("Error saving key file: %s", error->message);
        return;
      }
    g_autoptr(GBytes) bytes = g_bytes_new_take (g_steal_pointer (&data), data_len);
    ```
*/
struct GKeyFile;

/**
    The #GList struct is used for each element in a doubly-linked list.
*/
struct GList
{
  /**
      holds the element's data, which can be a pointer to any kind
             of data, or any integer value using the
             [Type Conversion Macros][glib-Type-Conversion-Macros]
  */
  void* data;

  /**
      contains the link to the next element in the list
  */
  GList* next;

  /**
      contains the link to the previous element in the list
  */
  GList* prev;
}

/**
    Structure representing a single field in a structured log entry. See
    [glib.global.logStructured] for details.
    
    Log fields may contain arbitrary values, including binary with embedded nul
    bytes. If the field contains a string, the string must be UTF-8 encoded and
    have a trailing nul byte. Otherwise, @length must be set to a non-negative
    value.
*/
struct GLogField
{
  /**
      field name (UTF-8 string)
  */
  const(char)* key;

  /**
      field value (arbitrary bytes)
  */
  const(void)* value;

  /**
      length of @value, in bytes, or -1 if it is nul-terminated
  */
  ptrdiff_t length;
}

/**
    The [glib.main_context.MainContext] struct is an opaque data
    type representing a set of sources to be handled in a main loop.
*/
struct GMainContext;

/**
    The [glib.main_loop.MainLoop] struct is an opaque data type
    representing the main event loop of a GLib or GTK application.
*/
struct GMainLoop;

/**
    The #GMappedFile represents a file mapping created with
    [glib.mapped_file.MappedFile.new_]. It has only private members and should
    not be accessed directly.
*/
struct GMappedFile;

/**
    A parse context is used to parse a stream of bytes that
    you expect to contain marked-up text.
    
    See [glib.markup_parse_context.MarkupParseContext.new_], #GMarkupParser, and so
    on for more details.
*/
struct GMarkupParseContext;

/**
    Any of the fields in #GMarkupParser can be null, in which case they
    will be ignored. Except for the @error function, any of these callbacks
    can set an error; in particular the `G_MARKUP_ERROR_UNKNOWN_ELEMENT`,
    `G_MARKUP_ERROR_UNKNOWN_ATTRIBUTE`, and `G_MARKUP_ERROR_INVALID_CONTENT`
    errors are intended to be set from these callbacks. If you set an error
    from a callback, [glib.markup_parse_context.MarkupParseContext.parse] will report that error
    back to its caller.
*/
struct GMarkupParser
{
  /**
      Callback to invoke when the opening tag of an element
          is seen. The callback's @attribute_names and @attribute_values parameters
          are null-terminated.
  */
  extern(C) void function(GMarkupParseContext* context, const(char)* elementName, const(char*)* attributeNames, const(char*)* attributeValues, void* userData, GError** _err) startElement;

  /**
      Callback to invoke when the closing tag of an element
          is seen. Note that this is also called for empty tags like
          `<empty/>`.
  */
  extern(C) void function(GMarkupParseContext* context, const(char)* elementName, void* userData, GError** _err) endElement;

  /**
      Callback to invoke when some text is seen (text is always
          inside an element). Note that the text of an element may be spread
          over multiple calls of this function. If the
          `G_MARKUP_TREAT_CDATA_AS_TEXT` flag is set, this function is also
          called for the content of CDATA marked sections.
  */
  extern(C) void function(GMarkupParseContext* context, const(char)* text, size_t textLen, void* userData, GError** _err) text;

  /**
      Callback to invoke for comments, processing instructions
          and doctype declarations; if you're re-writing the parsed document,
          write the passthrough text back out in the same position. If the
          `G_MARKUP_TREAT_CDATA_AS_TEXT` flag is not set, this function is also
          called for CDATA marked sections.
  */
  extern(C) void function(GMarkupParseContext* context, const(char)* passthroughText, size_t textLen, void* userData, GError** _err) passthrough;

  /**
      Callback to invoke when an error occurs.
  */
  extern(C) void function(GMarkupParseContext* context, GError* error, void* userData) error;
}

/**
    A GMatchInfo is an opaque struct used to return information about
    matches.
*/
struct GMatchInfo;

/** */
struct GMemChunk;

/**
    A set of functions used to perform memory allocation. The same #GMemVTable must
    be used for all allocations in the same program; a call to [glib.global.memSetVtable],
    if it exists, should be prior to any use of GLib.
    
    This functions related to this has been deprecated in 2.46, and no longer work.
*/
struct GMemVTable
{
  /**
      function to use for allocating memory.
  */
  extern(C) void* function(size_t nBytes) malloc;

  /**
      function to use for reallocating memory.
  */
  extern(C) void* function(void* mem, size_t nBytes) realloc;

  /**
      function to use to free memory.
  */
  extern(C) void function(void* mem) free;

  /**
      function to use for allocating zero-filled memory.
  */
  extern(C) void* function(size_t nBlocks, size_t nBlockBytes) calloc;

  /**
      function to use for allocating memory without a default error handler.
  */
  extern(C) void* function(size_t nBytes) tryMalloc;

  /**
      function to use for reallocating memory without a default error handler.
  */
  extern(C) void* function(void* mem, size_t nBytes) tryRealloc;
}

/**
    The #GMutex struct is an opaque data structure to represent a mutex
    (mutual exclusion). It can be used to protect data against shared
    access.
    
    Take for example the following function:
    ```c
      int
      give_me_next_number (void)
      {
        static int current_number = 0;
    
        // now do a very complicated calculation to calculate the new
        // number, this might for example be a random number generator
        current_number = calc_next_number (current_number);
    
        return current_number;
      }
    ```
    It is easy to see that this won't work in a multi-threaded
    application. There current_number must be protected against shared
    access. A #GMutex can be used as a solution to this problem:
    ```c
      int
      give_me_next_number (void)
      {
        static GMutex mutex;
        static int current_number = 0;
        int ret_val;
    
        g_mutex_lock (&mutex);
        ret_val = current_number = calc_next_number (current_number);
        g_mutex_unlock (&mutex);
    
        return ret_val;
      }
    ```
    Notice that the #GMutex is not initialised to any particular value.
    Its placement in static storage ensures that it will be initialised
    to all-zeros, which is appropriate.
    
    If a #GMutex is placed in other contexts (eg: embedded in a struct)
    then it must be explicitly initialised using [glib.mutex.Mutex.init_].
    
    A #GMutex should only be accessed via g_mutex_ functions.
*/
union GMutex
{
  /** */
  void* p;

  /** */
  uint[2] i;
}

/**
    The #GNode struct represents one node in a [n-ary tree][glib-N-ary-Trees].
*/
struct GNode
{
  /**
      contains the actual data of the node.
  */
  void* data;

  /**
      points to the node's next sibling (a sibling is another
             #GNode with the same parent).
  */
  GNode* next;

  /**
      points to the node's previous sibling.
  */
  GNode* prev;

  /**
      points to the parent of the #GNode, or is null if the
               #GNode is the root of the tree.
  */
  GNode* parent;

  /**
      points to the first child of the #GNode.  The other
                 children are accessed by using the @next pointer of each
                 child.
  */
  GNode* children;
}

/**
    A #GOnce struct controls a one-time initialization function. Any
    one-time initialization function must have its own unique #GOnce
    struct.
*/
struct GOnce
{
  /**
      the status of the #GOnce
  */
  GOnceStatus status;

  /**
      the value returned by the call to the function, if @status
               is `G_ONCE_STATUS_READY`
  */
  void* retval;
}

/**
    A [glib.option_context.OptionContext] struct defines which options
    are accepted by the commandline option parser. The struct has only private
    fields and should not be directly accessed.
*/
struct GOptionContext;

/**
    A GOptionEntry struct defines a single option. To have an effect, they
    must be added to a #GOptionGroup with [glib.option_context.OptionContext.addMainEntries]
    or [glib.option_group.OptionGroup.addEntries].
*/
struct GOptionEntry
{
  /**
      The long name of an option can be used to specify it
          in a commandline as `--long_name`. Every option must have a
          long name. To resolve conflicts if multiple option groups contain
          the same long name, it is also possible to specify the option as
          `--groupname-long_name`.
  */
  const(char)* longName;

  /**
      If an option has a short name, it can be specified
          `-short_name` in a commandline. @short_name must be  a printable
          ASCII character different from '-', or zero if the option has no
          short name.
  */
  char shortName;

  /**
      Flags from #GOptionFlags
  */
  int flags;

  /**
      The type of the option, as a #GOptionArg
  */
  GOptionArg arg;

  /**
      If the @arg type is `G_OPTION_ARG_CALLBACK`, then @arg_data
          must point to a #GOptionArgFunc callback function, which will be
          called to handle the extra argument. Otherwise, @arg_data is a
          pointer to a location to store the value, the required type of
          the location depends on the @arg type:
           - `G_OPTION_ARG_NONE`: [glib.types.SOURCE_REMOVE]
           - `G_OPTION_ARG_STRING`: [glib.types.LOG_DOMAIN]*
           - `G_OPTION_ARG_INT`: [webkit.types.MINOR_VERSION]
           - `G_OPTION_ARG_FILENAME`: [glib.types.LOG_DOMAIN]*
           - `G_OPTION_ARG_STRING_ARRAY`: [glib.types.LOG_DOMAIN]**
           - `G_OPTION_ARG_FILENAME_ARRAY`: [glib.types.LOG_DOMAIN]**
           - `G_OPTION_ARG_DOUBLE`: [graphene.types.PI_2]
          If @arg type is `G_OPTION_ARG_STRING` or `G_OPTION_ARG_FILENAME`,
          the location will contain a newly allocated string if the option
          was given. That string needs to be freed by the callee using [glib.global.gfree].
          Likewise if @arg type is `G_OPTION_ARG_STRING_ARRAY` or
          `G_OPTION_ARG_FILENAME_ARRAY`, the data should be freed using [glib.global.strfreev].
  */
  void* argData;

  /**
      the description for the option in `--help`
          output. The @description is translated using the @translate_func
          of the group, see [glib.option_group.OptionGroup.setTranslationDomain].
  */
  const(char)* description;

  /**
      The placeholder to use for the extra argument parsed
          by the option in `--help` output. The @arg_description is translated
          using the @translate_func of the group, see
          [glib.option_group.OptionGroup.setTranslationDomain].
  */
  const(char)* argDescription;
}

/**
    A [glib.option_group.OptionGroup] struct defines the options in a single
    group. The struct has only private fields and should not be directly accessed.
    
    All options in a group share the same translation function. Libraries which
    need to parse commandline options are expected to provide a function for
    getting a [glib.option_group.OptionGroup] holding their options, which
    the application can then add to its #GOptionContext.
*/
struct GOptionGroup;

/**
    [glib.path_buf.PathBuf] is a helper type that allows you to easily build paths from
    individual elements, using the platform specific conventions for path
    separators.
    
    ```c
    g_auto (GPathBuf) path;
    
    g_path_buf_init (&path);
    
    g_path_buf_push (&path, "usr");
    g_path_buf_push (&path, "bin");
    g_path_buf_push (&path, "echo");
    
    g_autofree char *echo = g_path_buf_to_path (&path);
    g_assert_cmpstr (echo, ==, "/usr/bin/echo");
    ```
    
    You can also load a full path and then operate on its components:
    
    ```c
    g_auto (GPathBuf) path;
    
    g_path_buf_init_from_path (&path, "/usr/bin/echo");
    
    g_path_buf_pop (&path);
    g_path_buf_push (&path, "sh");
    
    g_autofree char *sh = g_path_buf_to_path (&path);
    g_assert_cmpstr (sh, ==, "/usr/bin/sh");
    ```
*/
struct GPathBuf
{
  /** */
  void*[8] dummy;
}

/**
    A [glib.pattern_spec.PatternSpec] struct is the 'compiled' form of a glob-style pattern.
    
    The `func@GLib.pattern_match_simple` and [glib.pattern_spec.PatternSpec.match] functions
    match a string against a pattern containing '*' and '?' wildcards with similar
    semantics as the standard `glob()` function: '*' matches an arbitrary,
    possibly empty, string, '?' matches an arbitrary character.
    
    Note that in contrast to `glob()`, the '/' character can be matched by
    the wildcards, there are no '[...]' character ranges and '*' and '?'
    can not be escaped to include them literally in a pattern.
    
    When multiple strings must be matched against the same pattern, it is better
    to compile the pattern to a [glib.pattern_spec.PatternSpec] using
    [glib.pattern_spec.PatternSpec.new_] and use [glib.pattern_spec.PatternSpec.matchString]
    instead of `func@GLib.pattern_match_simple`. This avoids the overhead of repeated
    pattern compilation.
*/
struct GPatternSpec;

/**
    Represents a file descriptor, which events to poll for, and which events
    occurred.
*/
struct GPollFD
{
  /**
      the file descriptor to poll (or a HANDLE on Win32)
  */
  int fd;

  /**
      a bitwise combination from #GIOCondition, specifying which
          events should be polled for. Typically for reading from a file
          descriptor you would use [glib.types.IOCondition.In] | [glib.types.IOCondition.Hup] | [glib.types.IOCondition.Err], and
          for writing you would use [glib.types.IOCondition.Out] | [glib.types.IOCondition.Err].
  */
  ushort events;

  /**
      a bitwise combination of flags from #GIOCondition, returned
          from the poll() function to indicate which events occurred.
  */
  ushort revents;
}

/**
    The #GPrivate struct is an opaque data structure to represent a
    thread-local data key. It is approximately equivalent to the
    pthread_setspecific()/pthread_getspecific() APIs on POSIX and to
    TlsSetValue()/TlsGetValue() on Windows.
    
    If you don't already know why you might want this functionality,
    then you probably don't need it.
    
    #GPrivate is a very limited resource (as far as 128 per program,
    shared between all libraries). It is also not possible to destroy a
    #GPrivate after it has been used. As such, it is only ever acceptable
    to use #GPrivate in static scope, and even then sparingly so.
    
    See G_PRIVATE_INIT() for a couple of examples.
    
    The #GPrivate structure should be considered opaque.  It should only
    be accessed via the g_private_ functions.
*/
struct GPrivate
{
  /** */
  void* p;

  /** */
  GDestroyNotify notify;

  /** */
  void*[2] future;
}

/**
    Contains the public fields of a pointer array.
*/
struct GPtrArray
{
  /**
      points to the array of pointers, which may be moved when the
          array grows
  */
  void** pdata;

  /**
      number of pointers in the array
  */
  uint len;
}

/**
    Contains the public fields of a
    [Queue][glib-Double-ended-Queues].
*/
struct GQueue
{
  /**
      a pointer to the first element of the queue
  */
  GList* head;

  /**
      a pointer to the last element of the queue
  */
  GList* tail;

  /**
      the number of elements in the queue
  */
  uint length;
}

/**
    The GRWLock struct is an opaque data structure to represent a
    reader-writer lock. It is similar to a #GMutex in that it allows
    multiple threads to coordinate access to a shared resource.
    
    The difference to a mutex is that a reader-writer lock discriminates
    between read-only ('reader') and full ('writer') access. While only
    one thread at a time is allowed write access (by holding the 'writer'
    lock via [glib.rwlock.RWLock.writerLock]), multiple threads can gain
    simultaneous read-only access (by holding the 'reader' lock via
    [glib.rwlock.RWLock.readerLock]).
    
    It is unspecified whether readers or writers have priority in acquiring the
    lock when a reader already holds the lock and a writer is queued to acquire
    it.
    
    Here is an example for an array with access functions:
    ```c
      GRWLock lock;
      GPtrArray *array;
    
      gpointer
      my_array_get (guint index)
      {
        gpointer retval = NULL;
    
        if (!array)
          return NULL;
    
        g_rw_lock_reader_lock (&lock);
        if (index < array->len)
          retval = g_ptr_array_index (array, index);
        g_rw_lock_reader_unlock (&lock);
    
        return retval;
      }
    
      void
      my_array_set (guint index, gpointer data)
      {
        g_rw_lock_writer_lock (&lock);
    
        if (!array)
          array = g_ptr_array_new ();
    
        if (index >= array->len)
          g_ptr_array_set_size (array, index+1);
        g_ptr_array_index (array, index) = data;
    
        g_rw_lock_writer_unlock (&lock);
      }
     ```
    This example shows an array which can be accessed by many readers
    (the my_array_get() function) simultaneously, whereas the writers
    (the my_array_set() function) will only be allowed one at a time
    and only if no readers currently access the array. This is because
    of the potentially dangerous resizing of the array. Using these
    functions is fully multi-thread safe now.
    
    If a #GRWLock is allocated in static storage then it can be used
    without initialisation.  Otherwise, you should call
    [glib.rwlock.RWLock.init_] on it and [glib.rwlock.RWLock.clear] when done.
    
    A GRWLock should only be accessed with the g_rw_lock_ functions.
*/
struct GRWLock
{
  /** */
  void* p;

  /** */
  uint[2] i;
}

/**
    The GRand struct is an opaque data structure. It should only be
    accessed through the g_rand_* functions.
*/
struct GRand;

/**
    The GRecMutex struct is an opaque data structure to represent a
    recursive mutex. It is similar to a #GMutex with the difference
    that it is possible to lock a GRecMutex multiple times in the same
    thread without deadlock. When doing so, care has to be taken to
    unlock the recursive mutex as often as it has been locked.
    
    If a #GRecMutex is allocated in static storage then it can be used
    without initialisation.  Otherwise, you should call
    [glib.rec_mutex.RecMutex.init_] on it and [glib.rec_mutex.RecMutex.clear] when done.
    
    A GRecMutex should only be accessed with the
    g_rec_mutex_ functions.
*/
struct GRecMutex
{
  /** */
  void* p;

  /** */
  uint[2] i;
}

/**
    A [glib.regex.Regex] is the "compiled" form of a regular expression pattern.
    
    [glib.regex.Regex] implements regular expression pattern matching using syntax and
    semantics similar to Perl regular expression. See the
    [PCRE documentation](man:pcrepattern(3)) for the syntax definition.
    
    Some functions accept a @start_position argument, setting it differs
    from just passing over a shortened string and setting `G_REGEX_MATCH_NOTBOL`
    in the case of a pattern that begins with any kind of lookbehind assertion.
    For example, consider the pattern "\Biss\B" which finds occurrences of "iss"
    in the middle of words. ("\B" matches only if the current position in the
    subject is not a word boundary.) When applied to the string "Mississipi"
    from the fourth byte, namely "issipi", it does not match, because "\B" is
    always false at the start of the subject, which is deemed to be a word
    boundary. However, if the entire string is passed , but with
    @start_position set to 4, it finds the second occurrence of "iss" because
    it is able to look behind the starting point to discover that it is
    preceded by a letter.
    
    Note that, unless you set the `G_REGEX_RAW` flag, all the strings passed
    to these functions must be encoded in UTF-8. The lengths and the positions
    inside the strings are in bytes and not in characters, so, for instance,
    "\xc3\xa0" (i.e. "à") is two bytes long but it is treated as a
    single character. If you set `G_REGEX_RAW` the strings can be non-valid
    UTF-8 strings and a byte is treated as a character, so "\xc3\xa0" is two
    bytes and two characters long.
    
    When matching a pattern, "\n" matches only against a "\n" character in
    the string, and "\r" matches only a "\r" character. To match any newline
    sequence use "\R". This particular group matches either the two-character
    sequence CR + LF ("\r\n"), or one of the single characters LF (linefeed,
    U+000A, "\n"), VT vertical tab, U+000B, "\v"), FF (formfeed, U+000C, "\f"),
    CR (carriage return, U+000D, "\r"), NEL (next line, U+0085), LS (line
    separator, U+2028), or PS (paragraph separator, U+2029).
    
    The behaviour of the dot, circumflex, and dollar metacharacters are
    affected by newline characters, the default is to recognize any newline
    character (the same characters recognized by "\R"). This can be changed
    with `G_REGEX_NEWLINE_CR`, `G_REGEX_NEWLINE_LF` and `G_REGEX_NEWLINE_CRLF`
    compile options, and with `G_REGEX_MATCH_NEWLINE_ANY`,
    `G_REGEX_MATCH_NEWLINE_CR`, `G_REGEX_MATCH_NEWLINE_LF` and
    `G_REGEX_MATCH_NEWLINE_CRLF` match options. These settings are also
    relevant when compiling a pattern if `G_REGEX_EXTENDED` is set, and an
    unescaped "#" outside a character class is encountered. This indicates
    a comment that lasts until after the next newline.
    
    Creating and manipulating the same [glib.regex.Regex] structure from different
    threads is not a problem as [glib.regex.Regex] does not modify its internal
    state between creation and destruction, on the other hand [glib.match_info.MatchInfo]
    is not threadsafe.
    
    The regular expressions low-level functionalities are obtained through
    the excellent [PCRE](http://www.pcre.org/) library written by Philip Hazel.
*/
struct GRegex;

/**
    A [glib.relation.Relation] is a table of data which can be indexed on any number
    of fields, rather like simple database tables. A [glib.relation.Relation] contains
    a number of records, called tuples. Each record contains a number of
    fields. Records are not ordered, so it is not possible to find the
    record at a particular index.
    
    Note that [glib.relation.Relation] tables are currently limited to 2 fields.
    
    To create a [glib.relation.Relation], use [glib.relation.Relation.new_].
    
    To specify which fields should be indexed, use [glib.relation.Relation.index].
    Note that this must be called before any tuples are added to the
    [glib.relation.Relation].
    
    To add records to a [glib.relation.Relation] use [glib.relation.Relation.insert].
    
    To determine if a given record appears in a [glib.relation.Relation], use
    [glib.relation.Relation.exists]. Note that fields are compared directly, so
    pointers must point to the exact same position (i.e. different
    copies of the same string will not match.)
    
    To count the number of records which have a particular value in a
    given field, use [glib.relation.Relation.count].
    
    To get all the records which have a particular value in a given
    field, use [glib.relation.Relation.select]. To access fields of the resulting
    records, use [glib.tuples.Tuples.index]. To free the resulting records use
    [glib.tuples.Tuples.destroy].
    
    To delete all records which have a particular value in a given
    field, use [glib.relation.Relation.delete_].
    
    To destroy the [glib.relation.Relation], use [glib.relation.Relation.destroy].
    
    To help debug [glib.relation.Relation] objects, use [glib.relation.Relation.print].
    
    [glib.relation.Relation] has been marked as deprecated, since this API has never
    been fully implemented, is not very actively maintained and rarely
    used.

    Deprecated: Rarely used API
*/
struct GRelation;

/**
    The #GSList struct is used for each element in the singly-linked
    list.
*/
struct GSList
{
  /**
      holds the element's data, which can be a pointer to any kind
             of data, or any integer value using the
             [Type Conversion Macros][glib-Type-Conversion-Macros]
  */
  void* data;

  /**
      contains the link to the next element in the list.
  */
  GSList* next;
}

/**
    [glib.scanner.Scanner] provides a general-purpose lexical scanner.
    
    You should set @input_name after creating the scanner, since
    it is used by the default message handler when displaying
    warnings and errors. If you are scanning a file, the filename
    would be a good choice.
    
    The @user_data and @max_parse_errors fields are not used.
    If you need to associate extra data with the scanner you
    can place them here.
    
    If you want to use your own message handler you can set the
    @msg_handler field. The type of the message handler function
    is declared by #GScannerMsgFunc.
*/
struct GScanner
{
  /**
      unused
  */
  void* userData;

  /**
      unused
  */
  uint maxParseErrors;

  /**
      [glib.scanner.Scanner.error] increments this field
  */
  uint parseErrors;

  /**
      name of input stream, featured by the default message handler
  */
  const(char)* inputName;

  /**
      quarked data
  */
  GData* qdata;

  /**
      link into the scanner configuration
  */
  GScannerConfig* config;

  /**
      token parsed by the last [glib.scanner.Scanner.getNextToken]
  */
  GTokenType token;

  /**
      value of the last token from [glib.scanner.Scanner.getNextToken]
  */
  GTokenValue value;

  /**
      line number of the last token from [glib.scanner.Scanner.getNextToken]
  */
  uint line;

  /**
      char number of the last token from [glib.scanner.Scanner.getNextToken]
  */
  uint position;

  /**
      token parsed by the last [glib.scanner.Scanner.peekNextToken]
  */
  GTokenType nextToken;

  /**
      value of the last token from [glib.scanner.Scanner.peekNextToken]
  */
  GTokenValue nextValue;

  /**
      line number of the last token from [glib.scanner.Scanner.peekNextToken]
  */
  uint nextLine;

  /**
      char number of the last token from [glib.scanner.Scanner.peekNextToken]
  */
  uint nextPosition;

  /** */
  GHashTable* symbolTable;

  /** */
  int inputFd;

  /** */
  const(char)* text;

  /** */
  const(char)* textEnd;

  /** */
  char* buffer;

  /** */
  uint scopeId;

  /**
      handler function for _warn and _error
  */
  GScannerMsgFunc msgHandler;
}

/**
    Specifies the #GScanner parser configuration. Most settings can
    be changed during the parsing phase and will affect the lexical
    parsing of the next unpeeked token.
*/
struct GScannerConfig
{
  /**
      specifies which characters should be skipped
          by the scanner (the default is the whitespace characters: space,
          tab, carriage-return and line-feed).
  */
  char* csetSkipCharacters;

  /**
      specifies the characters which can start
          identifiers (the default is `G_CSET_a_2_z`, "_", and `G_CSET_A_2_Z`).
  */
  char* csetIdentifierFirst;

  /**
      specifies the characters which can be used
          in identifiers, after the first character (the default is
          `G_CSET_a_2_z`, "_0123456789", `G_CSET_A_2_Z`, `G_CSET_LATINS`,
          `G_CSET_LATINC`).
  */
  char* csetIdentifierNth;

  /**
      specifies the characters at the start and
          end of single-line comments. The default is "#\n" which means
          that single-line comments start with a '#' and continue until
          a '\n' (end of line).
  */
  char* cpairCommentSingle;

  /**
      specifies if symbols are case sensitive (the
          default is false).
  */
  uint caseSensitive;

  /**
      specifies if multi-line comments are skipped
          and not returned as tokens (the default is true).
  */
  uint skipCommentMulti;

  /**
      specifies if single-line comments are skipped
          and not returned as tokens (the default is true).
  */
  uint skipCommentSingle;

  /**
      specifies if multi-line comments are recognized
          (the default is true).
  */
  uint scanCommentMulti;

  /**
      specifies if identifiers are recognized (the
          default is true).
  */
  uint scanIdentifier;

  /**
      specifies if single-character
          identifiers are recognized (the default is false).
  */
  uint scanIdentifier1char;

  /**
      specifies if null is reported as
          `G_TOKEN_IDENTIFIER_NULL` (the default is false).
  */
  uint scanIdentifierNULL;

  /**
      specifies if symbols are recognized (the default
          is true).
  */
  uint scanSymbols;

  /**
      specifies if binary numbers are recognized (the
          default is false).
  */
  uint scanBinary;

  /**
      specifies if octal numbers are recognized (the
          default is true).
  */
  uint scanOctal;

  /**
      specifies if floating point numbers are recognized
          (the default is true).
  */
  uint scanFloat;

  /**
      specifies if hexadecimal numbers are recognized (the
          default is true).
  */
  uint scanHex;

  /**
      specifies if '$' is recognized as a prefix for
          hexadecimal numbers (the default is false).
  */
  uint scanHexDollar;

  /**
      specifies if strings can be enclosed in single
          quotes (the default is true).
  */
  uint scanStringSq;

  /**
      specifies if strings can be enclosed in double
          quotes (the default is true).
  */
  uint scanStringDq;

  /**
      specifies if binary, octal and hexadecimal numbers
          are reported as `G_TOKEN_INT` (the default is true).
  */
  uint numbers2Int;

  /**
      specifies if all numbers are reported as `G_TOKEN_FLOAT`
          (the default is false).
  */
  uint int2Float;

  /**
      specifies if identifiers are reported as strings
          (the default is false).
  */
  uint identifier2String;

  /**
      specifies if characters are reported by setting
          `token = ch` or as `G_TOKEN_CHAR` (the default is true).
  */
  uint char2Token;

  /**
      specifies if symbols are reported by setting
          `token = v_symbol` or as `G_TOKEN_SYMBOL` (the default is false).
  */
  uint symbol2Token;

  /**
      specifies if a symbol is searched for in the
          default scope in addition to the current scope (the default is false).
  */
  uint scope0Fallback;

  /**
      use value.v_int64 rather than v_int
  */
  uint storeInt64;

  /** */
  uint paddingDummy;
}

/**
    The #GSequence struct is an opaque data type representing a
    [sequence][glib-Sequences] data type.
*/
struct GSequence;

/**
    The #GSequenceIter struct is an opaque data type representing an
    iterator pointing into a #GSequence.
*/
struct GSequenceIter;

/**
    The [glib.source.Source] struct is an opaque data type
    representing an event source.
*/
struct GSource
{
  /** */
  void* callbackData;

  /** */
  GSourceCallbackFuncs* callbackFuncs;

  /** */
  const(GSourceFuncs)* sourceFuncs;

  /** */
  uint refCount;

  /** */
  GMainContext* context;

  /** */
  int priority;

  /** */
  uint flags;

  /** */
  uint sourceId;

  /** */
  GSList* pollFds;

  /** */
  GSource* prev;

  /** */
  GSource* next;

  /** */
  char* name;

  /** */
  GSourcePrivate* priv;
}

/**
    The [glib.types.SourceCallbackFuncs] struct contains
    functions for managing callback objects.
*/
struct GSourceCallbackFuncs
{
  /**
      Called when a reference is added to the callback object
  */
  extern(C) void function(void* cbData) ref_;

  /**
      Called when a reference to the callback object is dropped
  */
  extern(C) void function(void* cbData) unref;

  /**
      Called to extract the callback function and data from the
          callback object.
  */
  extern(C) void function(void* cbData, GSource* source, GSourceFunc* func, void** data) get;
}

/**
    The [glib.types.SourceFuncs] struct contains a table of
    functions used to handle event sources in a generic manner.
    
    For idle sources, the prepare and check functions always return true
    to indicate that the source is always ready to be processed. The prepare
    function also returns a timeout value of 0 to ensure that the poll() call
    doesn't block (since that would be time wasted which could have been spent
    running the idle function).
    
    For timeout sources, the prepare and check functions both return true
    if the timeout interval has expired. The prepare function also returns
    a timeout value to ensure that the poll() call doesn't block too long
    and miss the next timeout.
    
    For file descriptor sources, the prepare function typically returns false,
    since it must wait until poll() has been called before it knows whether
    any events need to be processed. It sets the returned timeout to -1 to
    indicate that it doesn't mind how long the poll() call blocks. In the
    check function, it tests the results of the poll() call to see if the
    required condition has been met, and returns true if so.
*/
struct GSourceFuncs
{
  /**
      Called before all the file descriptors are polled. If the
          source can determine that it is ready here (without waiting for the
          results of the poll() call) it should return true. It can also return
          a @timeout_ value which should be the maximum timeout (in milliseconds)
          which should be passed to the poll() call. The actual timeout used will
          be -1 if all sources returned -1, or it will be the minimum of all
          the @timeout_ values returned which were >= 0.  Since 2.36 this may
          be null, in which case the effect is as if the function always returns
          false with a timeout of -1.  If @prepare returns a
          timeout and the source also has a ready time set, then the
          lower of the two will be used.
  */
  extern(C) gboolean function(GSource* source, int* timeout) prepare;

  /**
      Called after all the file descriptors are polled. The source
          should return true if it is ready to be dispatched. Note that some
          time may have passed since the previous prepare function was called,
          so the source should be checked again here.  Since 2.36 this may
          be null, in which case the effect is as if the function always returns
          false.
  */
  extern(C) gboolean function(GSource* source) check;

  /**
      Called to dispatch the event source, after it has returned
          true in either its @prepare or its @check function, or if a ready time
          has been reached. The @dispatch function receives a callback function and
          user data. The callback function may be null if the source was never
          connected to a callback using [glib.source.Source.setCallback]. The @dispatch
          function should call the callback function with @user_data and whatever
          additional parameters are needed for this type of event source. The
          return value of the @dispatch function should be `G_SOURCE_REMOVE` if the
          source should be removed or `G_SOURCE_CONTINUE` to keep it.
  */
  extern(C) gboolean function(GSource* source, GSourceFunc callback, void* userData) dispatch;

  /**
      Called when the source is finalized. At this point, the source
          will have been destroyed, had its callback cleared, and have been removed
          from its #GMainContext, but it will still have its final reference count,
          so methods can be called on it from within this function.
  */
  extern(C) void function(GSource* source) finalize;

  /** */
  GSourceFunc closureCallback;

  /** */
  GSourceDummyMarshal closureMarshal;
}

/** */
struct GSourcePrivate;

/**
    A type corresponding to the appropriate struct type for the stat()
    system call, depending on the platform and/or compiler being used.
    
    See [glib.global.stat] for more information.
*/
struct GStatBuf;

/**
    A #GStaticMutex works like a #GMutex.
    
    Prior to GLib 2.32, GStaticMutex had the significant advantage
    that it doesn't need to be created at run-time, but can be defined
    at compile-time. Since 2.32, #GMutex can be statically allocated
    as well, and GStaticMutex has been deprecated.
    
    Here is a version of our give_me_next_number() example using
    a GStaticMutex:
    ```
      int
      give_me_next_number (void)
      {
        static int current_number = 0;
        int ret_val;
        static GStaticMutex mutex = G_STATIC_MUTEX_INIT;
    
        g_static_mutex_lock (&mutex);
        ret_val = current_number = calc_next_number (current_number);
        g_static_mutex_unlock (&mutex);
    
        return ret_val;
      }
    ```
    
    Sometimes you would like to dynamically create a mutex. If you don't
    want to require prior calling to [glib.thread.Thread.init_], because your code
    should also be usable in non-threaded programs, you are not able to
    use [glib.mutex.Mutex.new_] and thus #GMutex, as that requires a prior call to
    [glib.thread.Thread.init_]. In these cases you can also use a #GStaticMutex.
    It must be initialized with [glib.static_mutex.StaticMutex.init_] before using it
    and freed with with [glib.static_mutex.StaticMutex.free] when not needed anymore to
    free up any allocated resources.
    
    Even though #GStaticMutex is not opaque, it should only be used with
    the following functions, as it is defined differently on different
    platforms.
    
    All of the g_static_mutex_* functions apart from
    g_static_mutex_get_mutex() can also be used even if [glib.thread.Thread.init_]
    has not yet been called. Then they do nothing, apart from
    g_static_mutex_trylock() which does nothing but returning true.
    
    All of the g_static_mutex_* functions are actually macros. Apart from
    taking their addresses, you can however use them as if they were
    functions.
*/
struct GStaticMutex
{
  /** */
  GMutex* mutex;
}

/**
    A #GStaticPrivate works almost like a #GPrivate, but it has one
    significant advantage. It doesn't need to be created at run-time
    like a #GPrivate, but can be defined at compile-time. This is
    similar to the difference between #GMutex and #GStaticMutex.
    
    Now look at our give_me_next_number() example with #GStaticPrivate:
    ```
      int
      give_me_next_number ()
      {
        static GStaticPrivate current_number_key = G_STATIC_PRIVATE_INIT;
        int *current_number = g_static_private_get (&current_number_key);
    
        if (!current_number)
          {
            current_number = g_new (int, 1);
            *current_number = 0;
            g_static_private_set (&current_number_key, current_number, g_free);
          }
    
        *current_number = calc_next_number (*current_number);
    
        return *current_number;
      }
    ```
*/
struct GStaticPrivate
{
  /** */
  uint index;
}

/**
    The #GStaticRWLock struct represents a read-write lock. A read-write
    lock can be used for protecting data that some portions of code only
    read from, while others also write. In such situations it is
    desirable that several readers can read at once, whereas of course
    only one writer may write at a time.
    
    Take a look at the following example:
    ```
      GStaticRWLock rwlock = G_STATIC_RW_LOCK_INIT;
      GPtrArray *array;
    
      gpointer
      my_array_get (guint index)
      {
        gpointer retval = NULL;
    
        if (!array)
          return NULL;
    
        g_static_rw_lock_reader_lock (&rwlock);
        if (index < array->len)
          retval = g_ptr_array_index (array, index);
        g_static_rw_lock_reader_unlock (&rwlock);
    
        return retval;
      }
    
      void
      my_array_set (guint index, gpointer data)
      {
        g_static_rw_lock_writer_lock (&rwlock);
    
        if (!array)
          array = g_ptr_array_new ();
    
        if (index >= array->len)
          g_ptr_array_set_size (array, index + 1);
        g_ptr_array_index (array, index) = data;
    
        g_static_rw_lock_writer_unlock (&rwlock);
      }
    ```
    
    This example shows an array which can be accessed by many readers
    (the my_array_get() function) simultaneously, whereas the writers
    (the my_array_set() function) will only be allowed once at a time
    and only if no readers currently access the array. This is because
    of the potentially dangerous resizing of the array. Using these
    functions is fully multi-thread safe now.
    
    Most of the time, writers should have precedence over readers. That
    means, for this implementation, that as soon as a writer wants to
    lock the data, no other reader is allowed to lock the data, whereas,
    of course, the readers that already have locked the data are allowed
    to finish their operation. As soon as the last reader unlocks the
    data, the writer will lock it.
    
    Even though #GStaticRWLock is not opaque, it should only be used
    with the following functions.
    
    All of the g_static_rw_lock_* functions can be used even if
    [glib.thread.Thread.init_] has not been called. Then they do nothing, apart
    from g_static_rw_lock_*_trylock, which does nothing but returning true.
    
    A read-write lock has a higher overhead than a mutex. For example, both
    [glib.static_rwlock.StaticRWLock.readerLock] and [glib.static_rwlock.StaticRWLock.readerUnlock] have
    to lock and unlock a #GStaticMutex, so it takes at least twice the time
    to lock and unlock a #GStaticRWLock that it does to lock and unlock a
    #GStaticMutex. So only data structures that are accessed by multiple
    readers, and which keep the lock for a considerable time justify a
    #GStaticRWLock. The above example most probably would fare better with a
    #GStaticMutex.

    Deprecated: Use a #GRWLock instead
*/
struct GStaticRWLock
{
  /** */
  GStaticMutex mutex;

  /** */
  GCond* readCond;

  /** */
  GCond* writeCond;

  /** */
  uint readCounter;

  /** */
  gboolean haveWriter;

  /** */
  uint wantToRead;

  /** */
  uint wantToWrite;
}

/**
    A #GStaticRecMutex works like a #GStaticMutex, but it can be locked
    multiple times by one thread. If you enter it n times, you have to
    unlock it n times again to let other threads lock it. An exception
    is the function [glib.static_rec_mutex.StaticRecMutex.unlockFull]: that allows you to
    unlock a #GStaticRecMutex completely returning the depth, (i.e. the
    number of times this mutex was locked). The depth can later be used
    to restore the state of the #GStaticRecMutex by calling
    [glib.static_rec_mutex.StaticRecMutex.lockFull]. In GLib 2.32, #GStaticRecMutex has
    been deprecated in favor of #GRecMutex.
    
    Even though #GStaticRecMutex is not opaque, it should only be used
    with the following functions.
    
    All of the g_static_rec_mutex_* functions can be used even if
    [glib.thread.Thread.init_] has not been called. Then they do nothing, apart
    from [glib.static_rec_mutex.StaticRecMutex.trylock], which does nothing but returning
    true.
*/
struct GStaticRecMutex
{
  /** */
  GStaticMutex mutex;

  /** */
  uint depth;
}

/**
    A [glib.string_.String] is an object that handles the memory management of a C string.
    
    The emphasis of [glib.string_.String] is on text, typically UTF-8. Crucially, the "str" member
    of a [glib.string_.String] is guaranteed to have a trailing nul character, and it is therefore
    always safe to call functions such as `strchr()` or `strdup()` on it.
    
    However, a [glib.string_.String] can also hold arbitrary binary data, because it has a "len" member,
    which includes any possible embedded nul characters in the data. Conceptually then,
    [glib.string_.String] is like a [glib.byte_array.ByteArray] with the addition of many convenience methods for
    text, and a guaranteed nul terminator.
*/
struct GString
{
  /**
      points to the character data. It may move as text is added.
        The @str field is null-terminated and so
        can be used as an ordinary C string.
  */
  char* str;

  /**
      contains the length of the string, not including the
        terminating nul byte.
  */
  size_t len;

  /**
      the number of bytes that can be stored in the
        string before it needs to be reallocated. May be larger than @len.
  */
  size_t allocatedLen;
}

/**
    [glib.string_chunk.StringChunk] provides efficient storage of groups of strings
    
    String chunks are used to store groups of strings. Memory is
    allocated in blocks, and as strings are added to the [glib.string_chunk.StringChunk]
    they are copied into the next free position in a block. When a block
    is full a new block is allocated.
    
    When storing a large number of strings, string chunks are more
    efficient than using `func@GLib.strdup` since fewer calls to `malloc()`
    are needed, and less memory is wasted in memory allocation overheads.
    
    By adding strings with [glib.string_chunk.StringChunk.insertConst] it is also
    possible to remove duplicates.
    
    To create a new [glib.string_chunk.StringChunk] use [glib.string_chunk.StringChunk.new_].
    
    To add strings to a [glib.string_chunk.StringChunk] use [glib.string_chunk.StringChunk.insert].
    
    To add strings to a [glib.string_chunk.StringChunk], but without duplicating strings
    which are already in the [glib.string_chunk.StringChunk], use [glib.string_chunk.StringChunk.insertConst].
    
    To free the entire [glib.string_chunk.StringChunk] use [glib.string_chunk.StringChunk.free].
    It is not possible to free individual strings.
*/
struct GStringChunk;

/**
    [glib.strv_builder.StrvBuilder] is a helper object to build a null-terminated string arrays.
    
    The following example shows how to build a two element array:
    
    ```c
      g_autoptr(GStrvBuilder) builder = g_strv_builder_new ();
      g_strv_builder_add (builder, "hello");
      g_strv_builder_add (builder, "world");
      g_auto(GStrv) array = g_strv_builder_end (builder);
    ```
*/
struct GStrvBuilder;

/**
    An opaque structure representing a test case.
*/
struct GTestCase;

/** */
struct GTestConfig
{
  /** */
  gboolean testInitialized;

  /** */
  gboolean testQuick;

  /** */
  gboolean testPerf;

  /** */
  gboolean testVerbose;

  /** */
  gboolean testQuiet;

  /** */
  gboolean testUndefined;
}

/** */
struct GTestLogBuffer
{
  /** */
  GString* data;

  /** */
  GSList* msgs;
}

/** */
struct GTestLogMsg
{
  /** */
  GTestLogType logType;

  /** */
  uint nStrings;

  /** */
  char** strings;

  /** */
  uint nNums;

  /** */
  real* nums;
}

/**
    An opaque structure representing a test suite.
*/
struct GTestSuite;

/**
    The #GThread struct represents a running thread. This struct
    is returned by [glib.thread.Thread.new_] or [glib.thread.Thread.tryNew]. You can
    obtain the #GThread struct representing the current thread by
    calling [glib.thread.Thread.self].
    
    GThread is refcounted, see [glib.thread.Thread.ref_] and [glib.thread.Thread.unref].
    The thread represented by it holds a reference while it is running,
    and [glib.thread.Thread.join] consumes the reference that it is given, so
    it is normally not necessary to manage GThread references
    explicitly.
    
    The structure is opaque -- none of its fields may be directly
    accessed.
*/
struct GThread
{
  /** */
  GThreadFunc func;

  /** */
  void* data;

  /** */
  gboolean joinable;

  /** */
  GThreadPriority priority;
}

/**
    This function table is no longer used by [glib.thread.Thread.init_]
    to initialize the thread system.
*/
struct GThreadFunctions
{
  /**
      virtual function pointer for [glib.mutex.Mutex.new_]
  */
  extern(C) GMutex* function() mutexNew;

  /**
      virtual function pointer for [glib.mutex.Mutex.lock]
  */
  extern(C) void function(GMutex* mutex) mutexLock;

  /**
      virtual function pointer for [glib.mutex.Mutex.trylock]
  */
  extern(C) gboolean function(GMutex* mutex) mutexTrylock;

  /**
      virtual function pointer for [glib.mutex.Mutex.unlock]
  */
  extern(C) void function(GMutex* mutex) mutexUnlock;

  /**
      virtual function pointer for [glib.mutex.Mutex.free]
  */
  extern(C) void function(GMutex* mutex) mutexFree;

  /**
      virtual function pointer for [glib.cond.Cond.new_]
  */
  extern(C) GCond* function() condNew;

  /**
      virtual function pointer for [glib.cond.Cond.signal]
  */
  extern(C) void function(GCond* cond) condSignal;

  /**
      virtual function pointer for [glib.cond.Cond.broadcast]
  */
  extern(C) void function(GCond* cond) condBroadcast;

  /**
      virtual function pointer for [glib.cond.Cond.wait]
  */
  extern(C) void function(GCond* cond, GMutex* mutex) condWait;

  /**
      virtual function pointer for [glib.cond.Cond.timedWait]
  */
  extern(C) gboolean function(GCond* cond, GMutex* mutex, GTimeVal* endTime) condTimedWait;

  /**
      virtual function pointer for [glib.cond.Cond.free]
  */
  extern(C) void function(GCond* cond) condFree;

  /**
      virtual function pointer for [glib.private_.Private.new_]
  */
  extern(C) GPrivate* function(GDestroyNotify destructor) privateNew;

  /**
      virtual function pointer for [glib.private_.Private.get]
  */
  extern(C) void* function(GPrivate* privateKey) privateGet;

  /**
      virtual function pointer for [glib.private_.Private.set]
  */
  extern(C) void function(GPrivate* privateKey, void* data) privateSet;

  /**
      virtual function pointer for [glib.thread.Thread.create]
  */
  extern(C) void function(GThreadFunc func, void* data, gulong stackSize, gboolean joinable, gboolean bound, GThreadPriority priority, void* thread, GError** _err) threadCreate;

  /**
      virtual function pointer for [glib.thread.Thread.yield]
  */
  extern(C) void function() threadYield;

  /**
      virtual function pointer for [glib.thread.Thread.join]
  */
  extern(C) void function(void* thread) threadJoin;

  /**
      virtual function pointer for [glib.thread.Thread.exit]
  */
  extern(C) void function() threadExit;

  /**
      virtual function pointer for
                            [glib.thread.Thread.setPriority]
  */
  extern(C) void function(void* thread, GThreadPriority priority) threadSetPriority;

  /**
      virtual function pointer for [glib.thread.Thread.self]
  */
  extern(C) void function(void* thread) threadSelf;

  /**
      used internally by recursive mutex locks and by some
                     assertion checks
  */
  extern(C) gboolean function(void* thread1, void* thread2) threadEqual;
}

/**
    The [glib.thread_pool.ThreadPool] struct represents a thread pool.
    
    A thread pool is useful when you wish to asynchronously fork out the execution of work
    and continue working in your own thread. If that will happen often, the overhead of starting
    and destroying a thread each time might be too high. In such cases reusing already started
    threads seems like a good idea. And it indeed is, but implementing this can be tedious
    and error-prone.
    
    Therefore GLib provides thread pools for your convenience. An added advantage is, that the
    threads can be shared between the different subsystems of your program, when they are using GLib.
    
    To create a new thread pool, you use [glib.thread_pool.ThreadPool.new_].
    It is destroyed by [glib.thread_pool.ThreadPool.free].
    
    If you want to execute a certain task within a thread pool, use [glib.thread_pool.ThreadPool.push].
    
    To get the current number of running threads you call [glib.thread_pool.ThreadPool.getNumThreads].
    To get the number of still unprocessed tasks you call [glib.thread_pool.ThreadPool.unprocessed].
    To control the maximum number of threads for a thread pool, you use
    [glib.thread_pool.ThreadPool.getMaxThreads]. and [glib.thread_pool.ThreadPool.setMaxThreads].
    
    Finally you can control the number of unused threads, that are kept alive by GLib for future use.
    The current number can be fetched with [glib.thread_pool.ThreadPool.getNumUnusedThreads].
    The maximum number can be controlled by [glib.thread_pool.ThreadPool.getMaxUnusedThreads] and
    [glib.thread_pool.ThreadPool.setMaxUnusedThreads]. All currently unused threads
    can be stopped by calling [glib.thread_pool.ThreadPool.stopUnusedThreads].
*/
struct GThreadPool
{
  /**
      the function to execute in the threads of this pool
  */
  GFunc func;

  /**
      the user data for the threads of this pool
  */
  void* userData;

  /**
      are all threads exclusive to this pool
  */
  gboolean exclusive;
}

/**
    Represents a precise time, with seconds and microseconds.
    
    Similar to the struct timeval returned by the `gettimeofday()`
    UNIX system call.
    
    GLib is attempting to unify around the use of 64-bit integers to
    represent microsecond-precision time. As such, this type will be
    removed from a future version of GLib. A consequence of using `glong` for
    `tv_sec` is that on 32-bit systems [glib.time_val.TimeVal] is subject to the year 2038
    problem.

    Deprecated: Use #GDateTime or #guint64 instead.
*/
struct GTimeVal
{
  /**
      seconds
  */
  glong tvSec;

  /**
      microseconds
  */
  glong tvUsec;
}

/**
    A [glib.time_zone.TimeZone] represents a time zone, at no particular point in time.
    
    The [glib.time_zone.TimeZone] struct is refcounted and immutable.
    
    Each time zone has an identifier (for example, ‘Europe/London’) which is
    platform dependent. See [glib.time_zone.TimeZone.new_] for information on the
    identifier formats. The identifier of a time zone can be retrieved using
    [glib.time_zone.TimeZone.getIdentifier].
    
    A time zone contains a number of intervals. Each interval has an abbreviation
    to describe it (for example, ‘PDT’), an offset to UTC and a flag indicating
    if the daylight savings time is in effect during that interval. A time zone
    always has at least one interval — interval 0. Note that interval abbreviations
    are not the same as time zone identifiers (apart from ‘UTC’), and cannot be
    passed to [glib.time_zone.TimeZone.new_].
    
    Every UTC time is contained within exactly one interval, but a given
    local time may be contained within zero, one or two intervals (due to
    incontinuities associated with daylight savings time).
    
    An interval may refer to a specific period of time (eg: the duration
    of daylight savings time during 2010) or it may refer to many periods
    of time that share the same properties (eg: all periods of daylight
    savings time).  It is also possible (usually for political reasons)
    that some properties (like the abbreviation) change between intervals
    without other properties changing.
*/
struct GTimeZone;

/**
    [glib.timer.Timer] records a start time, and counts microseconds elapsed since
    that time.
    
    This is done somewhat differently on different platforms, and can be
    tricky to get exactly right, so [glib.timer.Timer] provides a portable/convenient interface.
*/
struct GTimer;

/**
    A union holding the value of the token.
*/
union GTokenValue
{
  /**
      token symbol value
  */
  void* vSymbol;

  /**
      token identifier value
  */
  char* vIdentifier;

  /**
      token binary integer value
  */
  gulong vBinary;

  /**
      octal integer value
  */
  gulong vOctal;

  /**
      integer value
  */
  gulong vInt;

  /**
      64-bit integer value
  */
  ulong vInt64;

  /**
      floating point value
  */
  double vFloat;

  /**
      hex integer value
  */
  gulong vHex;

  /**
      string value
  */
  char* vString;

  /**
      comment value
  */
  char* vComment;

  /**
      character value
  */
  ubyte vChar;

  /**
      error value
  */
  uint vError;
}

/**
    A [glib.types.TrashStack] is an efficient way to keep a stack of unused allocated
    memory chunks. Each memory chunk is required to be large enough to hold
    a [xlib.types.void*]. This allows the stack to be maintained without any space
    overhead, since the stack pointers can be stored inside the memory chunks.
    
    There is no function to create a [glib.types.TrashStack]. A `NULL` `GTrashStack*`
    is a perfectly valid empty stack.
    
    Each piece of memory that is pushed onto the stack is cast to a
    `GTrashStack*`.
    
    There is no longer any good reason to use [glib.types.TrashStack].  If you have
    extra pieces of memory, `free()` them and allocate them again later.

    Deprecated: [glib.types.TrashStack] is deprecated without replacement
*/
struct GTrashStack
{
  /**
      pointer to the previous element of the stack,
          gets stored in the first `sizeof (gpointer)`
          bytes of the element
  */
  GTrashStack* next;
}

/**
    The GTree struct is an opaque data structure representing a
    [balanced binary tree][glib-Balanced-Binary-Trees]. It should be
    accessed only by using the following functions.
*/
struct GTree;

/**
    An opaque type which identifies a specific node in a #GTree.
*/
struct GTreeNode;

/**
    The #GTuples struct is used to return records (or tuples) from the
    #GRelation by [glib.relation.Relation.select]. It only contains one public
    member - the number of records that matched. To access the matched
    records, you must use [glib.tuples.Tuples.index].

    Deprecated: Rarely used API
*/
struct GTuples
{
  /**
      the number of records that matched.
  */
  uint len;
}

/**
    A Unix pipe. The advantage of this type over `int[2]` is that it can
    be closed automatically when it goes out of scope, using `g_auto(GUnixPipe)`,
    on compilers that support that feature.
*/
struct GUnixPipe
{
  /**
      A pair of file descriptors, each negative if closed or not yet opened.
       The file descriptor with index `G_UNIX_PIPE_END_READ` is readable.
       The file descriptor with index `G_UNIX_PIPE_END_WRITE` is writable.
  */
  int[2] fds;
}

/**
    The [glib.uri.Uri] type and related functions can be used to parse URIs into
    their components, and build valid URIs from individual components.
    
    Since [glib.uri.Uri] only represents absolute URIs, all [glib.uri.Uri]s will have a
    URI scheme, so [glib.uri.Uri.getScheme] will always return a non-`NULL`
    answer. Likewise, by definition, all URIs have a path component, so
    [glib.uri.Uri.getPath] will always return a non-`NULL` string (which may
    be empty).
    
    If the URI string has an
    [‘authority’ component](https://tools.ietf.org/html/rfc3986#section-3) (that
    is, if the scheme is followed by `://` rather than just `:`), then the
    [glib.uri.Uri] will contain a hostname, and possibly a port and ‘userinfo’.
    Additionally, depending on how the [glib.uri.Uri] was constructed/parsed (for example,
    using the `G_URI_FLAGS_HAS_PASSWORD` and `G_URI_FLAGS_HAS_AUTH_PARAMS` flags),
    the userinfo may be split out into a username, password, and
    additional authorization-related parameters.
    
    Normally, the components of a [glib.uri.Uri] will have all `%`-encoded
    characters decoded. However, if you construct/parse a [glib.uri.Uri] with
    `G_URI_FLAGS_ENCODED`, then the `%`-encoding will be preserved instead in
    the userinfo, path, and query fields (and in the host field if also
    created with `G_URI_FLAGS_NON_DNS`). In particular, this is necessary if
    the URI may contain binary data or non-UTF-8 text, or if decoding
    the components might change the interpretation of the URI.
    
    For example, with the encoded flag:
    
    ```c
    g_autoptr(GUri) uri = g_uri_parse ("http://host/path?query=http%3A%2F%2Fhost%2Fpath%3Fparam%3Dvalue", G_URI_FLAGS_ENCODED, &err);
    g_assert_cmpstr (g_uri_get_query (uri), ==, "query=http%3A%2F%2Fhost%2Fpath%3Fparam%3Dvalue");
    ```
    
    While the default `%`-decoding behaviour would give:
    
    ```c
    g_autoptr(GUri) uri = g_uri_parse ("http://host/path?query=http%3A%2F%2Fhost%2Fpath%3Fparam%3Dvalue", G_URI_FLAGS_NONE, &err);
    g_assert_cmpstr (g_uri_get_query (uri), ==, "query=http://host/path?param=value");
    ```
    
    During decoding, if an invalid UTF-8 string is encountered, parsing will fail
    with an error indicating the bad string location:
    
    ```c
    g_autoptr(GUri) uri = g_uri_parse ("http://host/path?query=http%3A%2F%2Fhost%2Fpath%3Fbad%3D%00alue", G_URI_FLAGS_NONE, &err);
    g_assert_error (err, G_URI_ERROR, G_URI_ERROR_BAD_QUERY);
    ```
    
    You should pass `G_URI_FLAGS_ENCODED` or `G_URI_FLAGS_ENCODED_QUERY` if you
    need to handle that case manually. In particular, if the query string
    contains `=` characters that are `%`-encoded, you should let
    [glib.uri.Uri.parseParams] do the decoding once of the query.
    
    [glib.uri.Uri] is immutable once constructed, and can safely be accessed from
    multiple threads. Its reference counting is atomic.
    
    Note that the scope of [glib.uri.Uri] is to help manipulate URIs in various applications,
    following [RFC 3986](https://tools.ietf.org/html/rfc3986). In particular,
    it doesn't intend to cover web browser needs, and doesn’t implement the
    [WHATWG URL](https://url.spec.whatwg.org/) standard. No APIs are provided to
    help prevent
    [homograph attacks](https://en.wikipedia.org/wiki/IDN_homograph_attack), so
    [glib.uri.Uri] is not suitable for formatting URIs for display to the user for making
    security-sensitive decisions.
    
    ## Relative and absolute URIs
    
    As defined in [RFC 3986](https://tools.ietf.org/html/rfc3986#section-4), the
    hierarchical nature of URIs means that they can either be ‘relative
    references’ (sometimes referred to as ‘relative URIs’) or ‘URIs’ (for
    clarity, ‘URIs’ are referred to in this documentation as
    ‘absolute URIs’ — although
    [in constrast to RFC 3986](https://tools.ietf.org/html/rfc3986#section-4.3),
    fragment identifiers are always allowed).
    
    Relative references have one or more components of the URI missing. In
    particular, they have no scheme. Any other component, such as hostname,
    query, etc. may be missing, apart from a path, which has to be specified (but
    may be empty). The path may be relative, starting with `./` rather than `/`.
    
    For example, a valid relative reference is `./path?query`,
    `/?query#fragment` or `//example.com`.
    
    Absolute URIs have a scheme specified. Any other components of the URI which
    are missing are specified as explicitly unset in the URI, rather than being
    resolved relative to a base URI using [glib.uri.Uri.parseRelative].
    
    For example, a valid absolute URI is `file:///home/bob` or
    `https://search.com?query=string`.
    
    A [glib.uri.Uri] instance is always an absolute URI. A string may be an absolute URI
    or a relative reference; see the documentation for individual functions as to
    what forms they accept.
    
    ## Parsing URIs
    
    The most minimalist APIs for parsing URIs are [glib.uri.Uri.split] and
    [glib.uri.Uri.splitWithUser]. These split a URI into its component
    parts, and return the parts; the difference between the two is that
    [glib.uri.Uri.split] treats the ‘userinfo’ component of the URI as a
    single element, while [glib.uri.Uri.splitWithUser] can (depending on the
    [glib.types.UriFlags] you pass) treat it as containing a username, password,
    and authentication parameters. Alternatively, [glib.uri.Uri.splitNetwork]
    can be used when you are only interested in the components that are
    needed to initiate a network connection to the service (scheme,
    host, and port).
    
    [glib.uri.Uri.parse] is similar to [glib.uri.Uri.split], but instead of
    returning individual strings, it returns a [glib.uri.Uri] structure (and it requires
    that the URI be an absolute URI).
    
    [glib.uri.Uri.resolveRelative] and [glib.uri.Uri.parseRelative] allow
    you to resolve a relative URI relative to a base URI.
    [glib.uri.Uri.resolveRelative] takes two strings and returns a string,
    and [glib.uri.Uri.parseRelative] takes a [glib.uri.Uri] and a string and returns a
    [glib.uri.Uri].
    
    All of the parsing functions take a [glib.types.UriFlags] argument describing
    exactly how to parse the URI; see the documentation for that type
    for more details on the specific flags that you can pass. If you
    need to choose different flags based on the type of URI, you can
    use [glib.uri.Uri.peekScheme] on the URI string to check the scheme
    first, and use that to decide what flags to parse it with.
    
    For example, you might want to use `G_URI_PARAMS_WWW_FORM` when parsing the
    params for a web URI, so compare the result of [glib.uri.Uri.peekScheme]
    against `http` and `https`.
    
    ## Building URIs
    
    [glib.uri.Uri.join] and [glib.uri.Uri.joinWithUser] can be used to construct
    valid URI strings from a set of component strings. They are the
    inverse of [glib.uri.Uri.split] and [glib.uri.Uri.splitWithUser].
    
    Similarly, [glib.uri.Uri.build] and [glib.uri.Uri.buildWithUser] can be
    used to construct a [glib.uri.Uri] from a set of component strings.
    
    As with the parsing functions, the building functions take a
    [glib.types.UriFlags] argument. In particular, it is important to keep in mind
    whether the URI components you are using are already `%`-encoded. If so,
    you must pass the `G_URI_FLAGS_ENCODED` flag.
    
    ## `file://` URIs
    
    Note that Windows and Unix both define special rules for parsing
    `file://` URIs (involving non-UTF-8 character sets on Unix, and the
    interpretation of path separators on Windows). [glib.uri.Uri] does not
    implement these rules. Use `func@GLib.filename_from_uri` and
    `func@GLib.filename_to_uri` if you want to properly convert between
    `file://` URIs and local filenames.
    
    ## URI Equality
    
    Note that there is no `g_uri_equal ()` function, because comparing
    URIs usefully requires scheme-specific knowledge that [glib.uri.Uri] does
    not have. [glib.uri.Uri] can help with normalization if you use the various
    encoded [glib.types.UriFlags] as well as `G_URI_FLAGS_SCHEME_NORMALIZE`
    however it is not comprehensive.
    For example, `data:,foo` and `data:;base64,Zm9v` resolve to the same
    thing according to the `data:` URI specification which GLib does not
    handle.
*/
struct GUri;

/**
    Many URI schemes include one or more attribute/value pairs as part of the URI
    value. For example `scheme://server/path?query=string&is=there` has two
    attributes – `query=string` and `is=there` – in its query part.
    
    A #GUriParamsIter structure represents an iterator that can be used to
    iterate over the attribute/value pairs of a URI query string. #GUriParamsIter
    structures are typically allocated on the stack and then initialized with
    [glib.uri_params_iter.UriParamsIter.init_]. See the documentation for [glib.uri_params_iter.UriParamsIter.init_]
    for a usage example.
*/
struct GUriParamsIter
{
  /** */
  int dummy0;

  /** */
  void* dummy1;

  /** */
  void* dummy2;

  /** */
  ubyte[256] dummy3;
}

/**
    [glib.variant.Variant] is a variant datatype; it can contain one or more values
    along with information about the type of the values.
    
    A [glib.variant.Variant] may contain simple types, like an integer, or a boolean value;
    or complex types, like an array of two strings, or a dictionary of key
    value pairs. A [glib.variant.Variant] is also immutable: once it’s been created neither
    its type nor its content can be modified further.
    
    [glib.variant.Variant] is useful whenever data needs to be serialized, for example when
    sending method parameters in D-Bus, or when saving settings using
    [[gio.settings.Settings]](../gio/class.Settings.html).
    
    When creating a new [glib.variant.Variant], you pass the data you want to store in it
    along with a string representing the type of data you wish to pass to it.
    
    For instance, if you want to create a [glib.variant.Variant] holding an integer value you
    can use:
    
    ```c
    GVariant *v = g_variant_new ("u", 40);
    ```
    
    The string `u` in the first argument tells [glib.variant.Variant] that the data passed to
    the constructor (`40`) is going to be an unsigned integer.
    
    More advanced examples of [glib.variant.Variant] in use can be found in documentation for
    [[glib.variant.Variant] format strings](gvariant-format-strings.html#pointers).
    
    The range of possible values is determined by the type.
    
    The type system used by [glib.variant.Variant] is [glib.variant_type.VariantType].
    
    [glib.variant.Variant] instances always have a type and a value (which are given
    at construction time).  The type and value of a [glib.variant.Variant] instance
    can never change other than by the [glib.variant.Variant] itself being
    destroyed.  A [glib.variant.Variant] cannot contain a pointer.
    
    [glib.variant.Variant] is reference counted using [glib.variant.Variant.ref_] and
    [glib.variant.Variant.unref].  [glib.variant.Variant] also has floating reference counts —
    see [glib.variant.Variant.refSink].
    
    [glib.variant.Variant] is completely threadsafe.  A [glib.variant.Variant] instance can be
    concurrently accessed in any way from any number of threads without
    problems.
    
    [glib.variant.Variant] is heavily optimised for dealing with data in serialized
    form.  It works particularly well with data located in memory-mapped
    files.  It can perform nearly all deserialization operations in a
    small constant time, usually touching only a single memory page.
    Serialized [glib.variant.Variant] data can also be sent over the network.
    
    [glib.variant.Variant] is largely compatible with D-Bus.  Almost all types of
    [glib.variant.Variant] instances can be sent over D-Bus.  See [glib.variant_type.VariantType] for
    exceptions.  (However, [glib.variant.Variant]’s serialization format is not the same
    as the serialization format of a D-Bus message body: use
    [GDBusMessage](../gio/class.DBusMessage.html), in the GIO library, for those.)
    
    For space-efficiency, the [glib.variant.Variant] serialization format does not
    automatically include the variant’s length, type or endianness,
    which must either be implied from context (such as knowledge that a
    particular file format always contains a little-endian
    `G_VARIANT_TYPE_VARIANT` which occupies the whole length of the file)
    or supplied out-of-band (for instance, a length, type and/or endianness
    indicator could be placed at the beginning of a file, network message
    or network stream).
    
    A [glib.variant.Variant]’s size is limited mainly by any lower level operating
    system constraints, such as the number of bits in [gobject.types.size_t].  For
    example, it is reasonable to have a 2GB file mapped into memory
    with [glib.mapped_file.MappedFile], and call [glib.variant.Variant.newFromData] on
    it.
    
    For convenience to C programmers, [glib.variant.Variant] features powerful
    varargs-based value construction and destruction.  This feature is
    designed to be embedded in other libraries.
    
    There is a Python-inspired text language for describing [glib.variant.Variant]
    values.  [glib.variant.Variant] includes a printer for this language and a parser
    with type inferencing.
    
    ## Memory Use
    
    [glib.variant.Variant] tries to be quite efficient with respect to memory use.
    This section gives a rough idea of how much memory is used by the
    current implementation.  The information here is subject to change
    in the future.
    
    The memory allocated by [glib.variant.Variant] can be grouped into 4 broad
    purposes: memory for serialized data, memory for the type
    information cache, buffer management memory and memory for the
    [glib.variant.Variant] structure itself.
    
    ## Serialized Data Memory
    
    This is the memory that is used for storing [glib.variant.Variant] data in
    serialized form.  This is what would be sent over the network or
    what would end up on disk, not counting any indicator of the
    endianness, or of the length or type of the top-level variant.
    
    The amount of memory required to store a boolean is 1 byte. 16,
    32 and 64 bit integers and double precision floating point numbers
    use their ‘natural’ size.  Strings (including object path and
    signature strings) are stored with a nul terminator, and as such
    use the length of the string plus 1 byte.
    
    ‘Maybe’ types use no space at all to represent the null value and
    use the same amount of space (sometimes plus one byte) as the
    equivalent non-maybe-typed value to represent the non-null case.
    
    Arrays use the amount of space required to store each of their
    members, concatenated.  Additionally, if the items stored in an
    array are not of a fixed-size (ie: strings, other arrays, etc)
    then an additional framing offset is stored for each item.  The
    size of this offset is either 1, 2 or 4 bytes depending on the
    overall size of the container.  Additionally, extra padding bytes
    are added as required for alignment of child values.
    
    Tuples (including dictionary entries) use the amount of space
    required to store each of their members, concatenated, plus one
    framing offset (as per arrays) for each non-fixed-sized item in
    the tuple, except for the last one.  Additionally, extra padding
    bytes are added as required for alignment of child values.
    
    Variants use the same amount of space as the item inside of the
    variant, plus 1 byte, plus the length of the type string for the
    item inside the variant.
    
    As an example, consider a dictionary mapping strings to variants.
    In the case that the dictionary is empty, 0 bytes are required for
    the serialization.
    
    If we add an item ‘width’ that maps to the int32 value of 500 then
    we will use 4 bytes to store the int32 (so 6 for the variant
    containing it) and 6 bytes for the string.  The variant must be
    aligned to 8 after the 6 bytes of the string, so that’s 2 extra
    bytes.  6 (string) + 2 (padding) + 6 (variant) is 14 bytes used
    for the dictionary entry.  An additional 1 byte is added to the
    array as a framing offset making a total of 15 bytes.
    
    If we add another entry, ‘title’ that maps to a nullable string
    that happens to have a value of null, then we use 0 bytes for the
    null value (and 3 bytes for the variant to contain it along with
    its type string) plus 6 bytes for the string.  Again, we need 2
    padding bytes.  That makes a total of 6 + 2 + 3 = 11 bytes.
    
    We now require extra padding between the two items in the array.
    After the 14 bytes of the first item, that’s 2 bytes required.
    We now require 2 framing offsets for an extra two
    bytes. 14 + 2 + 11 + 2 = 29 bytes to encode the entire two-item
    dictionary.
    
    ## Type Information Cache
    
    For each [glib.variant.Variant] type that currently exists in the program a type
    information structure is kept in the type information cache.  The
    type information structure is required for rapid deserialization.
    
    Continuing with the above example, if a [glib.variant.Variant] exists with the
    type `a{sv}` then a type information struct will exist for
    `a{sv}`, `{sv}`, `s`, and `v`.  Multiple uses of the same type
    will share the same type information.  Additionally, all
    single-digit types are stored in read-only static memory and do
    not contribute to the writable memory footprint of a program using
    [glib.variant.Variant].
    
    Aside from the type information structures stored in read-only
    memory, there are two forms of type information.  One is used for
    container types where there is a single element type: arrays and
    maybe types.  The other is used for container types where there
    are multiple element types: tuples and dictionary entries.
    
    Array type info structures are `6 * sizeof (void *)`, plus the
    memory required to store the type string itself.  This means that
    on 32-bit systems, the cache entry for `a{sv}` would require 30
    bytes of memory (plus allocation overhead).
    
    Tuple type info structures are `6 * sizeof (void *)`, plus `4 *
    sizeof (void *)` for each item in the tuple, plus the memory
    required to store the type string itself.  A 2-item tuple, for
    example, would have a type information structure that consumed
    writable memory in the size of `14 * sizeof (void *)` (plus type
    string)  This means that on 32-bit systems, the cache entry for
    `{sv}` would require 61 bytes of memory (plus allocation overhead).
    
    This means that in total, for our `a{sv}` example, 91 bytes of
    type information would be allocated.
    
    The type information cache, additionally, uses a [glib.hash_table.HashTable] to
    store and look up the cached items and stores a pointer to this
    hash table in static storage.  The hash table is freed when there
    are zero items in the type cache.
    
    Although these sizes may seem large it is important to remember
    that a program will probably only have a very small number of
    different types of values in it and that only one type information
    structure is required for many different values of the same type.
    
    ## Buffer Management Memory
    
    [glib.variant.Variant] uses an internal buffer management structure to deal
    with the various different possible sources of serialized data
    that it uses.  The buffer is responsible for ensuring that the
    correct call is made when the data is no longer in use by
    [glib.variant.Variant].  This may involve a `func@GLib.free` or
    even [glib.mapped_file.MappedFile.unref].
    
    One buffer management structure is used for each chunk of
    serialized data.  The size of the buffer management structure
    is `4 * (void *)`.  On 32-bit systems, that’s 16 bytes.
    
    ## GVariant structure
    
    The size of a [glib.variant.Variant] structure is `6 * (void *)`.  On 32-bit
    systems, that’s 24 bytes.
    
    [glib.variant.Variant] structures only exist if they are explicitly created
    with API calls.  For example, if a [glib.variant.Variant] is constructed out of
    serialized data for the example given above (with the dictionary)
    then although there are 9 individual values that comprise the
    entire dictionary (two keys, two values, two variants containing
    the values, two dictionary entries, plus the dictionary itself),
    only 1 [glib.variant.Variant] instance exists — the one referring to the
    dictionary.
    
    If calls are made to start accessing the other values then
    [glib.variant.Variant] instances will exist for those values only for as long
    as they are in use (ie: until you call [glib.variant.Variant.unref]).  The
    type information is shared.  The serialized data and the buffer
    management structure for that serialized data is shared by the
    child.
    
    ## Summary
    
    To put the entire example together, for our dictionary mapping
    strings to variants (with two entries, as given above), we are
    using 91 bytes of memory for type information, 29 bytes of memory
    for the serialized data, 16 bytes for buffer management and 24
    bytes for the [glib.variant.Variant] instance, or a total of 160 bytes, plus
    allocation overhead.  If we were to use [glib.variant.Variant.getChildValue]
    to access the two dictionary entries, we would use an additional 48
    bytes.  If we were to have other dictionaries of the same type, we
    would use more memory for the serialized data and buffer
    management for those dictionaries, but the type information would
    be shared.
*/
struct GVariant;

/**
    A utility type for constructing container-type #GVariant instances.
    
    This is an opaque structure and may only be accessed using the
    following functions.
    
    #GVariantBuilder is not threadsafe in any way.  Do not attempt to
    access it from more than one thread.
*/
struct GVariantBuilder
{
  /** */
  /** */
  union UType
  {
    /** */
    /** */
    struct SType
    {
      /** */
      size_t partialMagic;

      /** */
      const(GVariantType)* type;

      /** */
      size_t[14] y;
    }

    SType s;

    /** */
    size_t[16] x;
  }

  UType u;
}

/**
    #GVariantDict is a mutable interface to #GVariant dictionaries.
    
    It can be used for doing a sequence of dictionary lookups in an
    efficient way on an existing #GVariant dictionary or it can be used
    to construct new dictionaries with a hashtable-like interface.  It
    can also be used for taking existing dictionaries and modifying them
    in order to create new ones.
    
    #GVariantDict can only be used with `G_VARIANT_TYPE_VARDICT`
    dictionaries.
    
    It is possible to use #GVariantDict allocated on the stack or on the
    heap.  When using a stack-allocated #GVariantDict, you begin with a
    call to [glib.variant_dict.VariantDict.init_] and free the resources with a call to
    [glib.variant_dict.VariantDict.clear].
    
    Heap-allocated #GVariantDict follows normal refcounting rules: you
    allocate it with [glib.variant_dict.VariantDict.new_] and use [glib.variant_dict.VariantDict.ref_]
    and [glib.variant_dict.VariantDict.unref].
    
    [glib.variant_dict.VariantDict.end] is used to convert the #GVariantDict back into a
    dictionary-type #GVariant.  When used with stack-allocated instances,
    this also implicitly frees all associated memory, but for
    heap-allocated instances, you must still call [glib.variant_dict.VariantDict.unref]
    afterwards.
    
    You will typically want to use a heap-allocated #GVariantDict when
    you expose it as part of an API.  For most other uses, the
    stack-allocated form will be more convenient.
    
    Consider the following two examples that do the same thing in each
    style: take an existing dictionary and look up the "count" uint32
    key, adding 1 to it if it is found, or returning an error if the
    key is not found.  Each returns the new dictionary as a floating
    #GVariant.
    
    ## Using a stack-allocated GVariantDict
    
    ```c
      GVariant *
      add_to_count (GVariant  *orig,
                    GError   **error)
      {
        GVariantDict dict;
        guint32 count;
    
        g_variant_dict_init (&dict, orig);
        if (!g_variant_dict_lookup (&dict, "count", "u", &count))
          {
            g_set_error (...);
            g_variant_dict_clear (&dict);
            return NULL;
          }
    
        g_variant_dict_insert (&dict, "count", "u", count + 1);
    
        return g_variant_dict_end (&dict);
      }
    ```
    
    ## Using heap-allocated GVariantDict
    
    ```c
      GVariant *
      add_to_count (GVariant  *orig,
                    GError   **error)
      {
        GVariantDict *dict;
        GVariant *result;
        guint32 count;
    
        dict = g_variant_dict_new (orig);
    
        if (g_variant_dict_lookup (dict, "count", "u", &count))
          {
            g_variant_dict_insert (dict, "count", "u", count + 1);
            result = g_variant_dict_end (dict);
          }
        else
          {
            g_set_error (...);
            result = NULL;
          }
    
        g_variant_dict_unref (dict);
    
        return result;
      }
    ```
*/
struct GVariantDict;

/**
    #GVariantIter is an opaque data structure and can only be accessed
    using the following functions.
*/
struct GVariantIter
{
  /** */
  size_t[16] x;
}

/**
    A type in the [glib.variant.Variant] type system.
    
    This section introduces the [glib.variant.Variant] type system. It is based, in
    large part, on the D-Bus type system, with two major changes and
    some minor lifting of restrictions. The
    [D-Bus specification](http://dbus.freedesktop.org/doc/dbus-specification.html),
    therefore, provides a significant amount of
    information that is useful when working with [glib.variant.Variant].
    
    The first major change with respect to the D-Bus type system is the
    introduction of maybe (or ‘nullable’) types.  Any type in [glib.variant.Variant]
    can be converted to a maybe type, in which case, `nothing` (or `null`)
    becomes a valid value.  Maybe types have been added by introducing the
    character `m` to type strings.
    
    The second major change is that the [glib.variant.Variant] type system supports
    the concept of ‘indefinite types’ — types that are less specific than
    the normal types found in D-Bus.  For example, it is possible to speak
    of ‘an array of any type’ in [glib.variant.Variant], where the D-Bus type system
    would require you to speak of ‘an array of integers’ or ‘an array of
    strings’.  Indefinite types have been added by introducing the
    characters `*`, `?` and `r` to type strings.
    
    Finally, all arbitrary restrictions relating to the complexity of
    types are lifted along with the restriction that dictionary entries
    may only appear nested inside of arrays.
    
    Just as in D-Bus, [glib.variant.Variant] types are described with strings (‘type
    strings’).  Subject to the differences mentioned above, these strings
    are of the same form as those found in D-Bus.  Note, however: D-Bus
    always works in terms of messages and therefore individual type
    strings appear nowhere in its interface.  Instead, ‘signatures’
    are a concatenation of the strings of the type of each argument in a
    message.  [glib.variant.Variant] deals with single values directly so
    [glib.variant.Variant] type strings always describe the type of exactly one
    value.  This means that a D-Bus signature string is generally not a valid
    [glib.variant.Variant] type string — except in the case that it is the signature
    of a message containing exactly one argument.
    
    An indefinite type is similar in spirit to what may be called an
    abstract type in other type systems.  No value can exist that has an
    indefinite type as its type, but values can exist that have types
    that are subtypes of indefinite types.  That is to say,
    [glib.variant.Variant.getType] will never return an indefinite type, but
    calling [glib.variant.Variant.isOfType] with an indefinite type may return
    true.  For example, you cannot have a value that represents ‘an
    array of no particular type’, but you can have an ‘array of integers’
    which certainly matches the type of ‘an array of no particular type’,
    since ‘array of integers’ is a subtype of ‘array of no particular
    type’.
    
    This is similar to how instances of abstract classes may not
    directly exist in other type systems, but instances of their
    non-abstract subtypes may.  For example, in GTK, no object that has
    the type of [[gtk.widget.Widget]](https://docs.gtk.org/gtk4/class.Widget.html) can
    exist (since [gtk.widget.Widget] is an abstract class), but a [[gtk.window.Window]](https://docs.gtk.org/gtk4/class.Window.html)
    can certainly be instantiated, and you would say that a [gtk.window.Window] is a
    [gtk.widget.Widget] (since [gtk.window.Window] is a subclass of [gtk.widget.Widget]).
    
    Two types may not be compared by value; use [glib.variant_type.VariantType.equal]
    or [glib.variant_type.VariantType.isSubtypeOf]  May be copied using
    [glib.variant_type.VariantType.copy] and freed using [glib.variant_type.VariantType.free].
    
    ## GVariant Type Strings
    
    A [glib.variant.Variant] type string can be any of the following:
    
    $(LIST
      * any basic type string (listed below)
      * `v`, `r` or `*`
      * one of the characters `a` or `m`, followed by another type string
      * the character `(`, followed by a concatenation of zero or more other
        type strings, followed by the character `)`
      * the character `{`, followed by a basic type string (see below),
        followed by another type string, followed by the character `}`
    )
      
    A basic type string describes a basic type (as per
    [glib.variant_type.VariantType.isBasic]) and is always a single character in
    length. The valid basic type strings are `b`, `y`, `n`, `q`, `i`, `u`, `x`,
    `t`, `h`, `d`, `s`, `o`, `g` and `?`.
    
    The above definition is recursive to arbitrary depth. `aaaaai` and
    `(ui(nq((y)))s)` are both valid type strings, as is
    `a(aa(ui)(qna{ya(yd)}))`. In order to not hit memory limits,
    [glib.variant.Variant] imposes a limit on recursion depth of 65 nested
    containers. This is the limit in the D-Bus specification (64) plus one to
    allow a [[gio.dbus_message.DBusMessage]](../gio/class.DBusMessage.html) to be nested in
    a top-level tuple.
    
    The meaning of each of the characters is as follows:
    
    $(LIST
      * `b`: the type string of `G_VARIANT_TYPE_BOOLEAN`; a boolean value.
      * `y`: the type string of `G_VARIANT_TYPE_BYTE`; a byte.
      * `n`: the type string of `G_VARIANT_TYPE_INT16`; a signed 16 bit integer.
      * `q`: the type string of `G_VARIANT_TYPE_UINT16`; an unsigned 16 bit integer.
      * `i`: the type string of `G_VARIANT_TYPE_INT32`; a signed 32 bit integer.
      * `u`: the type string of `G_VARIANT_TYPE_UINT32`; an unsigned 32 bit integer.
      * `x`: the type string of `G_VARIANT_TYPE_INT64`; a signed 64 bit integer.
      * `t`: the type string of `G_VARIANT_TYPE_UINT64`; an unsigned 64 bit integer.
      * `h`: the type string of `G_VARIANT_TYPE_HANDLE`; a signed 32 bit value
        that, by convention, is used as an index into an array of file
        descriptors that are sent alongside a D-Bus message.
      * `d`: the type string of `G_VARIANT_TYPE_DOUBLE`; a double precision
        floating point value.
      * `s`: the type string of `G_VARIANT_TYPE_STRING`; a string.
      * `o`: the type string of `G_VARIANT_TYPE_OBJECT_PATH`; a string in the form
        of a D-Bus object path.
      * `g`: the type string of `G_VARIANT_TYPE_SIGNATURE`; a string in the form of
        a D-Bus type signature.
      * `?`: the type string of `G_VARIANT_TYPE_BASIC`; an indefinite type that
        is a supertype of any of the basic types.
      * `v`: the type string of `G_VARIANT_TYPE_VARIANT`; a container type that
        contain any other type of value.
      * `a`: used as a prefix on another type string to mean an array of that
        type; the type string `ai`, for example, is the type of an array of
        signed 32-bit integers.
      * `m`: used as a prefix on another type string to mean a ‘maybe’, or
        ‘nullable’, version of that type; the type string `ms`, for example,
        is the type of a value that maybe contains a string, or maybe contains
        nothing.
      * `()`: used to enclose zero or more other concatenated type strings to
        create a tuple type; the type string `(is)`, for example, is the type of
        a pair of an integer and a string.
      * `r`: the type string of `G_VARIANT_TYPE_TUPLE`; an indefinite type that is
        a supertype of any tuple type, regardless of the number of items.
      * `{}`: used to enclose a basic type string concatenated with another type
        string to create a dictionary entry type, which usually appears inside of
        an array to form a dictionary; the type string `a{sd}`, for example, is
        the type of a dictionary that maps strings to double precision floating
        point values.
      
        The first type (the basic type) is the key type and the second type is
        the value type. The reason that the first type is restricted to being a
        basic type is so that it can easily be hashed.
      * `*`: the type string of `G_VARIANT_TYPE_ANY`; the indefinite type that is
        a supertype of all types.  Note that, as with all type strings, this
        character represents exactly one type. It cannot be used inside of tuples
        to mean ‘any number of items’.
    )
      
    Any type string of a container that contains an indefinite type is,
    itself, an indefinite type. For example, the type string `a*`
    (corresponding to `G_VARIANT_TYPE_ARRAY`) is an indefinite type
    that is a supertype of every array type. `(*s)` is a supertype
    of all tuples that contain exactly two items where the second
    item is a string.
    
    `a{?*}` is an indefinite type that is a supertype of all arrays
    containing dictionary entries where the key is any basic type and
    the value is any type at all.  This is, by definition, a dictionary,
    so this type string corresponds to `G_VARIANT_TYPE_DICTIONARY`. Note
    that, due to the restriction that the key of a dictionary entry must
    be a basic type, `{**}` is not a valid type string.
*/
struct GVariantType;

alias extern(C) void function(void* value) GCacheDestroyFunc;

alias extern(C) void* function(void* value) GCacheDupFunc;

alias extern(C) void* function(void* key) GCacheNewFunc;

alias extern(C) void function(GPid pid, int waitStatus, void* userData) GChildWatchFunc;

alias extern(C) void function(uint handleId) GClearHandleFunc;

alias extern(C) int function(const(void)* a, const(void)* b, void* userData) GCompareDataFunc;

alias extern(C) int function(const(void)* a, const(void)* b) GCompareFunc;

alias extern(C) char* function(void* item) GCompletionFunc;

alias extern(C) int function(const(char)* s1, const(char)* s2, size_t n) GCompletionStrncmpFunc;

alias extern(C) void* function(const(void)* src, void* data) GCopyFunc;

alias extern(C) void function(GQuark keyId, void* data, void* userData) GDataForeachFunc;

alias extern(C) void function(void* data) GDestroyNotify;

alias extern(C) void* function(void* data, void* userData) GDuplicateFunc;

alias extern(C) gboolean function(const(void)* a, const(void)* b) GEqualFunc;

alias extern(C) gboolean function(const(void)* a, const(void)* b, void* userData) GEqualFuncFull;

alias extern(C) void function(GError* error) GErrorClearFunc;

alias extern(C) void function(const(GError)* srcError, GError* destError) GErrorCopyFunc;

alias extern(C) void function(GError* error) GErrorInitFunc;

alias extern(C) void function(void* data) GFreeFunc;

alias extern(C) void function(void* data, void* userData) GFunc;

alias extern(C) void function(void* key, void* value, void* userData) GHFunc;

alias extern(C) gboolean function(void* key, void* value, void* userData) GHRFunc;

alias extern(C) uint function(const(void)* key) GHashFunc;

alias extern(C) gboolean function(void* data) GHookCheckFunc;

alias extern(C) gboolean function(GHook* hook, void* marshalData) GHookCheckMarshaller;

alias extern(C) int function(GHook* newHook, GHook* sibling) GHookCompareFunc;

alias extern(C) void function(GHookList* hookList, GHook* hook) GHookFinalizeFunc;

alias extern(C) gboolean function(GHook* hook, void* data) GHookFindFunc;

alias extern(C) void function(void* data) GHookFunc;

alias extern(C) void function(GHook* hook, void* marshalData) GHookMarshaller;

alias extern(C) gboolean function(GIOChannel* source, GIOCondition condition, void* data) GIOFunc;

alias extern(C) void function(const(char)* logDomain, GLogLevelFlags logLevel, const(char)* message, void* userData) GLogFunc;

alias extern(C) GLogWriterOutput function(GLogLevelFlags logLevel, const(GLogField)* fields, size_t nFields, void* userData) GLogWriterFunc;

alias extern(C) void function(GNode* node, void* data) GNodeForeachFunc;

alias extern(C) gboolean function(GNode* node, void* data) GNodeTraverseFunc;

alias extern(C) gboolean function(const(char)* optionName, const(char)* value, void* data, GError** _err) GOptionArgFunc;

alias extern(C) void function(GOptionContext* context, GOptionGroup* group, void* data, GError** _err) GOptionErrorFunc;

alias extern(C) gboolean function(GOptionContext* context, GOptionGroup* group, void* data, GError** _err) GOptionParseFunc;

alias extern(C) int function(GPollFD* ufds, uint nfsd, int timeout) GPollFunc;

alias extern(C) void function(const(char)* string_) GPrintFunc;

alias extern(C) gboolean function(const(GMatchInfo)* matchInfo, GString* result, void* userData) GRegexEvalCallback;

alias extern(C) void function(GScanner* scanner, char* message, gboolean error) GScannerMsgFunc;

alias extern(C) int function(GSequenceIter* a, GSequenceIter* b, void* data) GSequenceIterCompareFunc;

alias extern(C) void function(GSource* source) GSourceDisposeFunc;

alias extern(C) void function() GSourceDummyMarshal;

alias extern(C) gboolean function(void* userData) GSourceFunc;

alias extern(C) void function(void* userData) GSourceOnceFunc;

alias extern(C) void function(void* data) GSpawnChildSetupFunc;

alias extern(C) void function(const(void)* userData) GTestDataFunc;

alias extern(C) void function(void* fixture, const(void)* userData) GTestFixtureFunc;

alias extern(C) void function() GTestFunc;

alias extern(C) gboolean function(const(char)* logDomain, GLogLevelFlags logLevel, const(char)* message, void* userData) GTestLogFatalFunc;

alias extern(C) void* function(void* data) GThreadFunc;

alias extern(C) const(char)* function(const(char)* str, void* data) GTranslateFunc;

alias extern(C) gboolean function(void* key, void* value, void* data) GTraverseFunc;

alias extern(C) gboolean function(GTreeNode* node, void* data) GTraverseNodeFunc;

alias extern(C) gboolean function(int fd, GIOCondition condition, void* userData) GUnixFDSourceFunc;

alias extern(C) void function() GVoidFunc;

