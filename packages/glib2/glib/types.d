/// D types for glib2 library
module glib.types;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.error;
import glib.hook;
import glib.hook_list;
import glib.iochannel;
import glib.match_info;
import glib.node;
import glib.option_context;
import glib.option_group;
import glib.scanner;
import glib.sequence_iter;
import glib.source;
import glib.string_;
import glib.tree_node;


// Aliases

/** */
alias DateDay = GDateDay;

/** */
alias DateYear = GDateYear;

/** */
alias MainContextPusher = GMainContextPusher;

/** */
alias MutexLocker = GMutexLocker;

/** */
alias Pid = GPid;

/** */
alias Quark = GQuark;

/** */
alias RWLockReaderLocker = GRWLockReaderLocker;

/** */
alias RWLockWriterLocker = GRWLockWriterLocker;

/** */
alias RecMutexLocker = GRecMutexLocker;

/** */
alias RefString = GRefString;

/** */
alias Strv = GStrv;

/** */
alias Time = GTime;

/** */
alias TimeSpan = GTimeSpan;

/** */
alias IConv = GIConv;

// Enums

/** */
alias AsciiType = GAsciiType;

/** */
alias BookmarkFileError = GBookmarkFileError;

/** */
alias ChecksumType = GChecksumType;

/** */
alias ConvertError = GConvertError;

/** */
alias DateDMY = GDateDMY;

/** */
alias DateMonth = GDateMonth;

/** */
alias DateWeekday = GDateWeekday;

/** */
alias ErrorType = GErrorType;

/** */
alias FileError = GFileError;

/** */
alias FileSetContentsFlags = GFileSetContentsFlags;

/** */
alias FileTest = GFileTest;

/** */
alias FormatSizeFlags = GFormatSizeFlags;

/** */
alias HookFlagMask = GHookFlagMask;

/** */
alias IOChannelError = GIOChannelError;

/** */
alias IOCondition = GIOCondition;

/** */
alias IOError = GIOError;

/** */
alias IOFlags = GIOFlags;

/** */
alias IOStatus = GIOStatus;

/** */
alias KeyFileError = GKeyFileError;

/** */
alias KeyFileFlags = GKeyFileFlags;

/** */
alias LogLevelFlags = GLogLevelFlags;

/** */
alias LogWriterOutput = GLogWriterOutput;

/** */
alias MainContextFlags = GMainContextFlags;

/** */
alias MarkupCollectType = GMarkupCollectType;

/** */
alias MarkupError = GMarkupError;

/** */
alias MarkupParseFlags = GMarkupParseFlags;

/** */
alias NormalizeMode = GNormalizeMode;

/** */
alias NumberParserError = GNumberParserError;

/** */
alias OnceStatus = GOnceStatus;

/** */
alias OptionArg = GOptionArg;

/** */
alias OptionError = GOptionError;

/** */
alias OptionFlags = GOptionFlags;

/** */
alias RegexCompileFlags = GRegexCompileFlags;

/** */
alias RegexError = GRegexError;

/** */
alias RegexMatchFlags = GRegexMatchFlags;

/** */
alias SeekType = GSeekType;

/** */
alias ShellError = GShellError;

/** */
alias SliceConfig = GSliceConfig;

/** */
alias SpawnError = GSpawnError;

/** */
alias SpawnFlags = GSpawnFlags;

/** */
alias TestFileType = GTestFileType;

/** */
alias TestLogType = GTestLogType;

/** */
alias TestResult = GTestResult;

/** */
alias TestSubprocessFlags = GTestSubprocessFlags;

/** */
alias TestTrapFlags = GTestTrapFlags;

/** */
alias ThreadError = GThreadError;

/** */
alias ThreadPriority = GThreadPriority;

/** */
alias TimeType = GTimeType;

/** */
alias TokenType = GTokenType;

/** */
alias TraverseFlags = GTraverseFlags;

/** */
alias TraverseType = GTraverseType;

/** */
alias UnicodeBreakType = GUnicodeBreakType;

/** */
alias UnicodeScript = GUnicodeScript;

/** */
alias UnicodeType = GUnicodeType;

/** */
alias UnixPipeEnd = GUnixPipeEnd;

/** */
alias UriError = GUriError;

/** */
alias UriFlags = GUriFlags;

/** */
alias UriHideFlags = GUriHideFlags;

/** */
alias UriParamsFlags = GUriParamsFlags;

/** */
alias UserDirectory = GUserDirectory;

/** */
alias VariantClass = GVariantClass;

/** */
alias VariantParseError = GVariantParseError;

// Structs

/** */
alias Allocator = GAllocator*;

/** */
alias Data = GData*;

/** */
alias IOFuncs = GIOFuncs;

/** */
alias MarkupParser = GMarkupParser;

/** */
alias MemVTable = GMemVTable;

/** */
alias OptionEntry = GOptionEntry;

/** */
alias PollFD = GPollFD;

/** */
alias SourceCallbackFuncs = GSourceCallbackFuncs;

/** */
alias SourceFuncs = GSourceFuncs;

/** */
alias StatBuf = GStatBuf*;

/** */
alias TestCase = GTestCase*;

/** */
alias TestConfig = GTestConfig;

/** */
alias ThreadFunctions = GThreadFunctions;

/** */
alias UnixPipe = GUnixPipe;

// Callbacks

/**
    Specifies the type of the value_destroy_func and key_destroy_func
    functions passed to [glib.cache.Cache.new_]. The functions are passed a
    pointer to the #GCache key or #GCache value and should free any
    memory and other resources associated with it.

    Params:
      value = the #GCache value to destroy

    Deprecated: Use a #GHashTable instead
*/
alias CacheDestroyFunc = void delegate(void* value);

/**
    Specifies the type of the key_dup_func function passed to
    [glib.cache.Cache.new_]. The function is passed a key
    (__not__ a value as the prototype implies) and
    should return a duplicate of the key.

    Params:
      value = the #GCache key to destroy (__not__ a
                #GCache value as it seems)
    Returns: a copy of the #GCache key

    Deprecated: Use a #GHashTable instead
*/
alias CacheDupFunc = void* delegate(void* value);

