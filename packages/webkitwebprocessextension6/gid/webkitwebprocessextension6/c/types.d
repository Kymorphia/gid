/// C types for webkitwebprocessextension6 library
module gid.webkitwebprocessextension6.c.types;

public import gid.core.basictypes;
public import gid.gtk4.c.types;
public import gid.javascriptcore6.c.types;
public import gid.soup3.c.types;

/**
    Enum values used to denote the various levels of console messages.
*/
enum WebKitConsoleMessageLevel
{
  /**
      Information message.
  */
  Info = 0,

  /**
      Log message.
  */
  Log = 1,

  /**
      Warning message.
  */
  Warning = 2,

  /**
      Error message.
  */
  Error = 3,

  /**
      Debug message.
  */
  Debug = 4,
}

/**
    Enum values used to denote the various sources of console messages.
*/
enum WebKitConsoleMessageSource
{
  /**
      Message produced by JavaScript.
  */
  Javascript = 0,

  /**
      Network messages.
  */
  Network = 1,

  /**
      Messages produced by console API.
  */
  ConsoleApi = 2,

  /**
      Security messages.
  */
  Security = 3,

  /**
      Other messages.
  */
  Other = 4,
}

/**
    Enum values used to denote the stock actions for
    #WebKitContextMenuItem<!-- -->s
*/
enum WebKitContextMenuAction
{
  /**
      No action, used by separator menu items.
  */
  NoAction = 0,

  /**
      Open current link.
  */
  OpenLink = 1,

  /**
      Open current link in a new window.
  */
  OpenLinkInNewWindow = 2,

  /**
      Download link destination.
  */
  DownloadLinkToDisk = 3,

  /**
      Copy link location to the clipboard.
  */
  CopyLinkToClipboard = 4,

  /**
      Open current image in a new window.
  */
  OpenImageInNewWindow = 5,

  /**
      Download current image.
  */
  DownloadImageToDisk = 6,

  /**
      Copy current image to the clipboard.
  */
  CopyImageToClipboard = 7,

  /**
      Copy current image location to the clipboard.
  */
  CopyImageUrlToClipboard = 8,

  /**
      Open current frame in a new window.
  */
  OpenFrameInNewWindow = 9,

  /**
      Load the previous history item.
  */
  GoBack = 10,

  /**
      Load the next history item.
  */
  GoForward = 11,

  /**
      Stop any ongoing loading operation.
  */
  Stop = 12,

  /**
      Reload the contents of current view.
  */
  Reload = 13,

  /**
      Copy current selection the clipboard.
  */
  Copy = 14,

  /**
      Cut current selection to the clipboard.
  */
  Cut = 15,

  /**
      Paste clipboard contents.
  */
  Paste = 16,

  /**
      Delete current selection.
  */
  Delete = 17,

  /**
      Select all text.
  */
  SelectAll = 18,

  /**
      Input methods menu.
  */
  InputMethods = 19,

  /**
      Unicode menu.
  */
  Unicode = 20,

  /**
      A proposed replacement for a misspelled word.
  */
  SpellingGuess = 21,

  /**
      An indicator that spellchecking found no proposed replacements.
  */
  NoGuessesFound = 22,

  /**
      Causes the spellchecker to ignore the word for this session.
  */
  IgnoreSpelling = 23,

  /**
      Causes the spellchecker to add the word to the dictionary.
  */
  LearnSpelling = 24,

  /**
      Ignore grammar.
  */
  IgnoreGrammar = 25,

  /**
      Font options menu.
  */
  FontMenu = 26,

  /**
      Bold.
  */
  Bold = 27,

  /**
      Italic.
  */
  Italic = 28,

  /**
      Underline.
  */
  Underline = 29,

  /**
      Outline.
  */
  Outline = 30,

  /**
      Open current element in the inspector.
  */
  InspectElement = 31,

  /**
      Open current video element in a new window.
  */
  OpenVideoInNewWindow = 32,

  /**
      Open current audio element in a new window.
  */
  OpenAudioInNewWindow = 33,

  /**
      Copy video link location in to the clipboard.
  */
  CopyVideoLinkToClipboard = 34,

  /**
      Copy audio link location in to the clipboard.
  */
  CopyAudioLinkToClipboard = 35,

  /**
      Enable or disable media controls.
  */
  ToggleMediaControls = 36,

  /**
      Enable or disable media loop.
  */
  ToggleMediaLoop = 37,

  /**
      Show current video element in fullscreen mode.
  */
  EnterVideoFullscreen = 38,

  /**
      Play current media element.
  */
  MediaPlay = 39,

  /**
      Pause current media element.
  */
  MediaPause = 40,

  /**
      Mute current media element.
  */
  MediaMute = 41,

  /**
      Download video to disk. Since 2.2
  */
  DownloadVideoToDisk = 42,

  /**
      Download audio to disk. Since 2.2
  */
  DownloadAudioToDisk = 43,

