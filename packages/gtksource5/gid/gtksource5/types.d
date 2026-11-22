/// D types for gtksource5 library
module gid.gtksource5.types;

import gid.core.utils;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;


// Enums

/** */
alias AnnotationStyle = GtkSourceAnnotationStyle;

/** */
alias BackgroundPatternType = GtkSourceBackgroundPatternType;

/** */
alias BracketMatchType = GtkSourceBracketMatchType;

/** */
alias ChangeCaseType = GtkSourceChangeCaseType;

/** */
alias CompletionActivation = GtkSourceCompletionActivation;

/** */
alias CompletionColumn = GtkSourceCompletionColumn;

/** */
alias CompressionType = GtkSourceCompressionType;

/** */
alias FileLoaderError = GtkSourceFileLoaderError;

/** */
alias FileSaverError = GtkSourceFileSaverError;

/** */
alias FileSaverFlags = GtkSourceFileSaverFlags;

/** */
alias GutterRendererAlignmentMode = GtkSourceGutterRendererAlignmentMode;

/** */
alias NewlineType = GtkSourceNewlineType;

/** */
alias SmartHomeEndType = GtkSourceSmartHomeEndType;

/** */
alias SortFlags = GtkSourceSortFlags;

/** */
alias SpaceLocationFlags = GtkSourceSpaceLocationFlags;

/** */
alias SpaceTypeFlags = GtkSourceSpaceTypeFlags;

/** */
alias ViewGutterPosition = GtkSourceViewGutterPosition;

// Callbacks

/**
    This function is called incrementally to process additional background work.
    A deadline is provided which can be checked using `funcGLib.get_monotonic_time` so
    that additional work can be processed each frame.
    
    This is useful for situations where you are incrementally performing
    background work such as spell checking or semantic syntax highlighting.

    Params:
      deadline = the time the callback should complete by
    Returns: true if there is more work to process, otherwise false and the
        handler is unregistered.
*/
alias SchedulerCallback = bool delegate(long deadline);

/**
    Like [gid.gtksource5.global.getMajorVersion], but from the headers used at
    application compile time, rather than from the library linked
    against at application run time.
*/
enum MAJOR_VERSION = 5;

/**
    Like [gid.gtksource5.global.getMicroVersion], but from the headers used at
    application compile time, rather than from the library linked
    against at application run time.
*/
enum MICRO_VERSION = 0;

/**
    Like [gid.gtksource5.global.getMinorVersion], but from the headers used at
    application compile time, rather than from the library linked
    against at application run time.
*/
enum MINOR_VERSION = 18;