/**
    Specifies the type of the value_new_func function passed to
    [glib.cache.Cache.new_]. It is passed a #GCache key and should create the
    value corresponding to the key.

    Params:
      key = a #GCache key
    Returns: a new #GCache value corresponding to the key.

    Deprecated: Use a #GHashTable instead
*/
alias CacheNewFunc = void* delegate(void* key);

/**
    Prototype of a #GChildWatchSource callback, called when a child
    process has exited.
    
    To interpret wait_status, see the documentation
    for [glib.global.spawnCheckWaitStatus]. In particular,
    on Unix platforms, note that it is usually not equal
    to the integer passed to `exit()` or returned from `main()`.

    Params:
      pid = the process id of the child process
      waitStatus = Status information about the child process, encoded
                      in a platform-specific manner
*/
alias ChildWatchFunc = void delegate(glib.types.Pid pid, int waitStatus);

/**
    Specifies the type of function passed to [glib.global.clearHandleId].
    The implementation is expected to free the resource identified
    by handle_id; for instance, if handle_id is a #GSource ID,
    [glib.source.Source.remove] can be used.

    Params:
      handleId = the handle ID to clear
*/
alias ClearHandleFunc = void delegate(uint handleId);

/**
    Specifies the type of a comparison function used to compare two
    values.  The function should return a negative integer if the first
    value comes before the second, 0 if they are equal, or a positive
    integer if the first value comes after the second.

    Params:
      a = a value
      b = a value to compare with
    Returns: negative value if `a` < `b`; zero if `a` = `b`; positive
               value if `a` > `b`
*/
alias CompareDataFunc = int delegate(const(void)* a, const(void)* b);

/**
    Specifies the type of a comparison function used to compare two
    values.  The function should return a negative integer if the first
    value comes before the second, 0 if they are equal, or a positive
    integer if the first value comes after the second.

    Params:
      a = a value
      b = a value to compare with
    Returns: negative value if `a` < `b`; zero if `a` = `b`; positive
               value if `a` > `b`
*/
alias CompareFunc = int delegate(const(void)* a, const(void)* b);

/**
    Specifies the type of the function passed to [glib.completion.Completion.new_]. It
    should return the string corresponding to the given target item.
    This is used when you use data structures as #GCompletion items.

    Params:
      item = the completion item.
    Returns: the string corresponding to the item.

    Deprecated: Rarely used API
*/
alias CompletionFunc = string delegate(void* item);

/**
    Specifies the type of the function passed to
    [glib.completion.Completion.setCompare]. This is used when you use strings as
    #GCompletion items.

    Params:
      s1 = string to compare with s2.
      s2 = string to compare with s1.
      n = maximal number of bytes to compare.
    Returns: an integer less than, equal to, or greater than zero if
               the first `n` bytes of s1 is found, respectively, to be
               less than, to match, or to be greater than the first `n`
               bytes of s2.

    Deprecated: Rarely used API
*/
alias CompletionStrncmpFunc = int delegate(string s1, string s2, size_t n);

/**
    A function of this signature is used to copy the node data
    when doing a deep-copy of a tree.

    Params:
      src = A pointer to the data which should be copied
    Returns: A pointer to the copy
*/
alias CopyFunc = void* delegate(const(void)* src);

/**
    Specifies the type of function passed to [glib.global.datasetForeach]. It is
    called with each #GQuark id and associated data element, together
    with the user_data parameter supplied to [glib.global.datasetForeach].

    Params:
      keyId = the #GQuark id to identifying the data element.
      data = the data element.
*/
alias DataForeachFunc = void delegate(glib.types.Quark keyId, void* data);

/**
    Specifies the type of function which is called when a data element
    is destroyed. It is passed the pointer to the data element and
    should free any memory and resources allocated for it.
*/
alias DestroyNotify = void delegate();

/**
    The type of functions that are used to 'duplicate' an object.
    What this means depends on the context, it could just be
    incrementing the reference count, if data is a ref-counted
    object.

    Params:
      data = the data to duplicate
    Returns: a duplicate of data
*/
alias DuplicateFunc = void* delegate(void* data);

/**
    Specifies the type of a function used to test two values for
    equality. The function should return true if both values are equal
    and false otherwise.

    Params:
      a = a value
      b = a value to compare with
    Returns: true if `a` = `b`; false otherwise
*/
alias EqualFunc = bool delegate(const(void)* a, const(void)* b);

/**
    Specifies the type of a function used to test two values for
    equality. The function should return true if both values are equal
    and false otherwise.
    
    This is a version of #GEqualFunc which provides a user_data closure from
    the caller.

    Params:
      a = a value
      b = a value to compare with
    Returns: true if `a` = `b`; false otherwise
*/
alias EqualFuncFull = bool delegate(const(void)* a, const(void)* b);

/**
    Specifies the type of function which is called when an extended
    error instance is freed. It is passed the error pointer about to be
    freed, and should free the error's private data fields.
    
    Normally, it is better to use G_DEFINE_EXTENDED_ERROR(), as it
    already takes care of getting the private data from error.

    Params:
      error = extended error to clear
*/
alias ErrorClearFunc = void delegate(glib.error.ErrorWrap error);

/**
    Specifies the type of function which is called when an extended
    error instance is copied. It is passed the pointer to the
    destination error and source error, and should copy only the fields
    of the private data from src_error to dest_error.
    
    Normally, it is better to use G_DEFINE_EXTENDED_ERROR(), as it
    already takes care of getting the private data from src_error and
    dest_error.

    Params:
      srcError = source extended error
      destError = destination extended error
*/
alias ErrorCopyFunc = void delegate(glib.error.ErrorWrap srcError, glib.error.ErrorWrap destError);

/**
    Specifies the type of function which is called just after an
    extended error instance is created and its fields filled. It should
    only initialize the fields in the private data, which can be
    received with the generated `*_get_private()` function.
    
    Normally, it is better to use G_DEFINE_EXTENDED_ERROR(), as it
    already takes care of getting the private data from error.

    Params:
      error = extended error
*/
alias ErrorInitFunc = void delegate(glib.error.ErrorWrap error);

/**
    Declares a type of function which takes an arbitrary
    data pointer argument and has no return value. It is
    not currently used in GLib or GTK.
*/
alias FreeFunc = void delegate();

