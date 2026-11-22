/// C types for gtksource5 library
module gid.gtksource5.c.types;

public import gid.core.basictypes;
public import gid.gtk4.c.types;

/** */
enum GtkSourceAnnotationStyle
{
  /**
      same color as drawn spaces
  */
  None = 0,

  /**
      same as the diff:changed-line foreground color
  */
  Warning = 1,

  /**
      same as the diff:removed-line foreground color
  */
  Error = 2,

  /**
      same as the diff:added-line foreground color
  */
  Accent = 3,
}

/** */
enum GtkSourceBackgroundPatternType
{
  /**
      no pattern
  */
  None = 0,

  /**
      grid pattern
  */
  Grid = 1,
}

/** */
enum GtkSourceBracketMatchType
{
  /**
      there is no bracket to match.
  */
  None = 0,

  /**
      matching a bracket
       failed because the maximum range was reached.
  */
  OutOfRange = 1,

  /**
      a matching bracket was not found.
  */
  NotFound = 2,

  /**
      a matching bracket was found.
  */
  Found = 3,
}

/** */
enum GtkSourceChangeCaseType
{
  /**
      change case to lowercase.
  */
  Lower = 0,

  /**
      change case to uppercase.
  */
  Upper = 1,

  /**
      toggle case of each character.
  */
  Toggle = 2,

  /**
      capitalize each word.
  */
  Title = 3,
}

/** */
enum GtkSourceCompletionActivation
{
  /** */
  None = 0,

  /** */
  Interactive = 1,

  /** */
  UserRequested = 2,
}

/** */
enum GtkSourceCompletionColumn
{
  /** */
  Icon = 0,

  /** */
  Before = 1,

  /** */
  TypedText = 2,

  /** */
  After = 3,

  /** */
  Comment = 4,

  /** */
  Details = 5,
}

/** */
enum GtkSourceCompressionType
{
  /**
      plain text.
  */
  None = 0,

  /**
      gzip compression.
  */
  Gzip = 1,
}

/**
    An error code used with the `GTK_SOURCE_FILE_LOADER_ERROR` domain.
*/
enum GtkSourceFileLoaderError
{
  /**
      The file is too big.
  */
  TooBig = 0,

  /**
      It is not
      possible to detect the encoding automatically.
  */
  EncodingAutoDetectionFailed = 1,

  /**
      There was an encoding
      conversion error and it was needed to use a fallback character.
  */
  ConversionFallback = 2,
}

/**
    An error code used with the `GTK_SOURCE_FILE_SAVER_ERROR` domain.
*/
enum GtkSourceFileSaverError
{
  /**
      The buffer contains invalid
        characters.
  */
  InvalidChars = 0,

  /**
      The file is externally
        modified.
  */
  ExternallyModified = 1,
}

/**
    Flags to define the behavior of a [gid.gtksource5.types.FileSaverFlags].
*/
enum GtkSourceFileSaverFlags : uint
{
  /**
      No flags.
  */
  None = 0,

  /**
      Ignore invalid characters.
  */
  IgnoreInvalidChars = 1,

  /**
      Save file despite external modifications.
  */
  IgnoreModificationTime = 2,

  /**
      Create a backup before saving the file.
  */
  CreateBackup = 4,
}

/**
    The alignment mode of the renderer, when a cell spans multiple lines (due to
    text wrapping).
*/
enum GtkSourceGutterRendererAlignmentMode
{
  /**
      The full cell.
  */
  Cell = 0,

  /**
      The first line.
  */
  First = 1,

  /**
      The last line.
  */
  Last = 2,
}

/** */
enum GtkSourceNewlineType
{
  /**
      line feed, used on UNIX.
  */
  Lf = 0,

  /**
      carriage return, used on Mac.
  */
  Cr = 1,

  /**
      carriage return followed by a line feed, used
        on Windows.
  */
  CrLf = 2,
}

/** */
enum GtkSourceSmartHomeEndType
{
  /**
      smart-home-end disabled.
  */
  Disabled = 0,

  /**
      move to the first/last
      non-whitespace character on the first press of the HOME/END keys and
      to the beginning/end of the line on the second press.
  */
  Before = 1,

  /**
      move to the beginning/end of the
      line on the first press of the HOME/END keys and to the first/last
      non-whitespace character on the second press.
  */
  After = 2,

  /**
      always move to the first/last
      non-whitespace character when the HOME/END keys are pressed.
  */
  Always = 3,
}

/** */
enum GtkSourceSortFlags : uint
{
  /**
      no flags specified
  */
  None = 0,

  /**
      case sensitive sort
  */
  CaseSensitive = 1,

  /**
      sort in reverse order
  */
  ReverseOrder = 2,

  /**
      remove duplicates
  */
  RemoveDuplicates = 4,

  /**
      improved sorting for filenames.
      
      see `func@GLib.utf8_collate_key_for_filename`
  */
  Filename = 8,
}

/**
    #GtkSourceSpaceLocationFlags contains flags for white space locations.
    
    If a line contains only white spaces (no text), the white spaces match both
    [gid.gtksource5.types.SpaceLocationFlags.Leading] and [gid.gtksource5.types.SpaceLocationFlags.Trailing].
*/
enum GtkSourceSpaceLocationFlags : uint
{
  /**
      No flags.
  */
  None = 0,

  /**
      Leading white spaces on a line, i.e. the
        indentation.
  */
  Leading = 1,

  /**
      White spaces inside a line of text.
  */
  InsideText = 2,

  /**
      Trailing white spaces on a line.
  */
  Trailing = 4,

  /**
      White spaces anywhere.
  */
  All = 7,
}

/**
    #GtkSourceSpaceTypeFlags contains flags for white space types.
*/
enum GtkSourceSpaceTypeFlags : uint
{
  /**
      No flags.
  */
  None = 0,

  /**
      Space character.
  */
  Space = 1,

  /**
      Tab character.
  */
  Tab = 2,

  /**
      Line break character. If the
        #GtkSourceBuffer:implicit-trailing-newline property is true,
        #GtkSourceSpaceDrawer also draws a line break at the end of the buffer.
  */
  Newline = 4,

  /**
      Non-breaking space character.
  */
  Nbsp = 8,

  /**
      All white spaces.
  */
  All = 15,
}

/** */
enum GtkSourceViewGutterPosition
{
  /**
      the gutter position of the lines
      renderer
  */
  Lines = -30,

  /**
      the gutter position of the marks
      renderer
  */
  Marks = -20,
}

/**
    Represents an annotation added to [gid.gtksource5.view.View], it has a [gid.gtksource5.annotation.Annotation.line] property,
    [gid.gtksource5.annotation.Annotation.description], icon and a style.
    
    It will be displayed always at the end of a line.
    
    If the style is GTK_SOURCE_ANNOTATION_STYLE_NONE it will use the same color as [gid.gtksource5.space_drawer.SpaceDrawer].
*/
struct GtkSourceAnnotation;

/** */
struct GtkSourceAnnotationClass
{
  /** */
  GObjectClass parentClass;
}

/**
    It is used to provide annotations and display them on [gid.gtksource5.view.View] and also populate
    [gid.gtksource5.hover_display.HoverDisplay] when the user hovers over an annotation.
    
    You can subclass this object and implement [gid.gtksource5.annotation_provider.AnnotationProvider.populateHoverAsync] and
    [gid.gtksource5.annotation_provider.AnnotationProvider.populateHoverFinish] or connect to `signal@AnnotationProvider::populate`
    and call `method@AnnotationProvider.populate` or do it asynchronously.
*/
struct GtkSourceAnnotationProvider
{
  /** */
  GObject parentInstance;
}

/** */
struct GtkSourceAnnotationProviderClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(GtkSourceAnnotationProvider* self, GtkSourceAnnotation* annotation, GtkSourceHoverDisplay* display, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) populateHoverAsync;

  /** */
  extern(C) gboolean function(GtkSourceAnnotationProvider* self, GAsyncResult* result, GError** _err) populateHoverFinish;
}