  /**
      Insert an emoji. Since 2.26
  */
  InsertEmoji = 44,

  /**
      Paste clipboard contents as plain text. Since 2.30
  */
  PasteAsPlainText = 45,

  /**
      Custom action defined by applications.
  */
  Custom = 10000,
}

/**
    Enum values with flags representing the context of a #WebKitHitTestResult.
*/
enum WebKitHitTestResultContext : uint
{
  /**
      anywhere in the document.
  */
  Document = 2,

  /**
      a hyperlink element.
  */
  Link = 4,

  /**
      an image element.
  */
  Image = 8,

  /**
      a video or audio element.
  */
  Media = 16,

  /**
      an editable element
  */
  Editable = 32,

  /**
      a scrollbar element.
  */
  Scrollbar = 64,

  /**
      a selected element. Since 2.8
  */
  Selection = 128,
}

/**
    Enum values used to denote errors happening when sending user messages.
*/
enum WebKitUserMessageError
{
  /**
      The message was not handled by the receiver.
  */
  UserMessageUnhandledMessage = 0,
}

/** */
struct WebKitConsoleMessage;

/**
    Represents the context menu in a #WebKitWebView.
    
    #WebKitContextMenu represents a context menu containing
    #WebKitContextMenuItem<!-- -->s in a #WebKitWebView.
    
    When a #WebKitWebView is about to display the context menu, it
    emits the #WebKitWebView::context-menu signal, which has the
    #WebKitContextMenu as an argument. You can modify it, adding new
    submenus that you can create with [gid.webkitwebprocessextension6.context_menu.ContextMenu.new_], adding
    new #WebKitContextMenuItem<!-- -->s with
    [gid.webkitwebprocessextension6.context_menu.ContextMenu.prepend], [gid.webkitwebprocessextension6.context_menu.ContextMenu.append] or
    [gid.webkitwebprocessextension6.context_menu.ContextMenu.insert], maybe after having removed the
    existing ones with [gid.webkitwebprocessextension6.context_menu.ContextMenu.removeAll].
*/
struct WebKitContextMenu;

/** */
struct WebKitContextMenuClass
{
  /** */
  GObjectClass parentClass;
}

/**
    One item of a #WebKitContextMenu.
    
    The #WebKitContextMenu is composed of #WebKitContextMenuItem<!--
    -->s. These items can be created from a #GtkAction, from a
    #WebKitContextMenuAction or from a #WebKitContextMenuAction and a
    label. These #WebKitContextMenuAction<!-- -->s denote stock actions
    for the items. You can also create separators and submenus.
*/
struct WebKitContextMenuItem;

/** */
struct WebKitContextMenuItemClass
{
  /** */
  GInitiallyUnownedClass parentClass;
}

/**
    A web page frame.
    
    Each [gid.webkitwebprocessextension6.web_page.WebPage] has at least one main frame, and can have any number
    of subframes.
*/
struct WebKitFrame;

/** */
struct WebKitFrameClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Result of a Hit Test.
    
    A Hit Test is an operation to get context information about a given
    point in a #WebKitWebView. #WebKitHitTestResult represents the
    result of a Hit Test. It provides context information about what is
    at the coordinates of the Hit Test, such as if there's a link,
    an image or a media.
    
    You can get the context of the HitTestResult with
    [gid.webkitwebprocessextension6.hit_test_result.HitTestResult.getContext] that returns a bitmask of
    #WebKitHitTestResultContext flags. You can also use
    [gid.webkitwebprocessextension6.hit_test_result.HitTestResult.contextIsLink], [gid.webkitwebprocessextension6.hit_test_result.HitTestResult.contextIsImage] and
    [gid.webkitwebprocessextension6.hit_test_result.HitTestResult.contextIsMedia] to determine whether there's
    a link, image or a media element at the coordinates of the Hit Test.
    Note that it's possible that several #WebKitHitTestResultContext flags
    are active at the same time, for example if there's a link containing an image.
    
    When the mouse is moved over a #WebKitWebView a Hit Test is performed
    for the mouse coordinates and #WebKitWebView::mouse-target-changed
    signal is emitted with a #WebKitHitTestResult.
*/
struct WebKitHitTestResult;

/** */
struct WebKitHitTestResultClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct WebKitScriptWorld;

/** */
struct WebKitScriptWorldClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Represents a URI request.
    
    A #WebKitURIRequest can be created with a URI using the
    [gid.webkitwebprocessextension6.urirequest.URIRequest.new_] method, and you can get the URI of an
    existing request with the [gid.webkitwebprocessextension6.urirequest.URIRequest.getUri] one.
*/
struct WebKitURIRequest;

/** */
struct WebKitURIRequestClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Represents an URI response.
    
    A #WebKitURIResponse contains information such as the URI, the
    status code, the content length, the mime type, the HTTP status or
    the suggested filename.