/**
    Specifies the type of functions passed to [glib.list.List.foreach_] and
    [glib.slist.SList.foreach_].

    Params:
      data = the element's data
*/
alias Func = void delegate(void* data);

/**
    Specifies the type of the function passed to [glib.hash_table.HashTable.foreach_].
    It is called with each key/value pair, together with the user_data
    parameter which is passed to [glib.hash_table.HashTable.foreach_].

    Params:
      key = a key
      value = the value corresponding to the key
*/
alias HFunc = void delegate(void* key, void* value);

/**
    Specifies the type of the function passed to
    [glib.hash_table.HashTable.foreachRemove]. It is called with each key/value
    pair, together with the user_data parameter passed to
    [glib.hash_table.HashTable.foreachRemove]. It should return true if the
    key/value pair should be removed from the #GHashTable.

    Params:
      key = a key
      value = the value associated with the key
    Returns: true if the key/value pair should be removed from the
          #GHashTable
*/
alias HRFunc = bool delegate(void* key, void* value);

/**
    Specifies the type of the hash function which is passed to
    [glib.hash_table.HashTable.new_] when a #GHashTable is created.
    
    The function is passed a key and should return a #guint hash value.
    The functions [glib.global.directHash], [glib.global.intHash] and [glib.global.strHash] provide
    hash functions which can be used when the key is a #gpointer, #gint*,
    and #gchar* respectively.
    
    [glib.global.directHash] is also the appropriate hash function for keys
    of the form `GINT_TO_POINTER (n)` (or similar macros).
    
    A good hash functions should produce
    hash values that are evenly distributed over a fairly large range.
    The modulus is taken with the hash table size (a prime number) to
    find the 'bucket' to place each key into. The function should also
    be very fast, since it is called for each key lookup.
    
    Note that the hash functions provided by GLib have these qualities,
    but are not particularly robust against manufactured keys that
    cause hash collisions. Therefore, you should consider choosing
    a more secure hash function when using a GHashTable with keys
    that originate in untrusted data (such as HTTP requests).
    Using [glib.global.strHash] in that situation might make your application
    vulnerable to
    [Algorithmic Complexity Attacks](https://lwn.net/Articles/474912/).
    
    The key to choosing a good hash is unpredictability.  Even
    cryptographic hashes are very easy to find collisions for when the
    remainder is taken modulo a somewhat predictable prime number.  There
    must be an element of randomness that an attacker is unable to guess.

    Params:
      key = a key
    Returns: the hash value corresponding to the key
*/
alias HashFunc = uint delegate(const(void)* key);

/**
    Defines the type of a hook function that can be invoked
    by [glib.hook_list.HookList.invokeCheck].
    Returns: false if the #GHook should be destroyed
*/
alias HookCheckFunc = bool delegate();

/**
    Defines the type of function used by [glib.hook_list.HookList.marshalCheck].

    Params:
      hook = a #GHook
    Returns: false if hook should be destroyed
*/
alias HookCheckMarshaller = bool delegate(glib.hook.Hook hook);

/**
    Defines the type of function used to compare #GHook elements in
    [glib.hook.Hook.insertSorted].

    Params:
      newHook = the #GHook being inserted
      sibling = the #GHook to compare with new_hook
    Returns: a value <= 0 if new_hook should be before sibling
*/
alias HookCompareFunc = int delegate(glib.hook.Hook newHook, glib.hook.Hook sibling);

/**
    Defines the type of function to be called when a hook in a
    list of hooks gets finalized.

    Params:
      hookList = a #GHookList
      hook = the hook in hook_list that gets finalized
*/
alias HookFinalizeFunc = void delegate(glib.hook_list.HookList hookList, glib.hook.Hook hook);

/**
    Defines the type of the function passed to [glib.hook.Hook.find].

    Params:
      hook = a #GHook
    Returns: true if the required #GHook has been found
*/
alias HookFindFunc = bool delegate(glib.hook.Hook hook);

/**
    Defines the type of a hook function that can be invoked
    by [glib.hook_list.HookList.invoke].
*/
alias HookFunc = void delegate();

/**
    Defines the type of function used by [glib.hook_list.HookList.marshal].

    Params:
      hook = a #GHook
*/
alias HookMarshaller = void delegate(glib.hook.Hook hook);

/**
    Specifies the type of function passed to [glib.global.ioAddWatch] or
    [glib.global.ioAddWatchFull], which is called when the requested condition
    on a #GIOChannel is satisfied.

    Params:
      source = the #GIOChannel event source
      condition = the condition which has been satisfied
    Returns: the function should return false if the event source
               should be removed
*/
alias IOFunc = bool delegate(glib.iochannel.IOChannel source, glib.types.IOCondition condition);

/**
    Specifies the prototype of log handler functions.
    
    The default log handler, `funcGLib.log_default_handler`, automatically appends a
    new-line character to message when printing it. It is advised that any
    custom log handler functions behave similarly, so that logging calls in user
    code do not need modifying to add a new-line character to the message if the
    log handler is changed.
    
    This is not used if structured logging is enabled; see
    [Using Structured Logging](logging.html#using-structured-logging).

    Params:
      logDomain = the log domain of the message
      logLevel = the log level of the message (including the
          fatal and recursion flags)
      message = the message to process
*/
alias LogFunc = void delegate(string logDomain, glib.types.LogLevelFlags logLevel, string message);

/**
    Specifies the type of function passed to [glib.node.Node.childrenForeach].
    The function is called with each child node, together with the user
    data passed to [glib.node.Node.childrenForeach].

    Params:
      node = a #GNode.
*/
alias NodeForeachFunc = void delegate(glib.node.Node node);

/**
    Specifies the type of function passed to [glib.node.Node.traverse]. The
    function is called with each of the nodes visited, together with the
    user data passed to [glib.node.Node.traverse]. If the function returns
    true, then the traversal is stopped.

    Params:
      node = a #GNode.
    Returns: true to stop the traversal.
*/
alias NodeTraverseFunc = bool delegate(glib.node.Node node);