/**
    Use this object to manage [gid.gtksource5.annotation.Annotation]s. Each [gid.gtksource5.view.View] has a single annotation
    manager and it is guaranteed to be the same for the lifetime of [gid.gtksource5.view.View].
    
    Add [gid.gtksource5.annotation_provider.AnnotationProvider]s with [gid.gtksource5.annotations.Annotations.addProvider] to
    display all the annotations added to each [gid.gtksource5.annotation_provider.AnnotationProvider].
*/
struct GtkSourceAnnotations;

/** */
struct GtkSourceAnnotationsClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Subclass of [gid.gtk4.text_buffer.TextBuffer].
    
    A [gid.gtksource5.buffer.Buffer] object is the model for [gid.gtksource5.view.View] widgets.
    It extends the [gid.gtk4.text_buffer.TextBuffer] class by adding features useful to display
    and edit source code such as syntax highlighting and bracket matching.
    
    To create a [gid.gtksource5.buffer.Buffer] use [gid.gtksource5.buffer.Buffer.new_] or
    [gid.gtksource5.buffer.Buffer.newWithLanguage]. The second form is just a convenience
    function which allows you to initially set a [gid.gtksource5.language.Language]. You can also
    directly create a [gid.gtksource5.view.View] and get its [gid.gtksource5.buffer.Buffer] with
    [gid.gtk4.text_view.TextView.getBuffer].
    
    The highlighting is enabled by default, but you can disable it with
    [gid.gtksource5.buffer.Buffer.setHighlightSyntax].
    
    # Context Classes:
    
    It is possible to retrieve some information from the syntax highlighting
    engine. The default context classes that are applied to regions of a
    [gid.gtksource5.buffer.Buffer]:
    
     - **comment**: the region delimits a comment;
     - **no-spell-check**: the region should not be spell checked;
     - **path**: the region delimits a path to a file;
     - **string**: the region delimits a string.
    
    Custom language definition files can create their own context classes,
    since the functions like [gid.gtksource5.buffer.Buffer.iterHasContextClass] take
    a string parameter as the context class.
    
    [gid.gtksource5.buffer.Buffer] provides an API to access the context classes:
    [gid.gtksource5.buffer.Buffer.iterHasContextClass],
    [gid.gtksource5.buffer.Buffer.getContextClassesAtIter],
    [gid.gtksource5.buffer.Buffer.iterForwardToContextClassToggle] and
    [gid.gtksource5.buffer.Buffer.iterBackwardToContextClassToggle].
    
    And the [gid.gtksource5.buffer.Buffer.highlightUpdated] signal permits to be notified
    when a context class region changes.
    
    Each context class has also an associated [gid.gtk4.text_tag.TextTag] with the name
    `gtksourceview:context-classes:<name>`. For example to
    retrieve the [gid.gtk4.text_tag.TextTag] for the string context class, one can write:
    ```c
    GtkTextTagTable *tag_table;
    GtkTextTag *tag;
    
    tag_table = gtk_text_buffer_get_tag_table (buffer);
    tag = gtk_text_tag_table_lookup (tag_table, "gtksourceview:context-classes:string");
    ```
    ```python
    buffer = GtkSource.Buffer()
    
    tag_table = buffer.get_tag_table()
    tag = tag_table.lookup(name="gtksourceview:context-classes:string")
    ```
    
    The tag must be used for read-only purposes.
    
    Accessing a context class via the associated [gid.gtk4.text_tag.TextTag] is less
    convenient than the [gid.gtksource5.buffer.Buffer] API, because:
    
     - The tag doesn't always exist, you need to listen to the
       [gid.gtk4.text_tag_table.TextTagTable.tagAdded] and [gid.gtk4.text_tag_table.TextTagTable.tagRemoved] signals.
     - Instead of the [gid.gtksource5.buffer.Buffer.highlightUpdated] signal, you can listen
       to the [gid.gtk4.text_buffer.TextBuffer.applyTag] and [gid.gtk4.text_buffer.TextBuffer.removeTag] signals.
    
    A possible use-case for accessing a context class via the associated
    [gid.gtk4.text_tag.TextTag] is to read the region but without adding a hard dependency on the
    GtkSourceView library (for example for a spell-checking library that wants to
    read the no-spell-check region).
*/
struct GtkSourceBuffer
{
  /** */
  GtkTextBuffer parentInstance;
}

/** */
struct GtkSourceBufferClass
{
  /** */
  GtkTextBufferClass parentClass;

  /** */
  extern(C) void function(GtkSourceBuffer* buffer, GtkTextIter* iter, GtkSourceBracketMatchType state) bracketMatched;

  /** */
  void*[20] Reserved;
}

/**
    Main Completion Object.
    
    The completion system helps the user when they writes some text,
    such as words, command names, functions, and suchlike. Proposals can
    be shown, to complete the text the user is writing. Each proposal can
    contain an additional piece of information (for example
    documentation), that is displayed when the "Details" button is
    clicked.
    
    Proposals are created via a [gid.gtksource5.completion_provider.CompletionProvider]. There can
    be for example a provider to complete words (see [gid.gtksource5.completion_words.CompletionWords]),
    another provider for the completion of
    function names, etc. To add a provider, call
    [gid.gtksource5.completion.Completion.addProvider].
    
    The [gid.gtksource5.completion_proposal.CompletionProposal] interface represents a proposal.
    
    If a proposal contains extra information (see
    [gid.gtksource5.types.CompletionColumn.Details]), it will be
    displayed in a supplemental details window, which appears when
    the "Details" button is clicked.
    
    Each [gid.gtksource5.view.View] object is associated with a [gid.gtksource5.completion.Completion]
    instance. This instance can be obtained with
    [gid.gtksource5.view.View.getCompletion]. The [gid.gtksource5.view.View] class contains also the
    [gid.gtksource5.view.View.showCompletion] signal.
    
    A same [gid.gtksource5.completion_provider.CompletionProvider] object can be used for several
    [gid.gtksource5.completion.Completion]'s.
*/
struct GtkSourceCompletion;

/**
    Widget for single cell of completion proposal.
    
    The [gid.gtksource5.completion_cell.CompletionCell] widget provides a container to display various
    types of information with the completion display.
    
    Each proposal may consist of multiple cells depending on the complexity of
    the proposal. For example, programming language proposals may contain a cell
    for the "left-hand-side" of an operation along with the "typed-text" for a
    function name and "parameters". They may also optionally set an icon to
    signify the kind of result.
    
    A [gid.gtksource5.completion_provider.CompletionProvider] should implement the
    `vfunc@CompletionProvider.display` virtual function to control
    how to convert data from their [gid.gtksource5.completion_proposal.CompletionProposal] to content for
    the [gid.gtksource5.completion_cell.CompletionCell].
*/
struct GtkSourceCompletionCell;

/** */
struct GtkSourceCompletionCellClass
{
  /** */
  GtkWidgetClass parentClass;
}

/** */
struct GtkSourceCompletionClass
{
  /** */
  GObjectClass parentClass;
}

/**
    The context of a completion.
    
    [gid.gtksource5.completion_context.CompletionContext] contains information about an attept to display
    completion proposals to the user based on typed text in the [gid.gtksource5.view.View].
    
    When typing, [gid.gtksource5.completion.Completion] may use registered
    [gid.gtksource5.completion_provider.CompletionProvider] to determine if there may be results which
    could be displayed. If so, a [gid.gtksource5.completion_context.CompletionContext] is created with
    information that is provided to the [gid.gtksource5.completion_provider.CompletionProvider] to populate
    results which might be useful to the user.
    
    [gid.gtksource5.completion_provider.CompletionProvider] are expected to provide [gid.gio2.list_model.ListModel] with
    [gid.gtksource5.completion_proposal.CompletionProposal] which may be joined together in a list of
    results for the user. They are also responsible for how the contents are
    displayed using [gid.gtksource5.completion_cell.CompletionCell] which allows for some level of
    customization.
*/
struct GtkSourceCompletionContext;