*/
struct WebKitURIResponse;

/** */
struct WebKitURIResponseClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Message that can be sent between the UI process and web process extensions.
    
    A WebKitUserMessage is a message that can be used for the communication between the UI process
    and web process extensions. A WebKitUserMessage always has a name, and it can also include parameters and
    UNIX file descriptors. Messages can be sent from a #WebKitWebContext to all web process extensions,
    from a web process extension to its corresponding #WebKitWebContext, and from a #WebKitWebView to its
    corresponding #WebKitWebPage (and vice versa). One to one messages can be replied to directly with
    [gid.webkitwebprocessextension6.user_message.UserMessage.sendReply].
*/
struct WebKitUserMessage;

/** */
struct WebKitUserMessageClass
{
  /** */
  GInitiallyUnownedClass parentClass;
}

/**
    Access to editing capabilities of a #WebKitWebPage.
    
    The WebKitWebEditor provides access to various editing capabilities of
    a #WebKitWebPage such as a possibility to react to the current selection in
    #WebKitWebPage.
*/
struct WebKitWebEditor;

/** */
struct WebKitWebEditorClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Form manager of a #WebKitWebPage in a #WebKitScriptWorld
*/
struct WebKitWebFormManager
{
  /** */
  GObject parent;
}

/** */
struct WebKitWebFormManagerClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Result of a Hit Test (Web Process Extensions).
    
    WebKitWebHitTestResult extends #WebKitHitTestResult to provide information
    about the #WebKitDOMNode in the coordinates of the Hit Test.
*/
struct WebKitWebHitTestResult;

/** */
struct WebKitWebHitTestResultClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A loaded web page.
*/
struct WebKitWebPage;

/** */
struct WebKitWebPageClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Represents an extension of the web process.
    
    WebKitWebProcessExtension is a loadable module for the web process. It allows you to execute code in the
    web process and being able to use the DOM API, to change any request or to inject custom
    JavaScript code, for example.
    
    To create a WebKitWebProcessExtension you should write a module with an initialization function that could
    be either webkit_web_process_extension_initialize() with prototype #WebKitWebProcessExtensionInitializeFunction or
    webkit_web_process_extension_initialize_with_user_data() with prototype #WebKitWebProcessExtensionInitializeWithUserDataFunction.
    This function has to be public and it has to use the #G_MODULE_EXPORT macro. It is called when the
    web process is initialized.
    
    ```c
    static void
    web_page_created_callback (WebKitWebProcessExtension *extension,
                               WebKitWebPage             *web_page,
                               gpointer                   user_data)
    {
        g_print ("Page %d created for %s\n",
                 webkit_web_page_get_id (web_page),
                 webkit_web_page_get_uri (web_page));
    }
    
    G_MODULE_EXPORT void
    webkit_web_process_extension_initialize (WebKitWebProcessExtension *extension)
    {
        g_signal_connect (extension, "page-created",
                          G_CALLBACK (web_page_created_callback),
                          NULL);
    }
    ```
    
    The previous piece of code shows a trivial example of an extension that notifies when
    a #WebKitWebPage is created.
    
    WebKit has to know where it can find the created WebKitWebProcessExtension. To do so you
    should use the webkit_web_context_set_web_extensions_directory() function. The signal
    #WebKitWebContext::initialize-web-extensions is the recommended place to call it.
    
    To provide the initialization data used by the webkit_web_process_extension_initialize_with_user_data()
    function, you have to call webkit_web_context_set_web_extensions_initialization_user_data() with
    the desired data as parameter. You can see an example of this in the following piece of code:
    
    ```c
    #define WEB_EXTENSIONS_DIRECTORY // ...
    
    static void
    initialize_web_extensions (WebKitWebContext *context,
                               gpointer          user_data)
    {
      // Web Extensions get a different ID for each Web Process
      static guint32 unique_id = 0;
    
      webkit_web_context_set_web_extensions_directory (
         context, WEB_EXTENSIONS_DIRECTORY);
      webkit_web_context_set_web_extensions_initialization_user_data (
         context, g_variant_new_uint32 (unique_id++));
    }
    
    int main (int argc, char **argv)
    {
      g_signal_connect (webkit_web_context_get_default (),
                       "initialize-web-extensions",
                        G_CALLBACK (initialize_web_extensions),
                        NULL);
    
      GtkWidget *view = webkit_web_view_new ();
    
      // ...
    }
    ```
*/
struct WebKitWebProcessExtension;

/** */
struct WebKitWebProcessExtensionClass
{
  /** */
  GObjectClass parentClass;
}

alias extern(C) void function(WebKitWebProcessExtension* extension) WebKitWebProcessExtensionInitializeFunction;

alias extern(C) void function(WebKitWebProcessExtension* extension, const(GVariant)* userData) WebKitWebProcessExtensionInitializeWithUserDataFunction;