/**
    The type of function to be passed as callback for `G_OPTION_ARG_CALLBACK`
    options.

    Params:
      optionName = The name of the option being parsed. This will be either a
         single dash followed by a single letter (for a short name) or two dashes
         followed by a long option name.
      value = The value to be parsed.
    Returns: true if the option was successfully parsed, false if an error
       occurred, in which case error should be set with [glib.global.setError]
    Throws: [ErrorWrap]
*/
alias OptionArgFunc = bool delegate(string optionName, string value, GError **_err);

/**
    The type of function to be used as callback when a parse error occurs.

    Params:
      context = The active #GOptionContext
      group = The group to which the function belongs
    Throws: [ErrorWrap]
*/
alias OptionErrorFunc = void delegate(glib.option_context.OptionContext context, glib.option_group.OptionGroup group, GError **_err);

/**
    The type of function that can be called before and after parsing.

    Params:
      context = The active #GOptionContext
      group = The group to which the function belongs
    Returns: true if the function completed successfully, false if an error
       occurred, in which case error should be set with [glib.global.setError]
    Throws: [ErrorWrap]
*/
alias OptionParseFunc = bool delegate(glib.option_context.OptionContext context, glib.option_group.OptionGroup group, GError **_err);

/**
    Specifies the type of function passed to [glib.main_context.MainContext.setPollFunc].
    The semantics of the function should match those of the poll() system call.

    Params:
      ufds = an array of #GPollFD elements
      nfsd = the number of elements in ufds
      timeout = the maximum time to wait for an event of the file descriptors.
            A negative value indicates an infinite timeout.
    Returns: the number of #GPollFD elements which have events or errors
          reported, or -1 if an error occurred.
*/
alias PollFunc = int delegate(glib.types.PollFD ufds, uint nfsd, int timeout);

/**
    Specifies the type of the print handler functions.
    These are called with the complete formatted string to output.

    Params:
      string_ = the message to output
*/
alias PrintFunc = void delegate(string string_);

/**
    Specifies the type of the function passed to [glib.regex.Regex.replaceEval].
    It is called for each occurrence of the pattern in the string passed
    to [glib.regex.Regex.replaceEval], and it should append the replacement to
    result.

    Params:
      matchInfo = the #GMatchInfo generated by the match.
            Use [glib.match_info.MatchInfo.getRegex] and [glib.match_info.MatchInfo.getString] if you
            need the #GRegex or the matched string.
      result = a #GString containing the new string
    Returns: false to continue the replacement process, true to stop it
*/
alias RegexEvalCallback = bool delegate(glib.match_info.MatchInfo matchInfo, glib.string_.String result);

/**
    Specifies the type of the message handler function.

    Params:
      scanner = a #GScanner
      message = the message
      error = true if the message signals an error,
            false if it signals a warning.
*/
alias ScannerMsgFunc = void delegate(glib.scanner.Scanner scanner, string message, bool error);

/**
    A #GSequenceIterCompareFunc is a function used to compare iterators.
    It must return zero if the iterators compare equal, a negative value
    if `a` comes before `b`, and a positive value if `b` comes before `a`.

    Params:
      a = a #GSequenceIter
      b = a #GSequenceIter
    Returns: zero if the iterators are equal, a negative value if `a`
          comes before `b`, and a positive value if `b` comes before `a`.
*/
alias SequenceIterCompareFunc = int delegate(glib.sequence_iter.SequenceIter a, glib.sequence_iter.SequenceIter b);

/**
    Dispose function for source. See [glib.source.Source.setDisposeFunction] for
    details.

    Params:
      source = #GSource that is currently being disposed
*/
alias SourceDisposeFunc = void delegate(glib.source.Source source);

/**
    This is just a placeholder for #GClosureMarshal,
    which cannot be used here for dependency reasons.
*/
alias SourceDummyMarshal = void delegate();

/**
    Specifies the type of function passed to [glib.global.timeoutAdd],
    [glib.global.timeoutAddFull], [glib.global.idleAdd], and [glib.global.idleAddFull].
    
    When calling [glib.source.Source.setCallback], you may need to cast a function of a
    different type to this type. Use G_SOURCE_FUNC() to avoid warnings about
    incompatible function types.
    Returns: false if the source should be removed. [glib.types.SOURCE_CONTINUE] and
      [glib.types.SOURCE_REMOVE] are more memorable names for the return value.
*/
alias SourceFunc = bool delegate();

/**
    A source function that is only called once before being removed from the main
    context automatically.
    
    See: [glib.global.idleAddOnce], [glib.global.timeoutAddOnce]
*/
alias SourceOnceFunc = void delegate();

/**
    Specifies the type of the setup function passed to [glib.global.spawnAsync],
    [glib.global.spawnSync] and [glib.global.spawnAsyncWithPipes], which can, in very
    limited ways, be used to affect the child's execution.
    
    On POSIX platforms, the function is called in the child after GLib
    has performed all the setup it plans to perform, but before calling
    exec(). Actions taken in this function will only affect the child,
    not the parent.
    
    On Windows, the function is called in the parent. Its usefulness on
    Windows is thus questionable. In many cases executing the child setup
    function in the parent can have ill effects, and you should be very
    careful when porting software to Windows that uses child setup
    functions.
    
    However, even on POSIX, you are extremely limited in what you can
    safely do from a #GSpawnChildSetupFunc, because any mutexes that were
    held by other threads in the parent process at the time of the fork()
    will still be locked in the child process, and they will never be
    unlocked (since the threads that held them don't exist in the child).
    POSIX allows only async-signal-safe functions (see signal(7)) to be
    called in the child between fork() and exec(), which drastically limits
    the usefulness of child setup functions.
    
    In particular, it is not safe to call any function which may
    call malloc(), which includes POSIX functions such as setenv().
    If you need to set up the child environment differently from
    the parent, you should use [glib.global.getEnviron], [glib.global.environSetenv],
    and [glib.global.environUnsetenv], and then pass the complete environment
    list to the `g_spawn...` function.
*/
alias SpawnChildSetupFunc = void delegate();

/**
    The type used for test case functions that take an extra pointer
    argument.
*/
alias TestDataFunc = void delegate();