/** */
struct GtkSourceCompletionContextClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Interface for completion proposals.
    
    This interface is used to denote that an object is capable of being
    a completion proposal for [gid.gtksource5.completion.Completion].
    
    Currently, no method or functions are required but additional methods
    may be added in the future. Proposals created by
    #GtkSourceCompletionProvider can use `func@GObject.IMPLEMENT_INTERFACE` to
    implement this with null for the interface init function.
*/
struct GtkSourceCompletionProposal;

/** */
struct GtkSourceCompletionProposalInterface
{
  /** */
  GTypeInterface parentIface;

  /** */
  extern(C) char* function(GtkSourceCompletionProposal* proposal) getTypedText;
}

/**
    Completion provider interface.
    
    You must implement this interface to provide proposals to [gid.gtksource5.completion.Completion].
    
    In most cases, implementations of this interface will want to use
    `vfunc@CompletionProvider.populate_async` to asynchronously populate the results
    to avoid blocking the main loop.
*/
struct GtkSourceCompletionProvider;

/** */
struct GtkSourceCompletionProviderInterface
{
  /** */
  GTypeInterface parentIface;

  /** */
  extern(C) char* function(GtkSourceCompletionProvider* self) getTitle;

  /** */
  extern(C) int function(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context) getPriority;

  /** */
  extern(C) gboolean function(GtkSourceCompletionProvider* self, const(GtkTextIter)* iter, dchar ch) isTrigger;

  /** */
  extern(C) gboolean function(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context, GtkSourceCompletionProposal* proposal, uint keyval, GdkModifierType state) keyActivates;

  /** */
  extern(C) GListModel* function(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context, GError** _err) populate;

  /** */
  extern(C) void function(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) populateAsync;

  /** */
  extern(C) GListModel* function(GtkSourceCompletionProvider* self, GAsyncResult* result, GError** _err) populateFinish;

  /** */
  extern(C) void function(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context, GListModel* model) refilter;

  /** */
  extern(C) void function(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context, GtkSourceCompletionProposal* proposal, GtkSourceCompletionCell* cell) display;

  /** */
  extern(C) void function(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context, GtkSourceCompletionProposal* proposal) activate;

  /** */
  extern(C) GPtrArray* function(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context, GtkSourceCompletionProposal* proposal) listAlternates;
}

/**
    A [gid.gtksource5.completion_provider.CompletionProvider] for the completion of snippets.
    
    The [gid.gtksource5.completion_snippets.CompletionSnippets] is an example of an implementation of
    the [gid.gtksource5.completion_provider.CompletionProvider] interface. The proposals are snippets
    registered with the [gid.gtksource5.snippet_manager.SnippetManager].
*/
struct GtkSourceCompletionSnippets
{
  /** */
  GObject parentInstance;
}

/** */
struct GtkSourceCompletionSnippetsClass
{
  /** */
  GObjectClass parentClass;

  /** */
  void*[10] Reserved;
}

/**
    A [gid.gtksource5.completion_provider.CompletionProvider] for the completion of words.
    
    The [gid.gtksource5.completion_words.CompletionWords] is an example of an implementation of
    the [gid.gtksource5.completion_provider.CompletionProvider] interface. The proposals are words
    appearing in the registered [gid.gtk4.text_buffer.TextBuffer]s.
*/
struct GtkSourceCompletionWords
{
  /** */
  GObject parentInstance;
}

/** */
struct GtkSourceCompletionWordsClass
{
  /** */
  GObjectClass parentClass;

  /** */
  void*[10] Reserved;
}

/**
    Character encoding.
    
    The #GtkSourceEncoding boxed type represents a character encoding. It is used
    for example by #GtkSourceFile. Note that the text in GTK widgets is always
    encoded in UTF-8.
*/
struct GtkSourceEncoding;

/**
    On-disk representation of a [gid.gtksource5.buffer.Buffer].
    
    A [gid.gtksource5.file.File] object is the on-disk representation of a [gid.gtksource5.buffer.Buffer].
    With a [gid.gtksource5.file.File], you can create and configure a [gid.gtksource5.file_loader.FileLoader]
    and [gid.gtksource5.file_saver.FileSaver] which take by default the values of the
    [gid.gtksource5.file.File] properties (except for the file loader which auto-detect some
    properties). On a successful load or save operation, the [gid.gtksource5.file.File]
    properties are updated. If an operation fails, the [gid.gtksource5.file.File] properties
    have still the previous valid values.
*/
struct GtkSourceFile
{
  /** */
  GObject parentInstance;
}

/** */
struct GtkSourceFileClass
{
  /** */
  GObjectClass parentClass;

  /** */
  void*[10] Reserved;
}

/**
    Load a file into a GtkSourceBuffer.
    
    A [gid.gtksource5.file_loader.FileLoader] object permits to load the contents of a [gid.gio2.file.File] or a
    [gid.gio2.input_stream.InputStream] into a [gid.gtksource5.buffer.Buffer].
    
    A file loader should be used only for one load operation, including errors
    handling. If an error occurs, you can reconfigure the loader and relaunch the
    operation with [gid.gtksource5.file_loader.FileLoader.loadAsync].
    
    Running a [gid.gtksource5.file_loader.FileLoader] is an undoable action for the
    [gid.gtksource5.buffer.Buffer].
    
    After a file loading, the buffer is reset to the contents provided by the
    [gid.gio2.file.File] or [gid.gio2.input_stream.InputStream], so the buffer is set as “unmodified”, that is,
    [gid.gtk4.text_buffer.TextBuffer.setModified] is called with false. If the contents isn't
    saved somewhere (for example if you load from stdin), then you should
    probably call [gid.gtk4.text_buffer.TextBuffer.setModified] with true after calling
    [gid.gtksource5.file_loader.FileLoader.loadFinish].
*/
struct GtkSourceFileLoader;

/** */
struct GtkSourceFileLoaderClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Save a [gid.gtksource5.buffer.Buffer] into a file.
    
    A [gid.gtksource5.file_saver.FileSaver] object permits to save a [gid.gtksource5.buffer.Buffer] into a
    [gid.gio2.file.File].
    
    A file saver should be used only for one save operation, including errors
    handling. If an error occurs, you can reconfigure the saver and relaunch the
    operation with [gid.gtksource5.file_saver.FileSaver.saveAsync].
*/
struct GtkSourceFileSaver;

/** */
struct GtkSourceFileSaverClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Gutter object for [gid.gtksource5.view.View].
    
    The [gid.gtksource5.gutter.Gutter] object represents the left or right gutter of the text
    view. It is used by [gid.gtksource5.view.View] to draw the line numbers and
    [gid.gtksource5.mark.Mark]s that might be present on a line. By packing
    additional [gid.gtksource5.gutter_renderer.GutterRenderer] objects in the gutter, you can extend the
    gutter with your own custom drawings.
    
    To get a [gid.gtksource5.gutter.Gutter], use the [gid.gtksource5.view.View.getGutter] function.
    
    The gutter works very much the same way as cells rendered in a [gid.gtk4.tree_view.TreeView].
    The concept is similar, with the exception that the gutter does not have an
    underlying [gid.gtk4.tree_model.TreeModel]. The builtin line number renderer is at position
    [gid.gtksource5.types.ViewGutterPosition.Lines] (-30) and the marks renderer is at
    [gid.gtksource5.types.ViewGutterPosition.Marks] (-20). The gutter sorts the renderers
    in ascending order, from left to right. So the marks are displayed on the
    right of the line numbers.
*/
struct GtkSourceGutter;

/** */
struct GtkSourceGutterClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    Collected information about visible lines.
    
    The [gid.gtksource5.gutter_lines.GutterLines] object is used to collect information about
    visible lines.
    
    Use this from your [gid.gtksource5.gutter_renderer.GutterRenderer.queryData] to collect the
    necessary information on visible lines. Doing so reduces the number of
    passes through the text btree allowing GtkSourceView to reach more
    frames-per-second while performing kinetic scrolling.