/**
    The type used for functions that operate on test fixtures.  This is
    used for the fixture setup and teardown functions as well as for the
    testcases themselves.
    
    user_data is a pointer to the data that was given when registering
    the test case.
    
    fixture will be a pointer to the area of memory allocated by the
    test framework, of the size requested.  If the requested size was
    zero then fixture will be equal to user_data.

    Params:
      fixture = the test fixture
*/
alias TestFixtureFunc = void delegate(void* fixture);

/**
    The type used for test case functions.
*/
alias TestFunc = void delegate();

/**
    Specifies the prototype of fatal log handler functions.

    Params:
      logDomain = the log domain of the message
      logLevel = the log level of the message (including the fatal and recursion flags)
      message = the message to process
    Returns: true if the program should abort, false otherwise
*/
alias TestLogFatalFunc = bool delegate(string logDomain, glib.types.LogLevelFlags logLevel, string message);

/**
    Specifies the type of the func functions passed to [glib.thread.Thread.new_]
    or [glib.thread.Thread.tryNew].
    Returns: the return value of the thread
*/
alias ThreadFunc = void* delegate();

/**
    The type of functions which are used to translate user-visible
    strings, for <option>--help</option> output.

    Params:
      str = the untranslated string
    Returns: a translation of the string for the current locale.
       The returned string is owned by GLib and must not be freed.
*/
alias TranslateFunc = string delegate(string str);

/**
    Specifies the type of function passed to [glib.tree.Tree.traverse]. It is
    passed the key and value of each node, together with the user_data
    parameter passed to [glib.tree.Tree.traverse]. If the function returns
    true, the traversal is stopped.

    Params:
      key = a key of a #GTree node
      value = the value corresponding to the key
    Returns: true to stop the traversal
*/
alias TraverseFunc = bool delegate(void* key, void* value);

/**
    Specifies the type of function passed to [glib.tree.Tree.foreachNode]. It is
    passed each node, together with the user_data parameter passed to
    [glib.tree.Tree.foreachNode]. If the function returns true, the traversal is
    stopped.

    Params:
      node = a #GTreeNode
    Returns: true to stop the traversal
*/
alias TraverseNodeFunc = bool delegate(glib.tree_node.TreeNode node);

/**
    The type of functions to be called when a UNIX fd watch source
    triggers.

    Params:
      fd = the fd that triggered the event
      condition = the IO conditions reported on fd
    Returns: false if the source should be removed
*/
alias UnixFDSourceFunc = bool delegate(int fd, glib.types.IOCondition condition);

/**
    Declares a type of function which takes no arguments
    and has no return value. It is used to specify the type
    function passed to [glib.global.atexit].
*/
alias VoidFunc = void delegate();

/** */
enum ALLOCATOR_LIST = 1;

/** */
enum ALLOCATOR_NODE = 3;

/** */
enum ALLOCATOR_SLIST = 2;

/** */
enum ALLOC_AND_FREE = 2;

/** */
enum ALLOC_ONLY = 1;

/** */
enum ANALYZER_ANALYZING = 1;

/**
    A good size for a buffer to be passed into `func@GLib.ascii_dtostr`.
    It is guaranteed to be enough for all output of that function
    on systems with 64bit IEEE-compatible doubles.
    
    The typical usage would be something like:
    ```C
    char buf[G_ASCII_DTOSTR_BUF_SIZE];
    
    fprintf (out, "value=%s\n", g_ascii_dtostr (buf, sizeof (buf), value));
    ```
*/
enum ASCII_DTOSTR_BUF_SIZE = 39;

/**
    Evaluates to the initial reference count for `gatomicrefcount`.
    
    This macro is useful for initializing `gatomicrefcount` fields inside
    structures, for instance:
    
    ```c
    typedef struct {
      gatomicrefcount ref_count;
      char *name;
      char *address;
    } Person;
    
    static const Person default_person = {
      .ref_count = G_ATOMIC_REF_COUNT_INIT,
      .name = "Default name",
      .address = "Default address",
    };
    ```
*/
enum ATOMIC_REF_COUNT_INIT = 1;

/** */
enum BIG_ENDIAN = 4321;

/**
    The set of uppercase ASCII alphabet characters.
    Used for specifying valid identifier characters
    in #GScannerConfig.
*/
enum CSET_A_2_Z = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

/**
    The set of ASCII digits.
    Used for specifying valid identifier characters
    in #GScannerConfig.
*/
enum CSET_DIGITS = "0123456789";

/**
    The set of lowercase ASCII alphabet characters.
    Used for specifying valid identifier characters
    in #GScannerConfig.
*/
enum CSET_a_2_z = "abcdefghijklmnopqrstuvwxyz";

/** */
enum C_STD_VERSION = 199000;

/**
    A bitmask that restricts the possible flags passed to
    [glib.global.datalistSetFlags]. Passing a flags value where
    flags & ~G_DATALIST_FLAGS_MASK != 0 is an error.
*/
enum DATALIST_FLAGS_MASK = 3;

/**
    Represents an invalid #GDateDay.
*/
enum DATE_BAD_DAY = 0;

/**
    Represents an invalid Julian day number.
*/
enum DATE_BAD_JULIAN = 0;

/**
    Represents an invalid year.
*/
enum DATE_BAD_YEAR = 0;

/** */
enum DIR_SEPARATOR = 47;

/** */
enum DIR_SEPARATOR_S = "/";

/** */
enum E = 2.718282;

/** */
enum GINT16_FORMAT = "hi";

/** */
enum GINT16_MODIFIER = "h";

/** */
enum GINT32_FORMAT = "i";

/** */
enum GINT32_MODIFIER = "";

/** */
enum GINT64_FORMAT = "li";

/** */
enum GINT64_MODIFIER = "l";

/** */
enum GINTPTR_FORMAT = "li";

/** */
enum GINTPTR_MODIFIER = "l";

/**
    Expands to "" on all modern compilers, and to  __FUNCTION__ on gcc
    version 2.x. Don't use it.

    Deprecated: Use G_STRFUNC() instead
*/
enum GNUC_FUNCTION = "";

/**
    Expands to "" on all modern compilers, and to __PRETTY_FUNCTION__
    on gcc version 2.x. Don't use it.

    Deprecated: Use G_STRFUNC() instead
*/
enum GNUC_PRETTY_FUNCTION = "";