*/
struct GtkSourceGutterLines;

/** */
struct GtkSourceGutterLinesClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Gutter cell renderer.
    
    A [gid.gtksource5.gutter_renderer.GutterRenderer] represents a column in a [gid.gtksource5.gutter.Gutter]. The
    column contains one cell for each visible line of the [gid.gtk4.text_buffer.TextBuffer]. Due to
    text wrapping, a cell can thus span multiple lines of the [gid.gtk4.text_view.TextView]. In
    this case, [gid.gtksource5.types.GutterRendererAlignmentMode] controls the alignment of
    the cell.
    
    The gutter renderer is a [gid.gtk4.widget.Widget] and is measured using the normal widget
    measurement facilities. The width of the gutter will be determined by the
    measurements of the gutter renderers.
    
    The width of a gutter renderer generally takes into account the entire text
    buffer. For instance, to display the line numbers, if the buffer contains 100
    lines, the gutter renderer will always set its width such as three digits can
    be printed, even if only the first 20 lines are shown. Another strategy is to
    take into account only the visible lines.  In this case, only two digits are
    necessary to display the line numbers of the first 20 lines. To take another
    example, the gutter renderer for [gid.gtksource5.mark.Mark]s doesn't need to take
    into account the text buffer to announce its width. It only depends on the
    icons size displayed in the gutter column.
    
    When the available size to render a cell is greater than the required size to
    render the cell contents, the cell contents can be aligned horizontally and
    vertically with [gid.gtksource5.gutter_renderer.GutterRenderer.setAlignmentMode].
    
    The cells rendering occurs using `vfunc@Gtk.Widget.snapshot`. Implementations
    should use `gtk_source_gutter_renderer_get_lines()` to retrieve information
    about the lines to be rendered. To help with aligning content which takes
    into account the padding and alignment of a cell, implementations may call
    [gid.gtksource5.gutter_renderer.GutterRenderer.alignCell] for a given line number with the
    width and height measurement of the content they width to render.
*/
struct GtkSourceGutterRenderer
{
  /** */
  GtkWidget parentInstance;
}

/** */
struct GtkSourceGutterRendererClass
{
  /** */
  GtkWidgetClass parentClass;

  /** */
  extern(C) void function(GtkSourceGutterRenderer* renderer, GtkSourceGutterLines* lines, uint line) queryData;

  /** */
  extern(C) void function(GtkSourceGutterRenderer* renderer, GtkSourceGutterLines* lines) begin;

  /** */
  extern(C) void function(GtkSourceGutterRenderer* renderer, GtkSnapshot* snapshot, GtkSourceGutterLines* lines, uint line) snapshotLine;

  /** */
  extern(C) void function(GtkSourceGutterRenderer* renderer) end;

  /** */
  extern(C) void function(GtkSourceGutterRenderer* renderer, GtkSourceView* oldView) changeView;

  /** */
  extern(C) void function(GtkSourceGutterRenderer* renderer, GtkSourceBuffer* oldBuffer) changeBuffer;

  /** */
  extern(C) gboolean function(GtkSourceGutterRenderer* renderer, GtkTextIter* iter, GdkRectangle* area) queryActivatable;

  /** */
  extern(C) void function(GtkSourceGutterRenderer* renderer, GtkTextIter* iter, GdkRectangle* area, uint button, GdkModifierType state, int nPresses) activate;

  /** */
  void*[20] Reserved;
}

/**
    Renders a pixbuf in the gutter.
    
    A [gid.gtksource5.gutter_renderer_pixbuf.GutterRendererPixbuf] can be used to render an image in a cell of
    [gid.gtksource5.gutter.Gutter].
*/
struct GtkSourceGutterRendererPixbuf
{
  /** */
  GtkSourceGutterRenderer parentInstance;
}

/** */
struct GtkSourceGutterRendererPixbufClass
{
  /** */
  GtkSourceGutterRendererClass parentClass;

  /** */
  void*[10] Reserved;
}

/**
    Renders text in the gutter.
    
    A [gid.gtksource5.gutter_renderer_text.GutterRendererText] can be used to render text in a cell of
    [gid.gtksource5.gutter.Gutter].
*/
struct GtkSourceGutterRendererText
{
  /** */
  GtkSourceGutterRenderer parentInstance;
}

/** */
struct GtkSourceGutterRendererTextClass
{
  /** */
  GtkSourceGutterRendererClass parentClass;

  /** */
  void*[10] Reserved;
}

/**
    Interactive tooltips.
    
    [gid.gtksource5.hover.Hover] allows a [gid.gtksource5.view.View] to provide contextual information.
    When enabled, if the user hovers over a word in the text editor, a series
    of registered [gid.gtksource5.hover_provider.HoverProvider] can populate a [gid.gtksource5.hover_display.HoverDisplay]
    with useful information.
    
    To enable call [gid.gtksource5.view.View.getHover] and add [gid.gtksource5.hover_provider.HoverProvider]
    using [gid.gtksource5.hover.Hover.addProvider]. To disable, remove all registered
    providers with [gid.gtksource5.hover.Hover.removeProvider].
    
    You can change how long to wait to display the interactive tooltip by
    setting the [gid.gtksource5.hover.Hover.hoverDelay] property in milliseconds.
*/
struct GtkSourceHover;

/** */
struct GtkSourceHoverClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Context for populating [gid.gtksource5.hover_display.HoverDisplay] contents.
    
    [gid.gtksource5.hover_context.HoverContext] contains information about the request to populate
    contents for a [gid.gtksource5.hover_display.HoverDisplay].
    
    It can be used to retrieve the [gid.gtksource5.view.View], [gid.gtksource5.buffer.Buffer], and
    [gid.gtk4.text_iter.TextIter] for the regions of text which are being displayed.
    
    Use [gid.gtksource5.hover_context.HoverContext.getBounds] to get the word that was
    requested. [gid.gtksource5.hover_context.HoverContext.getIter] will get you the location
    of the pointer when the request was made.
*/
struct GtkSourceHoverContext;

/** */
struct GtkSourceHoverContextClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Display for interactive tooltips.
    
    [gid.gtksource5.hover_display.HoverDisplay] is a [gid.gtk4.widget.Widget] that may be populated with widgets
    to be displayed to the user in interactive tooltips. The children widgets
    are packed vertically using a [gid.gtk4.box.Box].
    
    Implement the [gid.gtksource5.hover_provider.HoverProvider] interface to be notified of when
    to populate a [gid.gtksource5.hover_display.HoverDisplay] on behalf of the user.
*/
struct GtkSourceHoverDisplay;

/** */
struct GtkSourceHoverDisplayClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    Interface to populate interactive tooltips.
    
    [gid.gtksource5.hover_provider.HoverProvider] is an interface that should be implemented to extend
    the contents of a [gid.gtksource5.hover_display.HoverDisplay]. This is typical in editors that
    interact external tooling such as those utilizing Language Server Protocol.
    
    If you can populate the [gid.gtksource5.hover_display.HoverDisplay] synchronously, use
    `vfunc@HoverProvider.populate`. Otherwise, interface implementations that
    may take additional time should use `vfunc@HoverProvider.populate_async`
    to avoid blocking the main loop.
*/
struct GtkSourceHoverProvider;

/** */
struct GtkSourceHoverProviderInterface
{
  /** */
  GTypeInterface parentIface;

  /** */
  extern(C) gboolean function(GtkSourceHoverProvider* self, GtkSourceHoverContext* context, GtkSourceHoverDisplay* display, GError** _err) populate;

  /** */
  extern(C) void function(GtkSourceHoverProvider* self, GtkSourceHoverContext* context, GtkSourceHoverDisplay* display, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) populateAsync;

  /** */
  extern(C) gboolean function(GtkSourceHoverProvider* self, GAsyncResult* result, GError** _err) populateFinish;
}

/**
    Auto-indentation interface.
    
    By default, [gid.gtksource5.view.View] can auto-indent as you type when
    [gid.gtksource5.view.View.autoIndent] is enabled. The indentation simply copies the
    previous lines indentation.
    
    This can be changed by implementing [gid.gtksource5.indenter.Indenter] and setting the
    [gid.gtksource5.view.View.indenter] property.
    
    Implementors of this interface should implement both
    `vfunc@GtkSource.Indenter.is_trigger` and `vfunc@GtkSource.Indenter.indent`.
    
    `vfunc@GtkSource.Indenter.is_trigger` is called upon key-press to
    determine of the key press should trigger an indentation.  The default
    implementation of the interface checks to see if the key was
    [gid.gdk4.types.KEY_Return] or [gid.gdk4.types.KEY_KP_Enter] without [gid.gdk4.types.ModifierType.ShiftMask] set.
    
    `vfunc@GtkSource.Indenter.indent` is called after text has been
    inserted into [gid.gtksource5.buffer.Buffer] when
    `vfunc@GtkSource.Indenter.is_trigger` returned true. The [gid.gtk4.text_iter.TextIter]
    is placed directly after the inserted character or characters.
    
    It may be beneficial to move the insertion mark using
    [gid.gtk4.text_buffer.TextBuffer.selectRange] depending on how the indenter changes
    the indentation.
    
    All changes are encapsulated within a single user action so that the
    user may undo them using standard undo/redo accelerators.
*/
struct GtkSourceIndenter;

/**
    The virtual function table for #GtkSourceIndenter.
*/
struct GtkSourceIndenterInterface
{
  /** */
  GTypeInterface parentIface;

  /**
      the virtual function pointer for [gid.gtksource5.indenter.Indenter.isTrigger]
  */
  extern(C) gboolean function(GtkSourceIndenter* self, GtkSourceView* view, const(GtkTextIter)* location, GdkModifierType state, uint keyval) isTrigger;

  /**
      the virtual function pointer for [gid.gtksource5.indenter.Indenter.indent]
  */
  extern(C) void function(GtkSourceIndenter* self, GtkSourceView* view, GtkTextIter* iter) indent;
}

/**
    Represents a syntax highlighted language.
    
    A [gid.gtksource5.language.Language] represents a programming or markup language, affecting
    syntax highlighting and [context classes](./class.Buffer.html#context-classes).
    
    Use [gid.gtksource5.language_manager.LanguageManager] to obtain a [gid.gtksource5.language.Language] instance, and
    [gid.gtksource5.buffer.Buffer.setLanguage] to apply it to a [gid.gtksource5.buffer.Buffer].
*/
struct GtkSourceLanguage;

/** */
struct GtkSourceLanguageClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Provides access to [gid.gtksource5.language.Language]s.
    
    [gid.gtksource5.language_manager.LanguageManager] is an object which processes language description
    files and creates and stores [gid.gtksource5.language.Language] objects, and provides API to
    access them.
    
    Use [gid.gtksource5.language_manager.LanguageManager.getDefault] to retrieve the default
    instance of [gid.gtksource5.language_manager.LanguageManager], and
    [gid.gtksource5.language_manager.LanguageManager.guessLanguage] to get a [gid.gtksource5.language.Language] for
    given file name and content type.
*/
struct GtkSourceLanguageManager;

/** */
struct GtkSourceLanguageManagerClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Widget that displays a map for a specific [gid.gtksource5.view.View].
    
    [gid.gtksource5.map.Map] is a widget that maps the content of a [gid.gtksource5.view.View] into
    a smaller view so the user can have a quick overview of the whole document.
    
    This works by connecting a [gid.gtksource5.view.View] to to the [gid.gtksource5.map.Map] using
    the [gid.gtksource5.map.Map.view] property or [gid.gtksource5.map.Map.setView].
    
    [gid.gtksource5.map.Map] is a [gid.gtksource5.view.View] object. This means that you can add a
    [gid.gtksource5.gutter_renderer.GutterRenderer] to a gutter in the same way you would for a
    [gid.gtksource5.view.View]. One example might be a [gid.gtksource5.gutter_renderer.GutterRenderer] that shows
    which lines have changed in the document.
    
    Additionally, it is desirable to match the font of the [gid.gtksource5.map.Map] and
    the [gid.gtksource5.view.View] used for editing. Therefore, [gid.gtksource5.map.Map.fontDesc]
    should be used to set the target font. You will need to adjust this to the
    desired font size for the map. A 1pt font generally seems to be an
    appropriate font size. "Monospace 1" is the default. See
    [gid.pango1.font_description.FontDescription.setSize] for how to alter the size of an existing
    [gid.pango1.font_description.FontDescription].
    
    When FontConfig is available, [gid.gtksource5.map.Map] will try to use a bundled
    "block" font to make the map more legible.
*/
struct GtkSourceMap
{
  /** */
  GtkSourceView parentInstance;
}

/** */
struct GtkSourceMapClass
{
  /** */
  GtkSourceViewClass parentClass;

  /** */
  void*[10] Reserved;
}

/**
    Mark object for [gid.gtksource5.buffer.Buffer].
    
    A [gid.gtksource5.mark.Mark] marks a position in the text where you want to display
    additional info. It is based on [gid.gtk4.text_mark.TextMark] and thus is still valid after
    the text has changed though its position may change.
    
    [gid.gtksource5.mark.Mark]s are organized in categories which you have to set
    when you create the mark. Each category can have a priority, a pixbuf and
    other associated attributes. See [gid.gtksource5.view.View.setMarkAttributes].
    The pixbuf will be displayed in the margin at the line where the mark
    residents if the [gid.gtksource5.view.View.showLineMarks] property is set to true. If
    there are multiple marks in the same line, the pixbufs will be drawn on top
    of each other. The mark with the highest priority will be drawn on top.
*/
struct GtkSourceMark
{
  /** */
  GtkTextMark parentInstance;
}

/**
    The source mark attributes object.
    
    [gid.gtksource5.mark_attributes.MarkAttributes] is an object specifying attributes used by
    a [gid.gtksource5.view.View] to visually show lines marked with [gid.gtksource5.mark.Mark]s
    of a specific category. It allows you to define a background color of a line,
    an icon shown in gutter and tooltips.
    
    The background color is used as a background of a line where a mark is placed
    and it can be set with [gid.gtksource5.mark_attributes.MarkAttributes.setBackground]. To check
    if any custom background color was defined and what color it is, use
    [gid.gtksource5.mark_attributes.MarkAttributes.getBackground].
    
    An icon is a graphic element which is shown in the gutter of a view. An
    example use is showing a red filled circle in a debugger to show that a
    breakpoint was set in certain line. To get an icon that will be placed in
    a gutter, first a base for it must be specified and then
    [gid.gtksource5.mark_attributes.MarkAttributes.renderIcon] must be called.
    There are several ways to specify a base for an icon:
    
    - [gid.gtksource5.mark_attributes.MarkAttributes.setIconName]
    - [gid.gtksource5.mark_attributes.MarkAttributes.setGicon]
    - [gid.gtksource5.mark_attributes.MarkAttributes.setPixbuf]
    
    Using any of the above functions overrides the one used earlier. But note
    that a getter counterpart of earlier used function can still return some
    value, but it is just not used when rendering the proper icon.
    
    To provide meaningful tooltips for a given mark of a category, you should
    connect to [gid.gtksource5.mark_attributes.MarkAttributes.queryTooltipText] or
    [gid.gtksource5.mark_attributes.MarkAttributes.queryTooltipMarkup] where the latter
    takes precedence.
*/
struct GtkSourceMarkAttributes;

/** */
struct GtkSourceMarkAttributesClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GtkSourceMarkClass
{
  /** */
  GtkTextMarkClass parentClass;

  /** */
  void*[10] Reserved;
}