/** */
enum GSIZE_FORMAT = "lu";

/** */
enum GSIZE_MODIFIER = "l";

/** */
enum GSSIZE_FORMAT = "li";

/** */
enum GSSIZE_MODIFIER = "l";

/** */
enum GUINT16_FORMAT = "hu";

/** */
enum GUINT32_FORMAT = "u";

/** */
enum GUINT64_FORMAT = "lu";

/** */
enum GUINTPTR_FORMAT = "lu";

/** */
enum HAVE_GINT64 = 1;

/** */
enum HAVE_GNUC_VARARGS = 1;

/** */
enum HAVE_GNUC_VISIBILITY = 1;

/** */
enum HAVE_GROWING_STACK = 0;

/** */
enum HAVE_ISO_VARARGS = 1;

/**
    The position of the first bit which is not reserved for internal
    use be the #GHook implementation, i.e.
    `1 << G_HOOK_FLAG_USER_SHIFT` is the first
    bit which can be used for application-defined flags.
*/
enum HOOK_FLAG_USER_SHIFT = 4;

/** */
enum IEEE754_DOUBLE_BIAS = 1023;

/** */
enum IEEE754_FLOAT_BIAS = 127;

/**
    The name of the main group of a desktop entry file, as defined in the
    [Desktop Entry Specification](http://freedesktop.org/Standards/desktop-entry-spec).
    Consult the specification for more
    details about the meanings of the keys below.
*/
enum KEY_FILE_DESKTOP_GROUP = "Desktop Entry";

/**
    A key under [glib.types.KEY_FILE_DESKTOP_GROUP], whose value is a string list
    giving the available application actions.
*/
enum KEY_FILE_DESKTOP_KEY_ACTIONS = "Actions";

/**
    A key under [glib.types.KEY_FILE_DESKTOP_GROUP], whose value is a list
    of strings giving the categories in which the desktop entry
    should be shown in a menu.
*/
enum KEY_FILE_DESKTOP_KEY_CATEGORIES = "Categories";

/**
    A key under [glib.types.KEY_FILE_DESKTOP_GROUP], whose value is a localized
    string giving the tooltip for the desktop entry.
*/
enum KEY_FILE_DESKTOP_KEY_COMMENT = "Comment";

/**
    A key under [glib.types.KEY_FILE_DESKTOP_GROUP], whose value is a boolean
    set to true if the application is D-Bus activatable.
*/
enum KEY_FILE_DESKTOP_KEY_DBUS_ACTIVATABLE = "DBusActivatable";

/**
    A key under [glib.types.KEY_FILE_DESKTOP_GROUP], whose value is a string
    giving the command line to execute. It is only valid for desktop
    entries with the `Application` type.
*/
enum KEY_FILE_DESKTOP_KEY_EXEC = "Exec";

/**
    A key under [glib.types.KEY_FILE_DESKTOP_GROUP], whose value is a localized
    string giving the generic name of the desktop entry.
*/
enum KEY_FILE_DESKTOP_KEY_GENERIC_NAME = "GenericName";

/**
    A key under [glib.types.KEY_FILE_DESKTOP_GROUP], whose value is a boolean
    stating whether the desktop entry has been deleted by the user.
*/
enum KEY_FILE_DESKTOP_KEY_HIDDEN = "Hidden";

/**
    A key under [glib.types.KEY_FILE_DESKTOP_GROUP], whose value is a localized
    string giving the name of the icon to be displayed for the desktop
    entry.
*/
enum KEY_FILE_DESKTOP_KEY_ICON = "Icon";

/**
    A key under [glib.types.KEY_FILE_DESKTOP_GROUP], whose value is a list
    of strings giving the MIME types supported by this desktop entry.
*/
enum KEY_FILE_DESKTOP_KEY_MIME_TYPE = "MimeType";

/**
    A key under [glib.types.KEY_FILE_DESKTOP_GROUP], whose value is a localized
    string giving the specific name of the desktop entry.
*/
enum KEY_FILE_DESKTOP_KEY_NAME = "Name";

/**
    A key under [glib.types.KEY_FILE_DESKTOP_GROUP], whose value is a list of
    strings identifying the environments that should not display the
    desktop entry.
*/
enum KEY_FILE_DESKTOP_KEY_NOT_SHOW_IN = "NotShowIn";

/**
    A key under [glib.types.KEY_FILE_DESKTOP_GROUP], whose value is a boolean
    stating whether the desktop entry should be shown in menus.
*/
enum KEY_FILE_DESKTOP_KEY_NO_DISPLAY = "NoDisplay";

/**
    A key under [glib.types.KEY_FILE_DESKTOP_GROUP], whose value is a list of
    strings identifying the environments that should display the
    desktop entry.
*/
enum KEY_FILE_DESKTOP_KEY_ONLY_SHOW_IN = "OnlyShowIn";

/**
    A key under [glib.types.KEY_FILE_DESKTOP_GROUP], whose value is a string
    containing the working directory to run the program in. It is only
    valid for desktop entries with the `Application` type.
*/
enum KEY_FILE_DESKTOP_KEY_PATH = "Path";

/**
    A key under [glib.types.KEY_FILE_DESKTOP_GROUP], whose value is a boolean
    stating whether the application supports the
    [Startup Notification Protocol Specification](http://www.freedesktop.org/Standards/startup-notification-spec).
*/
enum KEY_FILE_DESKTOP_KEY_STARTUP_NOTIFY = "StartupNotify";

/**
    A key under [glib.types.KEY_FILE_DESKTOP_GROUP], whose value is string
    identifying the WM class or name hint of a window that the application
    will create, which can be used to emulate Startup Notification with
    older applications.
*/
enum KEY_FILE_DESKTOP_KEY_STARTUP_WM_CLASS = "StartupWMClass";

/**
    A key under [glib.types.KEY_FILE_DESKTOP_GROUP], whose value is a boolean
    stating whether the program should be run in a terminal window.
    
    It is only valid for desktop entries with the `Application` type.
*/
enum KEY_FILE_DESKTOP_KEY_TERMINAL = "Terminal";