/**
    Compose a [gid.gtksource5.buffer.Buffer] for printing.
    
    The [gid.gtksource5.print_compositor.PrintCompositor] object is used to compose a [gid.gtksource5.buffer.Buffer]
    for printing. You can set various configuration options to customize the
    printed output. [gid.gtksource5.print_compositor.PrintCompositor] is designed to be used with the
    high-level printing API of gtk+, i.e. [gid.gtk4.print_operation.PrintOperation].
    
    The margins specified in this object are the layout margins: they define the
    blank space bordering the printed area of the pages. They must not be
    confused with the "print margins", i.e. the parts of the page that the
    printer cannot print on, defined in the [gid.gtk4.page_setup.PageSetup] objects. If the
    specified layout margins are smaller than the "print margins", the latter
    ones are used as a fallback by the [gid.gtksource5.print_compositor.PrintCompositor] object, so that
    the printed area is not clipped.
*/
struct GtkSourcePrintCompositor
{
  /** */
  GObject parentInstance;
}

/** */
struct GtkSourcePrintCompositorClass
{
  /** */
  GObjectClass parentClass;

  /** */
  void*[10] Reserved;
}

/**
    Region utility.
    
    A [gid.gtksource5.region.Region] permits to store a group of subregions of a
    [gid.gtk4.text_buffer.TextBuffer]. [gid.gtksource5.region.Region] stores the subregions with pairs of
    [gid.gtk4.text_mark.TextMark]'s, so the region is still valid after insertions and deletions
    in the [gid.gtk4.text_buffer.TextBuffer].
    
    The [gid.gtk4.text_mark.TextMark] for the start of a subregion has a left gravity, while the
    [gid.gtk4.text_mark.TextMark] for the end of a subregion has a right gravity.
    
    The typical use-case of [gid.gtksource5.region.Region] is to scan a [gid.gtk4.text_buffer.TextBuffer] chunk by
    chunk, not the whole buffer at once to not block the user interface. The
    [gid.gtksource5.region.Region] represents in that case the remaining region to scan. You
    can listen to the [gid.gtk4.text_buffer.TextBuffer.insertText] and
    [gid.gtk4.text_buffer.TextBuffer.deleteRange] signals to update the [gid.gtksource5.region.Region]
    accordingly.
    
    To iterate through the subregions, you need to use a [gid.gtksource5.region_iter.RegionIter],
    for example:
    ```c
    GtkSourceRegion *region;
    GtkSourceRegionIter region_iter;
    
    gtk_source_region_get_start_region_iter (region, &region_iter);
    
    while (!gtk_source_region_iter_is_end (&region_iter))
    {
            GtkTextIter subregion_start;
            GtkTextIter subregion_end;
    
            if (!gtk_source_region_iter_get_subregion (&region_iter,
                                                       &subregion_start,
                                                       &subregion_end))
            {
                    break;
            }
    
            // Do something useful with the subregion.
    
            gtk_source_region_iter_next (&region_iter);
    }
    ```
    ```python
    buffer: GtkSource.Buffer = GtkSource.Buffer()
    region: GtkSource.Region = GtkSource.Region(buffer=buffer)
    region_iter = region.get_start_region_iter()
    
    while not region_iter.is_end():
        success, start, end = region_iter.get_subregion()
        if not success:
            break
    
        # Do something useful with the subregion
    
        region_iter.next()
    ```
*/
struct GtkSourceRegion
{
  /** */
  GObject parentInstance;
}

/** */
struct GtkSourceRegionClass
{
  /** */
  GObjectClass parentClass;

  /** */
  void*[10] Reserved;
}

/**
    An opaque datatype.
    
    Ignore all its fields and initialize the iter with [gid.gtksource5.region.Region.getStartRegionIter].
*/
struct GtkSourceRegionIter
{
  /** */
  void* dummy1;

  /** */
  uint dummy2;

  /** */
  void* dummy3;
}

/**
    Search context.
    
    A [gid.gtksource5.search_context.SearchContext] is used for the search and replace in a
    [gid.gtksource5.buffer.Buffer]. The search settings are represented by a
    [gid.gtksource5.search_settings.SearchSettings] object. There can be a many-to-many relationship
    between buffers and search settings, with the search contexts in-between: a
    search settings object can be shared between several search contexts; and a
    buffer can contain several search contexts at the same time.
    
    The total number of search occurrences can be retrieved with
    [gid.gtksource5.search_context.SearchContext.getOccurrencesCount]. To know the position of a
    certain match, use [gid.gtksource5.search_context.SearchContext.getOccurrencePosition].
    
    The buffer is scanned asynchronously, so it doesn't block the user interface.
    For each search, the buffer is scanned at most once. After that, navigating
    through the occurrences doesn't require to re-scan the buffer entirely.
    
    To search forward, use [gid.gtksource5.search_context.SearchContext.forward] or
    [gid.gtksource5.search_context.SearchContext.forwardAsync] for the asynchronous version.
    The backward search is done similarly. To replace a search match, or all
    matches, use [gid.gtksource5.search_context.SearchContext.replace] and
    [gid.gtksource5.search_context.SearchContext.replaceAll].
    
    The search occurrences are highlighted by default. To disable it, use
    [gid.gtksource5.search_context.SearchContext.setHighlight]. You can enable the search
    highlighting for several [gid.gtksource5.search_context.SearchContext]s attached to the
    same buffer. Moreover, each of those [gid.gtksource5.search_context.SearchContext]s can
    have a different text style associated. Use
    [gid.gtksource5.search_context.SearchContext.setMatchStyle] to specify the [gid.gtksource5.style.Style]
    to apply on search matches.
    
    Note that the [gid.gtksource5.search_context.SearchContext.highlight] and
    [gid.gtksource5.search_context.SearchContext.matchStyle] properties are in the
    [gid.gtksource5.search_context.SearchContext] class, not [gid.gtksource5.search_settings.SearchSettings]. Appearance
    settings should be tied to one, and only one buffer, as different buffers can
    have different style scheme associated (a [gid.gtksource5.search_settings.SearchSettings] object
    can be bound indirectly to several buffers).
    
    The concept of "current match" doesn't exist yet. A way to highlight
    differently the current match is to select it.
    
    A search occurrence's position doesn't depend on the cursor position or other
    parameters. Take for instance the buffer "aaaa" with the search text "aa".
    The two occurrences are at positions [0:2] and [2:4]. If you begin to search
    at position 1, you will get the occurrence [2:4], not [1:3]. This is a
    prerequisite for regular expression searches. The pattern ".*" matches the
    entire line. If the cursor is at the middle of the line, you don't want the
    rest of the line as the occurrence, you want an entire line. (As a side note,
    regular expression searches can also match multiple lines.)
    
    In the GtkSourceView source code, there is an example of how to use the
    search and replace API: see the tests/test-search.c file. It is a mini
    application for the search and replace, with a basic user interface.
*/
struct GtkSourceSearchContext;

/** */
struct GtkSourceSearchContextClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Search settings.
    
    A [gid.gtksource5.search_settings.SearchSettings] object represents the settings of a search. The
    search settings can be associated with one or several
    [gid.gtksource5.search_context.SearchContext]s.
*/
struct GtkSourceSearchSettings
{
  /** */
  GObject parentInstance;
}

/** */
struct GtkSourceSearchSettingsClass
{
  /** */
  GObjectClass parentClass;

  /** */
  void*[10] Reserved;
}

/**
    Quick insertion code snippets.
    
    The [gid.gtksource5.snippet.Snippet] represents a series of chunks that can quickly be
    inserted into the [gid.gtksource5.view.View].
    
    Snippets are defined in XML files which are loaded by the
    [gid.gtksource5.snippet_manager.SnippetManager]. Alternatively, applications can create snippets
    on demand and insert them into the [gid.gtksource5.view.View] using
    [gid.gtksource5.view.View.pushSnippet].
    
    Snippet chunks can reference other snippet chunks as well as post-process
    the values from other chunks such as capitalization.
*/
struct GtkSourceSnippet;

/**
    A chunk of text within the source snippet.
    
    The [gid.gtksource5.snippet_chunk.SnippetChunk] represents a single chunk of text that
    may or may not be an edit point within the snippet. Chunks that are
    an edit point (also called a tab stop) have the
    [gid.gtksource5.snippet_chunk.SnippetChunk.focusPosition] property set.
*/
struct GtkSourceSnippetChunk;

/** */
struct GtkSourceSnippetChunkClass
{
  /** */
  GInitiallyUnownedClass parentClass;
}

/** */
struct GtkSourceSnippetClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Context for expanding [gid.gtksource5.snippet_chunk.SnippetChunk].
    
    This class is currently used primary as a hashtable. However, the longer
    term goal is to have it hold onto a `GjsContext` as well as other languages
    so that [gid.gtksource5.snippet_chunk.SnippetChunk] can expand themselves by executing
    script within the context.
    
    The [gid.gtksource5.snippet.Snippet] will build the context and then expand each of the
    chunks during the insertion/edit phase.
*/
struct GtkSourceSnippetContext;

/** */
struct GtkSourceSnippetContextClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Provides access to [gid.gtksource5.snippet.Snippet].
    
    [gid.gtksource5.snippet_manager.SnippetManager] is an object which processes snippet description
    files and creates [gid.gtksource5.snippet.Snippet] objects.
    
    Use [gid.gtksource5.snippet_manager.SnippetManager.getDefault] to retrieve the default
    instance of [gid.gtksource5.snippet_manager.SnippetManager].
    
    Use [gid.gtksource5.snippet_manager.SnippetManager.getSnippet] to retrieve snippets for
    a given snippets.
*/
struct GtkSourceSnippetManager;

/** */
struct GtkSourceSnippetManagerClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Represent white space characters with symbols.
    
    #GtkSourceSpaceDrawer provides a way to visualize white spaces, by drawing
    symbols.
    
    Call [gid.gtksource5.view.View.getSpaceDrawer] to get the [gid.gtksource5.space_drawer.SpaceDrawer]
    instance of a certain [gid.gtksource5.view.View].
    
    By default, no white spaces are drawn because the
    [gid.gtksource5.space_drawer.SpaceDrawer.enableMatrix] is false.
    
    To draw white spaces, [gid.gtksource5.space_drawer.SpaceDrawer.setTypesForLocations] can
    be called to set the [gid.gtksource5.space_drawer.SpaceDrawer.matrix] property (by default all
    space types are enabled at all locations). Then call
    [gid.gtksource5.space_drawer.SpaceDrawer.setEnableMatrix].
    
    For a finer-grained method, there is also the [gid.gtksource5.tag.Tag]'s
    [gid.gtksource5.tag.Tag.drawSpaces] property.
    
    # Example
    
    To draw non-breaking spaces everywhere and draw all types of trailing spaces
    except newlines:
    ```c
    gtk_source_space_drawer_set_types_for_locations (space_drawer,
                                                     GTK_SOURCE_SPACE_LOCATION_ALL,
                                                     GTK_SOURCE_SPACE_TYPE_NBSP);
    
    gtk_source_space_drawer_set_types_for_locations (space_drawer,
                                                     GTK_SOURCE_SPACE_LOCATION_TRAILING,
                                                     GTK_SOURCE_SPACE_TYPE_ALL &
                                                     ~GTK_SOURCE_SPACE_TYPE_NEWLINE);
    
    gtk_source_space_drawer_set_enable_matrix (space_drawer, TRUE);
    ```
    ```python
    space_drawer.set_types_for_locations(
        locations=GtkSource.SpaceLocationFlags.ALL,
        types=GtkSource.SpaceTypeFlags.NBSP,
    )
    
    all_types_except_newline = GtkSource.SpaceTypeFlags(
        int(GtkSource.SpaceTypeFlags.ALL) & ~int(GtkSource.SpaceTypeFlags.NEWLINE)
    )
    space_drawer.set_types_for_locations(
        locations=GtkSource.SpaceLocationFlags.TRAILING,
        types=all_types_except_newline,
    )
    
    space_drawer.set_enable_matrix(True)
    ```
    
    # Use-case: draw unwanted white spaces
    
    A possible use-case is to draw only unwanted white spaces. Examples:
    
    - Draw all trailing spaces.
    - If the indentation and alignment must be done with spaces, draw tabs.
    
    And non-breaking spaces can always be drawn, everywhere, to distinguish them
    from normal spaces.
*/
struct GtkSourceSpaceDrawer;

/** */
struct GtkSourceSpaceDrawerClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Represents a style.
    
    The [gid.gtksource5.style.Style] structure is used to describe text attributes
    which are set when given style is used.
*/
struct GtkSourceStyle;

/** */
struct GtkSourceStyleClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Controls the appearance of [gid.gtksource5.view.View].
    
    #GtkSourceStyleScheme contains all the text styles to be used in
    [gid.gtksource5.view.View] and [gid.gtksource5.buffer.Buffer]. For instance, it contains text styles
    for syntax highlighting, it may contain foreground and background color for
    non-highlighted text, color for the line numbers, current line highlighting,
    bracket matching, etc.
    
    Style schemes are stored in XML files. The format of a scheme file is
    documented in the [style scheme reference](./style-reference.html).
    
    The two style schemes with IDs "classic" and "tango" follow more closely the
    GTK theme (for example for the background color).
*/
struct GtkSourceStyleScheme;

/**
    Interface implemented by widgets for choosing style schemes.
    
    [gid.gtksource5.style_scheme_chooser.StyleSchemeChooser] is an interface that is implemented by widgets
    for choosing style schemes.
    
    In GtkSourceView, the main widgets that implement this interface are
    [gid.gtksource5.style_scheme_chooser_widget.StyleSchemeChooserWidget] and [gid.gtksource5.style_scheme_chooser_button.StyleSchemeChooserButton].
*/
struct GtkSourceStyleSchemeChooser;

/**
    A button to launch a style scheme selection dialog.
    
    The [gid.gtksource5.style_scheme_chooser_button.StyleSchemeChooserButton] is a button which displays
    the currently selected style scheme and allows to open a style scheme
    selection dialog to change the style scheme.
    It is suitable widget for selecting a style scheme in a preference dialog.
    
    In [gid.gtksource5.style_scheme_chooser_button.StyleSchemeChooserButton], a [gid.gtksource5.style_scheme_chooser_widget.StyleSchemeChooserWidget]
    is used to provide a dialog for selecting style schemes.
*/
struct GtkSourceStyleSchemeChooserButton
{
  /** */
  GtkButton parentInstance;
}

/** */
struct GtkSourceStyleSchemeChooserButtonClass
{
  /** */
  GtkButtonClass parent;

  /** */
  void*[10] Reserved;
}

/** */
struct GtkSourceStyleSchemeChooserInterface
{
  /** */
  GTypeInterface baseInterface;

  /** */
  extern(C) GtkSourceStyleScheme* function(GtkSourceStyleSchemeChooser* chooser) getStyleScheme;

  /** */
  extern(C) void function(GtkSourceStyleSchemeChooser* chooser, GtkSourceStyleScheme* scheme) setStyleScheme;

  /** */
  void*[12] Reserved;
}

/**
    A widget for choosing style schemes.
    
    The [gid.gtksource5.style_scheme_chooser_widget.StyleSchemeChooserWidget] widget lets the user select a
    style scheme. By default, the chooser presents a predefined list
    of style schemes.
    
    To change the initially selected style scheme,
    use [gid.gtksource5.style_scheme_chooser.StyleSchemeChooser.setStyleScheme].
    To get the selected style scheme
    use [gid.gtksource5.style_scheme_chooser.StyleSchemeChooser.getStyleScheme].
*/
struct GtkSourceStyleSchemeChooserWidget
{
  /** */
  GtkWidget parentInstance;
}

/** */
struct GtkSourceStyleSchemeChooserWidgetClass
{
  /** */
  GtkWidgetClass parent;

  /** */
  void*[10] Reserved;
}