/**
    A key under [glib.types.KEY_FILE_DESKTOP_GROUP], whose value is a string
    giving the file name of a binary on disk used to determine if the
    program is actually installed. It is only valid for desktop entries
    with the `Application` type.
*/
enum KEY_FILE_DESKTOP_KEY_TRY_EXEC = "TryExec";

/**
    A key under [glib.types.KEY_FILE_DESKTOP_GROUP], whose value is a string
    giving the type of the desktop entry.
    
    Usually [glib.types.KEY_FILE_DESKTOP_TYPE_APPLICATION],
    [glib.types.KEY_FILE_DESKTOP_TYPE_LINK], or
    [glib.types.KEY_FILE_DESKTOP_TYPE_DIRECTORY].
*/
enum KEY_FILE_DESKTOP_KEY_TYPE = "Type";

/**
    A key under [glib.types.KEY_FILE_DESKTOP_GROUP], whose value is a string
    giving the URL to access. It is only valid for desktop entries
    with the `Link` type.
*/
enum KEY_FILE_DESKTOP_KEY_URL = "URL";

/**
    A key under [glib.types.KEY_FILE_DESKTOP_GROUP], whose value is a string
    giving the version of the Desktop Entry Specification used for
    the desktop entry file.
*/
enum KEY_FILE_DESKTOP_KEY_VERSION = "Version";

/**
    The value of the [glib.types.KEY_FILE_DESKTOP_KEY_TYPE], key for desktop
    entries representing applications.
*/
enum KEY_FILE_DESKTOP_TYPE_APPLICATION = "Application";

/**
    The value of the [glib.types.KEY_FILE_DESKTOP_KEY_TYPE], key for desktop
    entries representing directories.
*/
enum KEY_FILE_DESKTOP_TYPE_DIRECTORY = "Directory";

/**
    The value of the [glib.types.KEY_FILE_DESKTOP_KEY_TYPE], key for desktop
    entries representing links to documents.
*/
enum KEY_FILE_DESKTOP_TYPE_LINK = "Link";

/** */
enum LITTLE_ENDIAN = 1234;

/** */
enum LN10 = 2.302585;

/** */
enum LN2 = 0.693147;

/** */
enum LOG_2_BASE_10 = 0.301030;

/**
    Defines the log domain. See [Log Domains](#log-domains).
    
    Libraries should define this so that any messages
    which they log can be differentiated from messages from other
    libraries and application code. But be careful not to define
    it in any public header files.
    
    Log domains must be unique, and it is recommended that they are the
    application or library name, optionally followed by a hyphen and a sub-domain
    name. For example, `bloatpad` or `bloatpad-io`.
    
    If undefined, it defaults to the default null (or `""`) log domain; this is
    not advisable, as it cannot be filtered against using the `G_MESSAGES_DEBUG`
    environment variable.
    
    For example, GTK uses this in its `Makefile.am`:
    ```
    AM_CPPFLAGS = -DG_LOG_DOMAIN=\"Gtk\"
    ```
    
    Applications can choose to leave it as the default null (or `""`)
    domain. However, defining the domain offers the same advantages as
    above.
*/
enum LOG_DOMAIN = 0;

/**
    GLib log levels that are considered fatal by default.
    
    This is not used if structured logging is enabled; see
    [Using Structured Logging](logging.html#using-structured-logging).
*/
enum LOG_FATAL_MASK = 5;

/**
    Log levels below `1<<G_LOG_LEVEL_USER_SHIFT` are used by GLib.
    Higher bits can be used for user-defined log levels.
*/
enum LOG_LEVEL_USER_SHIFT = 8;

/**
    The major version number of the GLib library.
    
    Like #glib_major_version, but from the headers used at
    application compile time, rather than from the library
    linked against at application run time.
*/
enum MAJOR_VERSION = 2;

/** */
enum MAXINT16 = 32767;

/** */
enum MAXINT32 = 2147483647;

/** */
enum MAXINT64 = 9223372036854775807;

/** */
enum MAXINT8 = 127;

/** */
enum MAXUINT16 = 65535;

/** */
enum MAXUINT32 = 4294967295;

/** */
enum MAXUINT64 = 18446744073709551615;

/** */
enum MAXUINT8 = 255;

/**
    The micro version number of the GLib library.
    
    Like #gtk_micro_version, but from the headers used at
    application compile time, rather than from the library
    linked against at application run time.
*/
enum MICRO_VERSION = 0;

/**
    The minimum value which can be held in a #gint16.
*/
enum MININT16 = -32768;

/**
    The minimum value which can be held in a #gint32.
*/
enum MININT32 = -2147483648;

/**
    The minimum value which can be held in a #gint64.
*/
enum MININT64 = -9223372036854775808;

/**
    The minimum value which can be held in a #gint8.
*/
enum MININT8 = -128;

/**
    The minor version number of the GLib library.
    
    Like #gtk_minor_version, but from the headers used at
    application compile time, rather than from the library
    linked against at application run time.
*/
enum MINOR_VERSION = 80;

/** */
enum MODULE_SUFFIX = "so";

/**
    If a long option in the main group has this name, it is not treated as a
    regular option. Instead it collects all non-option arguments which would
    otherwise be left in `argv`. The option must be of type
    `G_OPTION_ARG_CALLBACK`, `G_OPTION_ARG_STRING_ARRAY`
    or `G_OPTION_ARG_FILENAME_ARRAY`.
    
    
    Using [glib.types.OPTION_REMAINING] instead of simply scanning `argv`
    for leftover arguments has the advantage that GOption takes care of
    necessary encoding conversions for strings or filenames.
*/
enum OPTION_REMAINING = "";

/** */
enum PDP_ENDIAN = 3412;

/** */
enum PI = 3.141593;

/**
    A format specifier that can be used in printf()-style format strings
    when printing a #GPid.
*/
enum PID_FORMAT = "i";

/** */
enum PI_2 = 1.570796;

/** */
enum PI_4 = 0.785398;

/**
    A format specifier that can be used in printf()-style format strings
    when printing the @fd member of a #GPollFD.
*/
enum POLLFD_FORMAT = "%d";