/** */
struct GtkSourceStyleSchemeClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Provides access to [gid.gtksource5.style_scheme.StyleScheme]s.
*/
struct GtkSourceStyleSchemeManager;

/** */
struct GtkSourceStyleSchemeManagerClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A preview widget for [gid.gtksource5.style_scheme.StyleScheme].
    
    This widget provides a convenient [gid.gtk4.widget.Widget] to preview a [gid.gtksource5.style_scheme.StyleScheme].
    
    The [gid.gtksource5.style_scheme_preview.StyleSchemePreview.selected] property can be used to manage
    the selection state of a single preview widget.
*/
struct GtkSourceStyleSchemePreview;

/** */
struct GtkSourceStyleSchemePreviewClass
{
  /** */
  GtkWidgetClass parentClass;
}

/**
    A tag that can be applied to text in a [gid.gtksource5.buffer.Buffer].
    
    [gid.gtksource5.tag.Tag] is a subclass of [gid.gtk4.text_tag.TextTag] that adds properties useful for
    the GtkSourceView library.
    
    If, for a certain tag, [gid.gtk4.text_tag.TextTag] is sufficient, it's better that you create
    a [gid.gtk4.text_tag.TextTag], not a [gid.gtksource5.tag.Tag].
*/
struct GtkSourceTag
{
  /** */
  GtkTextTag parentInstance;
}

/** */
struct GtkSourceTagClass
{
  /** */
  GtkTextTagClass parentClass;

  /** */
  void*[10] Reserved;
}

/**
    Subclass of [gid.gtk4.text_view.TextView].
    
    [gid.gtksource5.view.View] is the main class of the GtkSourceView library.
    Use a [gid.gtksource5.buffer.Buffer] to display text with a [gid.gtksource5.view.View].
    
    This class provides:
    
     - Show the line numbers;
     - Show a right margin;
     - Highlight the current line;
     - Indentation settings;
     - Configuration for the Home and End keyboard keys;
     - Configure and show line marks;
     - And a few other things.
    
    An easy way to test all these features is to use the test-widget mini-program
    provided in the GtkSourceView repository, in the tests/ directory.
    
    # GtkSourceView as GtkBuildable
    
    The GtkSourceView implementation of the [gid.gtk4.buildable.Buildable] interface exposes the
    [gid.gtksource5.view.View.completion] object with the internal-child "completion".
    
    An example of a UI definition fragment with GtkSourceView:
    ```xml
    <object class="GtkSourceView" id="source_view">
      <property name="tab-width">4</property>
      <property name="auto-indent">True</property>
      <child internal-child="completion">
        <object class="GtkSourceCompletion">
          <property name="select-on-show">False</property>
        </object>
      </child>
    </object>
    ```
    
    # Changing the Font
    
    Gtk CSS provides the best way to change the font for a [gid.gtksource5.view.View] in a
    manner that allows for components like [gid.gtksource5.map.Map] to scale the desired
    font.
    
    ```c
    GtkCssProvider *provider = gtk_css_provider_new ();
    gtk_css_provider_load_from_string (provider,
                                      "textview { font-family: Monospace; font-size: 8pt; }");
    gtk_style_context_add_provider (gtk_widget_get_style_context (view),
                                    GTK_STYLE_PROVIDER (provider),
                                    GTK_STYLE_PROVIDER_PRIORITY_APPLICATION);
    g_object_unref (provider);
    ```
    ```python
    provider = Gtk.CssProvider()
    provider.load_from_string("textview { font-family: Monospace; font-size: 8pt; }")
    style_context = view.get_style_context()
    style_context.add_provider(provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)
    ```
    
    If you need to adjust the font or size of font within a portion of the
    document only, you should use a [gid.gtk4.text_tag.TextTag] with the [gid.gtk4.text_tag.TextTag.family] or
    [gid.gtk4.text_tag.TextTag.scale] set so that the font size may be scaled relative to
    the default font set in CSS.
*/
struct GtkSourceView
{
  /** */
  GtkTextView parentInstance;
}

/** */
struct GtkSourceViewClass
{
  /** */
  GtkTextViewClass parentClass;

  /** */
  extern(C) void function(GtkSourceView* view, const(GtkTextIter)* iter, uint button, GdkModifierType state, int nPresses) lineMarkActivated;

  /** */
  extern(C) void function(GtkSourceView* view) showCompletion;

  /** */
  extern(C) void function(GtkSourceView* view, gboolean down) moveLines;

  /** */
  extern(C) void function(GtkSourceView* view, int step) moveWords;

  /** */
  extern(C) void function(GtkSourceView* view, GtkSourceSnippet* snippet, GtkTextIter* location) pushSnippet;

  /** */
  void*[20] Reserved;
}

/**
    Vim emulation.
    
    The [gid.gtksource5.vim_imcontext.VimIMContext] is a [gid.gtk4.imcontext.IMContext] implementation that can
    be used to provide Vim-like editing controls within a [gid.gtksource5.view.View].
    
    The `GtkSourceViMIMContext` will process incoming [gid.gdk4.key_event.KeyEvent] as the
    user types. It should be used in conjunction with a [gid.gtk4.event_controller_key.EventControllerKey].
    
    Various features supported by [gid.gtksource5.vim_imcontext.VimIMContext] include:
    
     - Normal, Insert, Replace, Visual, and Visual Line modes
     - Support for an integrated command bar and current command preview
     - Search and replace
     - Motions and Text Objects
     - History replay
     - Jumplists within the current file
     - Registers including the system and primary clipboards
     - Creation and motion to marks
     - Some commonly used Vim commands
    
    It is recommended that applications display the contents of
    [gid.gtksource5.vim_imcontext.VimIMContext.commandBarText] and
    [gid.gtksource5.vim_imcontext.VimIMContext.commandText] to the user as they represent the
    command-bar and current command preview found in Vim.
    
    [gid.gtksource5.vim_imcontext.VimIMContext] attempts to work with additional [gid.gtk4.imcontext.IMContext]
    implementations such as IBus by querying the [gid.gtk4.text_view.TextView] before processing
    the command in states which support it (notably Insert and Replace modes).
    
    ```c
    GtkEventController *key;
    GtkIMContext *im_context;
    GtkWidget *view;
    
    view = gtk_source_view_new ();
    im_context = gtk_source_vim_im_context_new ();
    key = gtk_event_controller_key_new ();
    
    gtk_event_controller_key_set_im_context (GTK_EVENT_CONTROLLER_KEY (key), im_context);
    gtk_event_controller_set_propagation_phase (key, GTK_PHASE_CAPTURE);
    gtk_widget_add_controller (view, key);
    gtk_im_context_set_client_widget (im_context, view);
    
    g_object_bind_property (im_context, "command-bar-text", command_bar_label, "label", 0);
    g_object_bind_property (im_context, "command-text", command_label, "label", 0);
    ```
    ```python
    key = Gtk.EventControllerKey.new()
    im_context = GtkSource.VimIMContext.new()
    buffer = GtkSource.Buffer()
    view = GtkSource.View.new_with_buffer(buffer)
    
    key.set_im_context(im_context)
    key.set_propagation_phase(Gtk.PropagationPhase.CAPTURE)
    view.add_controller(key)
    im_context.set_client_widget(view)
    
    im_context.bind_property(
        source_property="command-text",
        target=command_label,
        target_property="label",
        flags=GObject.BindingFlags.DEFAULT,
    )
    
    im_context.bind_property(
        source_property="command-bar-text",
        target=command_bar_label,
        target_property="label",
        flags=GObject.BindingFlags.DEFAULT,
    )
    ```
*/
struct GtkSourceVimIMContext;

/** */
struct GtkSourceVimIMContextClass
{
  /** */
  GtkIMContextClass parentClass;
}

alias extern(C) GMountOperation* function(GtkSourceFile* file, void* userdata) GtkSourceMountOperationFactory;

alias extern(C) gboolean function(long deadline, void* userData) GtkSourceSchedulerCallback;