/**
    Use this for default priority event sources.
    
    In GLib this priority is used when adding timeout functions
    with [glib.global.timeoutAdd]. In GDK this priority is used for events
    from the X server.
*/
enum PRIORITY_DEFAULT = 0;

/**
    Use this for default priority idle functions.
    
    In GLib this priority is used when adding idle functions with
    [glib.global.idleAdd].
*/
enum PRIORITY_DEFAULT_IDLE = 200;

/**
    Use this for high priority event sources.
    
    It is not used within GLib or GTK.
*/
enum PRIORITY_HIGH = -100;

/**
    Use this for high priority idle functions.
    
    GTK uses [glib.types.PRIORITY_HIGH_IDLE] + 10 for resizing operations,
    and [glib.types.PRIORITY_HIGH_IDLE] + 20 for redrawing operations. (This is
    done to ensure that any pending resizes are processed before any
    pending redraws, so that widgets are not redrawn twice unnecessarily.)
*/
enum PRIORITY_HIGH_IDLE = 100;

/**
    Use this for very low priority background tasks.
    
    It is not used within GLib or GTK.
*/
enum PRIORITY_LOW = 300;

/**
    Evaluates to the initial reference count for `grefcount`.
    
    This macro is useful for initializing `grefcount` fields inside
    structures, for instance:
    
    ```c
    typedef struct {
      grefcount ref_count;
      char *name;
      char *address;
    } Person;
    
    static const Person default_person = {
      .ref_count = G_REF_COUNT_INIT,
      .name = "Default name",
      .address = "Default address",
    };
    ```
*/
enum REF_COUNT_INIT = -1;

/** */
enum SEARCHPATH_SEPARATOR = 58;

/** */
enum SEARCHPATH_SEPARATOR_S = ":";

/** */
enum SIZEOF_LONG = 8;

/** */
enum SIZEOF_SIZE_T = 8;

/** */
enum SIZEOF_SSIZE_T = 8;

/** */
enum SIZEOF_VOID_P = 8;

/**
    Use this macro as the return value of a #GSourceFunc to leave
    the #GSource in the main loop.
*/
enum SOURCE_CONTINUE = true;

/**
    Use this macro as the return value of a #GSourceFunc to remove
    the #GSource from the main loop.
*/
enum SOURCE_REMOVE = false;

/** */
enum SQRT2 = 1.414214;

/**
    The standard delimiters, used in `func@GLib.strdelimit`.
*/
enum STR_DELIMITERS = "_-|> <.";

/** */
enum SYSDEF_AF_INET = 2;

/** */
enum SYSDEF_AF_INET6 = 10;

/** */
enum SYSDEF_AF_UNIX = 1;

/** */
enum SYSDEF_MSG_DONTROUTE = 4;

/** */
enum SYSDEF_MSG_OOB = 1;

/** */
enum SYSDEF_MSG_PEEK = 2;

/**
    Creates a unique temporary directory for each unit test and uses
    g_set_user_dirs() to set XDG directories to point into subdirectories of it
    for the duration of the unit test. The directory tree is cleaned up after the
    test finishes successfully. Note that this doesn’t take effect until
    [glib.global.testRun] is called, so calls to (for example) g_get_user_home_dir() will
    return the system-wide value when made in a test program’s main() function.
    
    The following functions will return subdirectories of the temporary directory
    when this option is used. The specific subdirectory paths in use are not
    guaranteed to be stable API — always use a getter function to retrieve them.
    
     $(LIST
        * [glib.global.getHomeDir]
        * [glib.global.getUserCacheDir]
        * [glib.global.getSystemConfigDirs]
        * [glib.global.getUserConfigDir]
        * [glib.global.getSystemDataDirs]
        * [glib.global.getUserDataDir]
        * [glib.global.getUserStateDir]
        * [glib.global.getUserRuntimeDir]
     )
       
    The subdirectories may not be created by the test harness; as with normal
    calls to functions like [glib.global.getUserCacheDir], the caller must be prepared
    to create the directory if it doesn’t exist.
*/
enum TEST_OPTION_ISOLATE_DIRS = "isolate_dirs";

/**
    Evaluates to a time span of one day.
*/
enum TIME_SPAN_DAY = 86400000000;

/**
    Evaluates to a time span of one hour.
*/
enum TIME_SPAN_HOUR = 3600000000;

/**
    Evaluates to a time span of one millisecond.
*/
enum TIME_SPAN_MILLISECOND = 1000;

/**
    Evaluates to a time span of one minute.
*/
enum TIME_SPAN_MINUTE = 60000000;

/**
    Evaluates to a time span of one second.
*/
enum TIME_SPAN_SECOND = 1000000;

/**
    The maximum length (in codepoints) of a compatibility or canonical
    decomposition of a single Unicode character.
    
    This is as defined by Unicode 6.1.
*/
enum UNICHAR_MAX_DECOMPOSITION_LENGTH = 18;

/**
    Generic delimiters characters as defined in
    [RFC 3986](https://tools.ietf.org/html/rfc3986). Includes `:/?#[]@`.
*/
enum URI_RESERVED_CHARS_GENERIC_DELIMITERS = ":/?#[]@";

/**
    Subcomponent delimiter characters as defined in
    [RFC 3986](https://tools.ietf.org/html/rfc3986). Includes `!$&'()*+,;=`.
*/
enum URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS = "!$&'()*+,;=";

/**
    Number of microseconds in one second (1 million).
    This macro is provided for code readability.
*/
enum USEC_PER_SEC = 1000000;

/** */
enum VA_COPY_AS_ARRAY = 1;

/**
    A macro that should be defined by the user prior to including
    the glib.h header.
    The definition should be one of the predefined GLib version
    macros: `GLIB_VERSION_2_26`, `GLIB_VERSION_2_28`,...
    
    This macro defines the earliest version of GLib that the package is
    required to be able to compile against.
    
    If the compiler is configured to warn about the use of deprecated
    functions, then using functions that were deprecated in version
    [glib.types.VERSION_MIN_REQUIRED] or earlier will cause warnings (but
    using functions deprecated in later releases will not).
*/
enum VERSION_MIN_REQUIRED = 2;

/** */
enum WIN32_MSG_HANDLE = 19981206;

/** */
enum macro__has_attribute___noreturn__ = 0;
