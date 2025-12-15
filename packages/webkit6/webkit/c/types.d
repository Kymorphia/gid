/// C types for webkit6 library
module webkit.c.types;

public import gid.basictypes;
public import gtk.c.types;
public import javascriptcore.c.types;
public import soup.c.types;

/**
    Enum values representing the authentication scheme.
*/
enum WebKitAuthenticationScheme
{
  /**
      The default authentication scheme of WebKit.
  */
  Default = 1,

  /**
      Basic authentication scheme as defined in RFC 2617.
  */
  HttpBasic = 2,

  /**
      Digest authentication scheme as defined in RFC 2617.
  */
  HttpDigest = 3,

  /**
      HTML Form authentication.
  */
  HtmlForm = 4,

  /**
      NTLM Microsoft proprietary authentication scheme.
  */
  Ntlm = 5,

  /**
      Negotiate (or SPNEGO) authentication scheme as defined in RFC 4559.
  */
  Negotiate = 6,

  /**
      Client Certificate Authentication (see RFC 2246).
  */
  ClientCertificateRequested = 7,

  /**
      Server Trust Authentication.
  */
  ServerTrustEvaluationRequested = 8,

  /**
      Client certificate PIN required for use. Since: 2.34
  */
  ClientCertificatePinRequested = 9,

  /**
      Authentication scheme unknown.
  */
  Unknown = 100,
}

/**
    Enum values used for determining the automation browsing context presentation.
*/
enum WebKitAutomationBrowsingContextPresentation
{
  /**
      a window
  */
  Window = 0,

  /**
      a tab
  */
  Tab = 1,
}

/**
    Enum values used to specify autoplay policies.
*/
enum WebKitAutoplayPolicy
{
  /**
      Do not restrict autoplay.
  */
  Allow = 0,

  /**
      Allow videos to autoplay if
          they have no audio track, or if their audio track is muted.
  */
  AllowWithoutSound = 1,

  /**
      Never allow autoplay.
  */
  Deny = 2,
}

/**
    Enum values used for determining the #WebKitWebContext cache model.
*/
enum WebKitCacheModel
{
  /**
      Disable the cache completely, which
        substantially reduces memory usage. Useful for applications that only
        access a single local file, with no navigation to other pages. No remote
        resources will be cached.
  */
  DocumentViewer = 0,

  /**
      Improve document load speed substantially
        by caching a very large number of resources and previously viewed content.
  */
  WebBrowser = 1,

  /**
      A cache model optimized for viewing
        a series of local files -- for example, a documentation viewer or a website
        designer. WebKit will cache a moderate number of resources.
  */
  DocumentBrowser = 2,
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
    Enum values used to denote the cookie acceptance policies.
*/
enum WebKitCookieAcceptPolicy
{
  /**
      Accept all cookies unconditionally.
  */
  Always = 0,

  /**
      Reject all cookies unconditionally.
  */
  Never = 1,

  /**
      Accept only cookies set by the main document loaded.
  */
  NoThirdParty = 2,
}

/**
    Enum values used to denote the cookie persistent storage types.
*/
enum WebKitCookiePersistentStorage
{
  /**
      Cookies are stored in a text
       file in the Mozilla "cookies.txt" format.
  */
  Text = 0,

  /**
      Cookies are stored in a SQLite
       file in the current Mozilla format.
  */
  Sqlite = 1,
}

/**
    Enum values representing the duration for which a credential persists.
*/
enum WebKitCredentialPersistence
{
  /**
      Credential does not persist
  */
  None = 0,

  /**
      Credential persists for session only
  */
  ForSession = 1,

  /**
      Credential persists permanently
  */
  Permanent = 2,
}

/**
    Enum values used to denote the various download errors.
*/
enum WebKitDownloadError
{
  /**
      Download failure due to network error
  */
  Network = 499,

  /**
      Download was cancelled by user
  */
  CancelledByUser = 400,

  /**
      Download failure due to destination error
  */
  Destination = 401,
}

/**
    Enum values with flags representing typing attributes.
*/
enum WebKitEditorTypingAttributes : uint
{
  /**
      No typing attributes.
  */
  None = 2,

  /**
      Bold typing attribute.
  */
  Bold = 4,

  /**
      Italic typing attribute.
  */
  Italic = 8,

  /**
      Underline typing attribute.
  */
  Underline = 16,

  /**
      Strikethrough typing attribute.
  */
  Strikethrough = 32,
}

/**
    Enum values used to denote the various errors related to the #WebKitFaviconDatabase.
*/
enum WebKitFaviconDatabaseError
{
  /**
      The #WebKitFaviconDatabase is closed
  */
  NotInitialized = 0,

  /**
      There is not an icon available for the requested URL
  */
  FaviconNotFound = 1,

  /**
      There might be an icon for the requested URL, but its data is unknown at the moment
  */
  FaviconUnknown = 2,
}

/**
    Describes the status of a `struct@WebKitFeature`.
    
    The status for a given feature can be obtained with
    `id@webkit_feature_get_status`.
*/
enum WebKitFeatureStatus
{
  /**
      Feature that adjust behaviour for
        specific application needs. The feature is not part of a Web platform
        feature, not a mature feature intended to be always on.
  */
  Embedder = 0,

  /**
      Feature in development. The feature
        may be unfinished, and there are no guarantees about its safety and
        stability.
  */
  Unstable = 1,

  /**
      Feature for debugging the WebKit engine.
        The feature is not generally useful for user or web developers, and
        always disabled by default.
  */
  Internal = 2,

  /**
      Feature for web developers. The feature
        is not generally useful for end users, and always disabled by default.
  */
  Developer = 3,

  /**
      Feature in active development and
        complete enough for testing. The feature may not be yet ready to
        ship and is disabled by default.
  */
  Testable = 4,

  /**
      Feature ready to be tested by users.
        The feature is disabled by default, but may be enabled by applications
        automatically e.g. in their “technology preview” or “beta” versions.
  */
  Preview = 5,

  /**
      Feature ready for general use. The
        feature is enabled by default, but it may still be toggled to support
        debugging and testing.
  */
  Stable = 6,

  /**
      Feature in general use. The feature is
        always enabled and in general there should be no user-facing interface
        to toggle it.
  */
  Mature = 7,
}

/**
    Enum values used to specify search options.
*/
enum WebKitFindOptions : uint
{
  /**
      no search flags, this means a case
        sensitive, no wrap, forward only search.
  */
  None = 0,

  /**
      case insensitive search.
  */
  CaseInsensitive = 1,

  /**
      search text only at the
        begining of the words.
  */
  AtWordStarts = 2,

  /**
      treat
        capital letters in the middle of words as word start.
  */
  TreatMedialCapitalAsWordStart = 4,

  /**
      search backwards.
  */
  Backwards = 8,

  /**
      if not present search will stop
        at the end of the document.
  */
  WrapAround = 16,
}

/**
    Enum values used for determining the hardware acceleration policy.
*/
enum WebKitHardwareAccelerationPolicy
{
  /**
      Hardware acceleration is always enabled, even for websites not requesting it.
  */
  Always = 0,

  /**
      Hardware acceleration is always disabled, even for websites requesting it.
  */
  Never = 1,
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
    Enum values used to describe hints that might be taken into account by input methods.
*/
enum WebKitInputHints : uint
{
  /**
      No special behavior suggested
  */
  None = 0,

  /**
      Suggest spell checking
  */
  Spellcheck = 1,

  /**
      Suggest to not autocapitlize
  */
  Lowercase = 2,

  /**
      Suggest to capitalize all text
  */
  UppercaseChars = 4,

  /**
      Suggest to capitalize the first character of each word
  */
  UppercaseWords = 8,

  /**
      Suggest to capitalize the first word of each sentence
  */
  UppercaseSentences = 16,

  /**
      Suggest to not show an onscreen keyboard
  */
  InhibitOsk = 32,
}

/**
    Enum values used to describe the primary purpose of the active editable element.
*/
enum WebKitInputPurpose
{
  /**
      Editable element expects any characters
  */
  FreeForm = 0,

  /**
      Editable element expects digits
  */
  Digits = 1,

  /**
      Editable element expects a number
  */
  Number = 2,

  /**
      Editable element expects a telephone
  */
  Phone = 3,

  /**
      Editable element expects a URL
  */
  Url = 4,

  /**
      Editable element expects an email
  */
  Email = 5,

  /**
      Editable element expects a password
  */
  Password = 6,
}

/**
    Enum values previously used to denote the different events which can trigger
    the detection of insecure content. Since 2.46, WebKit generally no longer
    loads insecure content in secure contexts.
*/
enum WebKitInsecureContentEvent
{
  /**
      Insecure content has been detected by
      trying to execute any kind of logic (e.g. a script) from an
      untrusted source.
  */
  Run = 0,

  /**
      Insecure content has been
      detected by trying to display any kind of resource (e.g. an image)
      from an untrusted source.
  */
  Displayed = 1,
}

/**
    Enum values used to denote errors happening when executing JavaScript
*/
enum WebKitJavascriptError
{
  /**
      An exception was raised in JavaScript execution
  */
  ScriptFailed = 699,

  /**
      An unsupported parameter has been used to call and async function from API. Since 2.40
  */
  InvalidParameter = 600,

  /**
      The result of JavaScript execution could not be returned. Since 2.40
  */
  InvalidResult = 601,
}

/**
    Enum values used to denote the different events that happen during a
    #WebKitWebView load operation.
*/
enum WebKitLoadEvent
{
  /**
      A new load request has been made.
      No data has been received yet, empty structures have
      been allocated to perform the load; the load may still
      fail due to transport issues such as not being able to
      resolve a name, or connect to a port.
  */
  Started = 0,

  /**
      A provisional data source received
      a server redirect.
  */
  Redirected = 1,

  /**
      The content started arriving for a page load.
      The necessary transport requirements are established, and the
      load is being performed.
  */
  Committed = 2,

  /**
      Load completed. All resources are done loading
      or there was an error during the load operation.
  */
  Finished = 3,
}

/**
    Enum values used to specify the capture state of a media device.
*/
enum WebKitMediaCaptureState
{
  /**
      Media capture is disabled.
  */
  None = 0,

  /**
      Media capture is active.
  */
  Active = 1,

  /**
      Media capture is muted.
  */
  Muted = 2,
}

/**
    Enum values used to denote the various media errors.
*/
enum WebKitMediaError
{
  /**
      Preliminary load failure for media content types. A new load will be started to perform the media load. Since: 2.40
  */
  Load = 204,
}

/**
    Enum values used to denote the various navigation types.
*/
enum WebKitNavigationType
{
  /**
      The navigation was triggered by clicking a link.
  */
  LinkClicked = 0,

  /**
      The navigation was triggered by submitting a form.
  */
  FormSubmitted = 1,

  /**
      The navigation was triggered by navigating forward or backward.
  */
  BackForward = 2,

  /**
      The navigation was triggered by reloading.
  */
  Reload = 3,

  /**
      The navigation was triggered by resubmitting a form.
  */
  FormResubmitted = 4,

  /**
      The navigation was triggered by some other action.
  */
  Other = 5,
}

/**
    Enum values used to denote the various network errors.
*/
enum WebKitNetworkError
{
  /**
      Generic load failure
  */
  Failed = 399,

  /**
      Load failure due to transport error
  */
  Transport = 300,

  /**
      Load failure due to unknown protocol
  */
  UnknownProtocol = 301,

  /**
      Load failure due to cancellation
  */
  Cancelled = 302,

  /**
      Load failure due to missing file
  */
  FileDoesNotExist = 303,
}

/**
    Enum values used to set the network proxy mode.
*/
enum WebKitNetworkProxyMode
{
  /**
      Use the default proxy of the system.
  */
  Default = 0,

  /**
      Do not use any proxy.
  */
  NoProxy = 1,

  /**
      Use custom proxy settings.
  */
  Custom = 2,
}

/**
    Enum values representing query permission results.
*/
enum WebKitPermissionState
{
  /**
      Access to the feature is granted.
  */
  Granted = 0,

  /**
      Access to the feature is denied.
  */
  Denied = 1,

  /**
      Access to the feature has to be requested via user prompt.
  */
  Prompt = 2,
}

/**
    Enum values used for determining the type of a policy decision during
    #WebKitWebView::decide-policy.
*/
enum WebKitPolicyDecisionType
{
  /**
      This type of policy decision
        is requested when WebKit is about to navigate to a new page in either the
        main frame or a subframe. Acceptable policy decisions are either
        [webkit.policy_decision.PolicyDecision.use] or [webkit.policy_decision.PolicyDecision.ignore]. This
        type of policy decision is always a #WebKitNavigationPolicyDecision.
  */
  NavigationAction = 0,

  /**
      This type of policy decision
        is requested when WebKit is about to create a new window. Acceptable policy
        decisions are either [webkit.policy_decision.PolicyDecision.use] or
        [webkit.policy_decision.PolicyDecision.ignore]. This type of policy decision is always
        a #WebKitNavigationPolicyDecision. These decisions are useful for implementing
        special actions for new windows, such as forcing the new window to open
        in a tab when a keyboard modifier is active or handling a special
        target attribute on <a> elements.
  */
  NewWindowAction = 1,

  /**
      This type of decision is used when WebKit has
        received a response for a network resource and is about to start the load.
        Note that these resources include all subresources of a page such as images
        and stylesheets as well as main documents. Appropriate policy responses to
        this decision are [webkit.policy_decision.PolicyDecision.use], [webkit.policy_decision.PolicyDecision.ignore],
        or [webkit.policy_decision.PolicyDecision.download]. This type of policy decision is always
        a #WebKitResponsePolicyDecision. This decision is useful for forcing
        some types of resources to be downloaded rather than rendered in the WebView
        or to block the transfer of resources entirely.
  */
  Response = 2,
}

/**
    Enum values used to denote the various policy errors.
*/
enum WebKitPolicyError
{
  /**
      Generic load failure due to policy error
  */
  Failed = 199,

  /**
      Load failure due to unsupported mime type
  */
  CannotShowMimeType = 100,

  /**
      Load failure due to URI that can not be shown
  */
  CannotShowUri = 101,

  /**
      Load failure due to frame load interruption by policy change
  */
  FrameLoadInterruptedByPolicyChange = 102,

  /**
      Load failure due to port restriction
  */
  CannotUseRestrictedPort = 103,
}

/**
    Enum values used to denote the various print errors.
*/
enum WebKitPrintError
{
  /**
      Unspecified error during a print operation
  */
  General = 599,

  /**
      Selected printer cannot be found
  */
  PrinterNotFound = 500,

  /**
      Invalid page range
  */
  InvalidPageRange = 501,
}

/**
    Enum values representing the response of the print dialog shown with
    [webkit.print_operation.PrintOperation.runDialog].
*/
enum WebKitPrintOperationResponse
{
  /**
      Print button was clicked in print dialog
  */
  Print = 0,

  /**
      Print dialog was cancelled
  */
  Cancel = 1,
}

/**
    Enum values to specify the different ways in which a #WebKitWebView
    can save its current web page into a self-contained file.
*/
enum WebKitSaveMode
{
  /**
      Save the current page using the MHTML format.
  */
  Mhtml = 0,
}

/**
    Enum values used for determining the type of #WebKitScriptDialog
*/
enum WebKitScriptDialogType
{
  /**
      Alert script dialog, used to show a
      message to the user.
  */
  Alert = 0,

  /**
      Confirm script dialog, used to ask
      confirmation to the user.
  */
  Confirm = 1,

  /**
      Prompt script dialog, used to ask
      information to the user.
  */
  Prompt = 2,

  /**
      Before unload confirm dialog,
      used to ask confirmation to leave the current page to the user. Since 2.12
  */
  BeforeUnloadConfirm = 3,
}

/**
    Enum values used to denote errors happening when creating snapshots of #WebKitWebView
*/
enum WebKitSnapshotError
{
  /**
      An error occurred when creating a webpage snapshot.
  */
  Create = 799,
}

/**
    Enum values used to specify options when taking a snapshot
    from a #WebKitWebView.
*/
enum WebKitSnapshotOptions : uint
{
  /**
      Do not include any special options.
  */
  None = 0,

  /**
      Whether to include in the
      snapshot the highlight of the selected content.
  */
  IncludeSelectionHighlighting = 1,

  /**
      Do not fill the background with white before
      rendering the snapshot. Since 2.8
  */
  TransparentBackground = 2,
}

/**
    Enum values used to specify the region from which to get a #WebKitWebView
    snapshot
*/
enum WebKitSnapshotRegion
{
  /**
      Specifies a snapshot only for the area that is
      visible in the webview
  */
  Visible = 0,

  /**
      A snapshot of the entire document.
  */
  FullDocument = 1,
}

/**
    Enum values used to denote the TLS errors policy.
*/
enum WebKitTLSErrorsPolicy
{
  /**
      Ignore TLS errors.
  */
  Ignore = 0,

  /**
      TLS errors will emit
        #WebKitWebView::load-failed-with-tls-errors and, if the signal is handled,
        finish the load. In case the signal is not handled,
        #WebKitWebView::load-failed is emitted before the load finishes.
  */
  Fail = 1,
}

/**
    Errors that can occur while compiling content filters.
*/
enum WebKitUserContentFilterError
{
  /**
      The JSON source for a content filter is invalid.
  */
  InvalidSource = 0,

  /**
      The requested content filter could not be found.
  */
  NotFound = 1,
}

/**
    Specifies in which frames user style sheets are to be inserted in.
*/
enum WebKitUserContentInjectedFrames
{
  /**
      Insert the user style
        sheet in all the frames loaded by the web view, including
        nested frames. This is the default.
  */
  AllFrames = 0,

  /**
      Insert the user style
        sheet *only* in the top-level frame loaded by the web view,
        and *not* in the nested frames.
  */
  TopFrame = 1,
}

/**
    Enum values used to denote errors happening when sending user messages.
*/
enum WebKitUserMessageError
{
  /**
      The message was not handled by the receiver.
  */
  Message = 0,
}

/**
    Specifies at which place of documents an user script will be inserted.
*/
enum WebKitUserScriptInjectionTime
{
  /**
      Insert the code of the user
        script at the beginning of loaded documents. This is the default.
  */
  Start = 0,

  /**
      Insert the code of the user
        script at the end of the loaded documents.
  */
  End = 1,
}

/**
    Specifies how to treat an user style sheet.
*/
enum WebKitUserStyleLevel
{
  /**
      The style sheet is an user style sheet,
        its contents always override other style sheets. This is the default.
  */
  User = 0,

  /**
      The style sheet will be treated as if
        it was provided by the loaded documents. That means other user style
        sheets may still override it.
  */
  Author = 1,
}

/**
    Enum values used to denote errors happening when creating a #WebKitWebExtensionMatchPattern
*/
enum WebKitWebExtensionMatchPatternError
{
  /**
      An unknown error occured.
  */
  Unknown = 899,

  /**
      The scheme component was invalid.
  */
  InvalidScheme = 808,

  /**
      The host component was invalid.
  */
  InvalidHost = 809,

  /**
      The path component was invalid.
  */
  InvalidPath = 810,
}

/**
    Enum values representing matching options.
*/
enum WebKitWebExtensionMatchPatternOptions : uint
{
  /**
      No special matching options.
  */
  None = 1,

  /**
      The scheme components should be ignored while matching.
  */
  IgnoreSchemes = 2,

  /**
      The host components should be ignored while matching.
  */
  IgnorePaths = 4,

  /**
      Two patterns should be checked in either direction while matching (A matches B, or B matches A). Invalid for matching URLs.
  */
  MatchBidirectionally = 8,
}

/**
    Enum values used for setting if a #WebKitWebView is intended for
    WebExtensions.
*/
enum WebKitWebExtensionMode
{
  /**
      Not for an extension.
  */
  None = 0,

  /**
      For a ManifestV2 extension.
  */
  Manifestv2 = 1,

  /**
      For a ManifestV3 extension.
  */
  Manifestv3 = 2,
}

/**
    Enum values used to specify the reason why the web process terminated abnormally.
*/
enum WebKitWebProcessTerminationReason
{
  /**
      the web process crashed.
  */
  Crashed = 0,

  /**
      the web process exceeded the memory limit.
  */
  ExceededMemoryLimit = 1,

  /**
      the web process termination was requested by an API call. Since: 2.34
  */
  TerminatedByApi = 2,
}

/**
    Enum values with flags representing types of Website data.
*/
enum WebKitWebsiteDataTypes : uint
{
  /**
      Memory cache.
  */
  MemoryCache = 1,

  /**
      HTTP disk cache.
  */
  DiskCache = 2,

  /**
      Offline web application cache.
  */
  OfflineApplicationCache = 4,

  /**
      Session storage data.
  */
  SessionStorage = 8,

  /**
      Local storage data.
  */
  LocalStorage = 16,

  /**
      IndexedDB databases.
  */
  IndexeddbDatabases = 32,

  /**
      Cookies.
  */
  Cookies = 64,

  /**
      Hash salt used to generate the device ids used by webpages.
  */
  DeviceIdHashSalt = 128,

  /**
      HSTS cache.
  */
  HstsCache = 256,

  /**
      Intelligent Tracking Prevention data.
  */
  Itp = 512,

  /**
      Service worker registrations.
  */
  ServiceWorkerRegistrations = 1024,

  /**
      DOM (CacheStorage) cache.
  */
  DomCache = 2048,

  /**
      All types.
  */
  All = 4095,
}

/**
    Information about an application running in automation mode.
*/
struct WebKitApplicationInfo;

/**
    Represents an authentication request.
    
    Whenever a client attempts to load a page protected by HTTP
    authentication, credentials will need to be provided to authorize access.
    To allow the client to decide how it wishes to handle authentication,
    WebKit will fire a #WebKitWebView::authenticate signal with a
    WebKitAuthenticationRequest object to provide client side
    authentication support. Credentials are exposed through the
    #WebKitCredential object.
    
    In case the client application does not wish
    to handle this signal WebKit will provide a default handler. To handle
    authentication asynchronously, simply increase the reference count of the
    WebKitAuthenticationRequest object.
*/
struct WebKitAuthenticationRequest;

/** */
struct WebKitAuthenticationRequestClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Automation Session.
    
    WebKitAutomationSession represents an automation session of a WebKitWebContext.
    When a new session is requested, a WebKitAutomationSession is created and the signal
    WebKitWebContext::automation-started is emitted with the WebKitAutomationSession as
    argument. Then, the automation client can request the session to create a new
    #WebKitWebView to interact with it. When this happens the signal #WebKitAutomationSession::create-web-view
    is emitted.
*/
struct WebKitAutomationSession;

/** */
struct WebKitAutomationSessionClass
{
  /** */
  GObjectClass parentClass;
}

/**
    List of visited pages.
    
    WebKitBackForwardList maintains a list of visited pages used to
    navigate to recent pages. Items are inserted in the list in the
    order they are visited.
    
    WebKitBackForwardList also maintains the notion of the current item
    (which is always at index 0), the preceding item (which is at index -1),
    and the following item (which is at index 1).
    Methods [webkit.web_view.WebView.goBack] and [webkit.web_view.WebView.goForward] move
    the current item backward or forward by one. Method
    [webkit.web_view.WebView.goToBackForwardListItem] sets the current item to the
    specified item. All other methods returning #WebKitBackForwardListItem<!-- -->s
    do not change the value of the current item, they just return the requested
    item or items.
*/
struct WebKitBackForwardList;

/** */
struct WebKitBackForwardListClass
{
  /** */
  GObjectClass parentClass;
}

/**
    One item of the #WebKitBackForwardList.
    
    A history item is part of the #WebKitBackForwardList and consists
    out of a title and a URI.
*/
struct WebKitBackForwardListItem;

/** */
struct WebKitBackForwardListItemClass
{
  /** */
  GInitiallyUnownedClass parentClass;
}

/**
    A permission request for reading clipboard contents.
    
    WebKitClipboardPermissionRequest represents a request for
    permission to decide whether WebKit can access the clipboard to read
    its contents through the Async Clipboard API.
    
    When a WebKitClipboardPermissionRequest is not handled by the user,
    it is denied by default.
*/
struct WebKitClipboardPermissionRequest;

/** */
struct WebKitClipboardPermissionRequestClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A request to open a color chooser.
    
    Whenever the user interacts with an <input type='color' />
    HTML element, WebKit will need to show a dialog to choose a color. For that
    to happen in a general way, instead of just opening a #GtkColorChooser
    (which might be not desirable in some cases, which could prefer to use their
    own color chooser dialog), WebKit will fire the
    #WebKitWebView::run-color-chooser signal with a #WebKitColorChooserRequest
    object, which will allow the client application to specify the color to be
    selected, to inspect the details of the request (e.g. to get initial color)
    and to cancel the request, in case nothing was selected.
    
    In case the client application does not wish to handle this signal,
    WebKit will provide a default handler which will asynchronously run
    a regular #GtkColorChooserDialog for the user to interact with.
*/
struct WebKitColorChooserRequest;

/** */
struct WebKitColorChooserRequestClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Represents the context menu in a #WebKitWebView.
    
    #WebKitContextMenu represents a context menu containing
    #WebKitContextMenuItem<!-- -->s in a #WebKitWebView.
    
    When a #WebKitWebView is about to display the context menu, it
    emits the #WebKitWebView::context-menu signal, which has the
    #WebKitContextMenu as an argument. You can modify it, adding new
    submenus that you can create with [webkitwebprocessextension.context_menu.ContextMenu.new_], adding
    new #WebKitContextMenuItem<!-- -->s with
    [webkitwebprocessextension.context_menu.ContextMenu.prepend], [webkitwebprocessextension.context_menu.ContextMenu.append] or
    [webkitwebprocessextension.context_menu.ContextMenu.insert], maybe after having removed the
    existing ones with [webkitwebprocessextension.context_menu.ContextMenu.removeAll].
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
    Defines how to handle cookies in a #WebKitWebContext.
    
    The WebKitCookieManager defines how to set up and handle cookies.
    You can get it from a #WebKitWebsiteDataManager with
    webkit_website_data_manager_get_cookie_manager(), and use it to set where to
    store cookies with [webkit.cookie_manager.CookieManager.setPersistentStorage],
    or to set the acceptance policy, with [webkit.cookie_manager.CookieManager.getAcceptPolicy].
*/
struct WebKitCookieManager;

/** */
struct WebKitCookieManagerClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Groups information used for user authentication.
*/
struct WebKitCredential;

/**
    A permission request for accessing user's audio/video devices.
    
    WebKitUserMediaPermissionRequest represents a request for
    permission to whether WebKit should be allowed to access the user's
    devices information when requested through the enumerateDevices API.
    
    When a WebKitDeviceInfoPermissionRequest is not handled by the user,
    it is denied by default.
*/
struct WebKitDeviceInfoPermissionRequest;

/** */
struct WebKitDeviceInfoPermissionRequestClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Object used to communicate with the application when downloading.
    
    #WebKitDownload carries information about a download request and
    response, including a #WebKitURIRequest and a #WebKitURIResponse
    objects. The application may use this object to control the
    download process, or to simply figure out what is to be downloaded,
    and handle the download process itself.
*/
struct WebKitDownload;

/** */
struct WebKitDownloadClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Web editor state.
    
    WebKitEditorState represents the state of a #WebKitWebView editor.
    Use [webkit.web_view.WebView.getEditorState] to get the WebKitEditorState
    of a #WebKitWebView.
*/
struct WebKitEditorState;

/** */
struct WebKitEditorStateClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Provides access to the icons associated with web sites.
    
    WebKit will automatically look for available icons in <link>
    elements on opened pages as well as an existing favicon.ico and
    load the images found into a memory cache if possible. That cache
    is frozen to an on-disk database for persistence.
    
    If #WebKitSettings:enable-private-browsing is true, new icons
    won't be added to the on-disk database and no existing icons will
    be deleted from it. Nevertheless, WebKit will still store them in
    the in-memory cache during the current execution.
*/
struct WebKitFaviconDatabase;

/** */
struct WebKitFaviconDatabaseClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Describes a web engine feature that may be toggled at runtime.
    
    The WebKit web engine includes a set of features which may be toggled
    programmatically, each one represented by a #WebKitFeature that provides
    information about it:
    
    $(LIST
      * A unique “identifier”: [webkit.feature.Feature.getIdentifier].
      * A “default value”, which indicates whether the option is enabled
        automatically: [webkit.feature.Feature.getDefaultValue].
      * Its “status”, which determines whether it should be considered
        user-settable and its development stage (see `enum@FeatureStatus`
        for details): [webkit.feature.Feature.getStatus].
      * A category, which may be used to group features together:
        [webkit.feature.Feature.getCategory].
      * An optional short “name” which can be presented to an user:
        [webkit.feature.Feature.getName].
      * An optional longer “detailed” description:
        [webkit.feature.Feature.getDetails].
    )
      
    The lists of available features can be obtained with
    [webkit.settings.Settings.getAllFeatures], [webkit.settings.Settings.getExperimentalFeatures],
    and [webkit.settings.Settings.getDevelopmentFeatures]). As a rule of thumb,
    applications which may want to allow users (i.e. web developers) to test
    WebKit features should use the list of experimental features. Additionally,
    applications might want to expose development features *when targeting
    technically inclined users* for early testing of in-development features
    (i.e. in “technology preview” or “canary” builds).
    
    Applications **must not** expose the list of all features to end users
    because they often lack descriptions and control parts of the web engine
    which are either intended to be used during development of WebKit itself,
    or in specific scenarios to tweak how WebKit integrates with the
    application.
*/
struct WebKitFeature;

/**
    Contains a set of toggle-able web engine features.
    
    The list supports passing around a set of `struct@Feature` objects and
    iterating over them:
    
    ```c
    g_autoptr(WebKitFeatureList) list = webkit_settings_get_experimental_features();
    for (gsize i = 0; i < webkit_feature_list_get_length(list): i++) {
        WebKitFeature *feature = webkit_feature_list_get(list, i);
        // Do something with "feature".
    }
    ```
    
    Lists of features can be obtained with
    [webkit.settings.Settings.getExperimentalFeatures],
    [webkit.settings.Settings.getDevelopmentFeatures], and
    [webkit.settings.Settings.getAllFeatures].
*/
struct WebKitFeatureList;

/**
    A request to open a file chooser.
    
    Whenever the user interacts with an HTML input element with
    file type, WebKit will need to show a dialog to choose one or
    more files to be uploaded to the server along with the rest of the
    form data. For that to happen in a general way, instead of just
    opening a #GtkFileChooserDialog (which might be not desirable in
    some cases, which could prefer to use their own file chooser
    dialog), WebKit will fire the #WebKitWebView::run-file-chooser
    signal with a #WebKitFileChooserRequest object, which will allow
    the client application to specify the files to be selected, to
    inspect the details of the request (e.g. if multiple selection
    should be allowed) and to cancel the request, in case nothing was
    selected.
    
    In case the client application does not wish to handle this signal,
    WebKit will provide a default handler which will asynchronously run
    a regular #GtkFileChooserDialog for the user to interact with.
*/
struct WebKitFileChooserRequest;

/** */
struct WebKitFileChooserRequestClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Controls text search in a #WebKitWebView.
    
    A #WebKitFindController is used to search text in a #WebKitWebView. You
    can get a #WebKitWebView<!-- -->'s #WebKitFindController with
    [webkit.web_view.WebView.getFindController], and later use it to search
    for text using [webkit.find_controller.FindController.search], or get the
    number of matches using [webkit.find_controller.FindController.countMatches]. The
    operations are asynchronous and trigger signals when ready, such as
    #WebKitFindController::found-text,
    #WebKitFindController::failed-to-find-text or
    #WebKitFindController::counted-matches<!-- -->.
*/
struct WebKitFindController;

/** */
struct WebKitFindControllerClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Represents a form submission request.
    
    When a form is about to be submitted in a #WebKitWebView, the
    #WebKitWebView::submit-form signal is emitted. Its request argument
    contains information about the text fields of the form, that are
    typically used to store login information, returned as lists by
    [webkit.form_submission_request.FormSubmissionRequest.listTextFields]. You can submit the
    form with [webkit.form_submission_request.FormSubmissionRequest.submit].
*/
struct WebKitFormSubmissionRequest;

/** */
struct WebKitFormSubmissionRequestClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Geolocation manager.
    
    WebKitGeolocationManager provides API to get the geographical position of the user.
    Once a #WebKitGeolocationPermissionRequest is allowed, when WebKit needs to know the
    user location #WebKitGeolocationManager::start signal is emitted. If the signal is handled
    and returns true, the application is responsible for providing the position every time it's
    updated by calling [webkit.geolocation_manager.GeolocationManager.updatePosition]. The signal #WebKitGeolocationManager::stop
    will be emitted when location updates are no longer needed.
*/
struct WebKitGeolocationManager;

/** */
struct WebKitGeolocationManagerClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A permission request for sharing the user's location.
    
    WebKitGeolocationPermissionRequest represents a request for
    permission to decide whether WebKit should provide the user's
    location to a website when requested through the Geolocation API.
    
    When a WebKitGeolocationPermissionRequest is not handled by the user,
    it is denied by default.
    
    When embedding web views in your application, you *must* configure an
    application identifier to allow web content to use geolocation services.
    The identifier *must* match the name of the `.desktop` file which describes
    the application, sans the suffix.
    
    If your application uses #GApplication (or any subclass like
    #GtkApplication), WebKit will automatically use the identifier returned by
    [gio.application.Application.getApplicationId]. This is the recommended approach for
    enabling geolocation in applications.
    
    If an identifier cannot be obtained through #GApplication, the value
    returned by [glib.global.getPrgname] will be used instead as a fallback. For
    programs which cannot use #GApplication, calling [glib.global.setPrgname] early
    during initialization is needed when the name of the executable on disk
    does not match the name of a valid `.desktop` file.
*/
struct WebKitGeolocationPermissionRequest;

/** */
struct WebKitGeolocationPermissionRequestClass
{
  /** */
  GObjectClass parentClass;
}

/**
    An opaque struct to provide position updates to a #WebKitGeolocationManager.
    
    WebKitGeolocationPosition is an opaque struct used to provide position updates to a
    #WebKitGeolocationManager using [webkit.geolocation_manager.GeolocationManager.updatePosition].
*/
struct WebKitGeolocationPosition;

/**
    Result of a Hit Test.
    
    A Hit Test is an operation to get context information about a given
    point in a #WebKitWebView. #WebKitHitTestResult represents the
    result of a Hit Test. It provides context information about what is
    at the coordinates of the Hit Test, such as if there's a link,
    an image or a media.
    
    You can get the context of the HitTestResult with
    [webkitwebprocessextension.hit_test_result.HitTestResult.getContext] that returns a bitmask of
    #WebKitHitTestResultContext flags. You can also use
    [webkitwebprocessextension.hit_test_result.HitTestResult.contextIsLink], [webkitwebprocessextension.hit_test_result.HitTestResult.contextIsImage] and
    [webkitwebprocessextension.hit_test_result.HitTestResult.contextIsMedia] to determine whether there's
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

/**
    Describes a first party origin.
*/
struct WebKitITPFirstParty;

/**
    Describes a third party origin.
*/
struct WebKitITPThirdParty;

/**
    Base class for input method contexts.
    
    WebKitInputMethodContext defines the interface to implement WebKit input methods.
    The input methods are used by WebKit, when editable content is focused, to map from
    key events to Unicode character strings.
    
    An input method may consume multiple key events in sequence and finally
    output the composed result. This is called preediting, and an input method
    may provide feedback about this process by displaying the intermediate
    composition states as preedit text.
*/
struct WebKitInputMethodContext
{
  /** */
  GObject parentInstance;

  /** */
  WebKitInputMethodContextPrivate* priv;
}

/** */
struct WebKitInputMethodContextClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(WebKitInputMethodContext* context) preeditStarted;

  /** */
  extern(C) void function(WebKitInputMethodContext* context) preeditChanged;

  /** */
  extern(C) void function(WebKitInputMethodContext* context) preeditFinished;

  /** */
  extern(C) void function(WebKitInputMethodContext* context, const(char)* text) committed;

  /** */
  extern(C) void function(WebKitInputMethodContext* context, int offset, uint nChars) deleteSurrounding;

  /**
      Called via [webkit.input_method_context.InputMethodContext.setEnablePreedit] to
        control the use of the preedit string.
  */
  extern(C) void function(WebKitInputMethodContext* context, gboolean enabled) setEnablePreedit;

  /**
      Called via [webkit.input_method_context.InputMethodContext.getPreedit] to
        retrieve the text currently being preedited for display at the cursor
        position. Any input method which composes complex characters or any
        other compositions from multiple sequential key presses should override
        this method to provide feedback.
  */
  extern(C) void function(WebKitInputMethodContext* context, char** text, GList** underlines, uint* cursorOffset) getPreedit;

  /**
      Called via [webkit.input_method_context.InputMethodContext.filterKeyEvent] on every
        key press or release event. Every non-trivial input method needs to
        override this in order to implement the mapping from key events to text.
        A return value of true indicates to the caller that the event was
        consumed by the input method. In that case, the #WebKitInputMethodContext::committed
        signal should be emitted upon completion of a key sequence to pass the
        resulting text back to the editable element. Alternatively, false may be
        returned to indicate that the event wasn’t handled by the input method.
  */
  extern(C) gboolean function(WebKitInputMethodContext* context, GdkEvent* keyEvent) filterKeyEvent;

  /**
      Called via [webkit.input_method_context.InputMethodContext.notifyFocusIn] when
        an editable element of the #WebKitWebView has gained focus.
  */
  extern(C) void function(WebKitInputMethodContext* context) notifyFocusIn;

  /**
      Called via [webkit.input_method_context.InputMethodContext.notifyFocusOut] when
        an editable element of the #WebKitWebView has lost focus.
  */
  extern(C) void function(WebKitInputMethodContext* context) notifyFocusOut;

  /**
      Called via [webkit.input_method_context.InputMethodContext.notifyCursorArea]
        to inform the input method of the current cursor location relative to
        the client window.
  */
  extern(C) void function(WebKitInputMethodContext* context, int x, int y, int width, int height) notifyCursorArea;

  /**
      Called via [webkit.input_method_context.InputMethodContext.notifySurrounding] to
        update the context surrounding the cursor. The provided text should not include
        the preedit string.
  */
  extern(C) void function(WebKitInputMethodContext* context, const(char)* text, uint length, uint cursorIndex, uint selectionIndex) notifySurrounding;

  /**
      Called via [webkit.input_method_context.InputMethodContext.reset] to signal a change that
        requires a reset. An input method that implements preediting
        should override this method to clear the preedit state on reset.
  */
  extern(C) void function(WebKitInputMethodContext* context) reset;

  /** */
  extern(C) void function() WebkitReserved0;

  /** */
  extern(C) void function() WebkitReserved1;

  /** */
  extern(C) void function() WebkitReserved2;

  /** */
  extern(C) void function() WebkitReserved3;

  /** */
  extern(C) void function() WebkitReserved4;

  /** */
  extern(C) void function() WebkitReserved5;

  /** */
  extern(C) void function() WebkitReserved6;

  /** */
  extern(C) void function() WebkitReserved7;

  /** */
  extern(C) void function() WebkitReserved8;

  /** */
  extern(C) void function() WebkitReserved9;

  /** */
  extern(C) void function() WebkitReserved10;

  /** */
  extern(C) void function() WebkitReserved11;

  /** */
  extern(C) void function() WebkitReserved12;

  /** */
  extern(C) void function() WebkitReserved13;

  /** */
  extern(C) void function() WebkitReserved14;

  /** */
  extern(C) void function() WebkitReserved15;
}

/** */
struct WebKitInputMethodContextPrivate;

/**
    Range of text in an preedit string to be shown underlined.
*/
struct WebKitInputMethodUnderline;

/**
    A permission request for using an EME Content Decryption Module.
    
    WebKitMediaKeySystemPermissionRequest represents a request for permission to decide whether
    WebKit should use the given CDM to access protected media when requested through the
    MediaKeySystem API.
    
    When a WebKitMediaKeySystemPermissionRequest is not handled by the user,
    it is denied by default.
    
    When handling this permission request the application may perform additional installation of the
    requested CDM, unless it is already present on the host system.
*/
struct WebKitMediaKeySystemPermissionRequest;

/** */
struct WebKitMediaKeySystemPermissionRequestClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A boxed type representing the settings for the memory pressure handler
    
    #WebKitMemoryPressureSettings is a boxed type that can be used to provide some custom settings
    to control how the memory pressure situations are handled by the different processes.
    
    The memory pressure system implemented inside the different process will try to keep the memory usage
    under the defined memory limit. In order to do that, it will check the used memory with a user defined
    frequency and decide whether it should try to release memory. The thresholds passed will define how urgent
    is to release that memory.
    
    Take into account that badly defined parameters can greatly reduce the performance of the engine. For
    example, setting memory limit too low with a fast poll interval can cause the process to constantly
    be trying to release memory.
    
    A #WebKitMemoryPressureSettings can be passed to a #WebKitWebContext constructor, and the settings will
    be applied to all the web processes created by that context.
    
    A #WebKitMemoryPressureSettings can be passed to webkit_website_data_manager_set_memory_pressure_settings(),
    and the settings will be applied to all the network processes created after that call by any instance of
    #WebKitWebsiteDataManager.
*/
struct WebKitMemoryPressureSettings;

/**
    Provides details about interaction resulting in a resource load.
*/
struct WebKitNavigationAction;

/**
    A policy decision for navigation actions.
    
    WebKitNavigationPolicyDecision represents a policy decision for events associated with
    navigations. If the value of #WebKitNavigationPolicyDecision:mouse-button is not 0, then
    the navigation was triggered by a mouse event.
*/
struct WebKitNavigationPolicyDecision;

/** */
struct WebKitNavigationPolicyDecisionClass
{
  /** */
  WebKitPolicyDecisionClass parentClass;
}

/**
    Configures network proxies.
    
    WebKitNetworkProxySettings can be used to provide a custom proxy configuration
    to a #WebKitWebContext. You need to call webkit_web_context_set_network_proxy_settings()
    with [webkit.types.NetworkProxyMode.Custom] and a WebKitNetworkProxySettings.
*/
struct WebKitNetworkProxySettings;

/**
    Manages network configuration.
*/
struct WebKitNetworkSession;

/** */
struct WebKitNetworkSessionClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Holds information about a notification that should be shown to the user.
*/
struct WebKitNotification;

/** */
struct WebKitNotificationClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A permission request for displaying web notifications.
    
    WebKitNotificationPermissionRequest represents a request for
    permission to decide whether WebKit should provide the user with
    notifications through the Web Notification API.
    
    When a WebKitNotificationPermissionRequest is not handled by the user,
    it is denied by default.
*/
struct WebKitNotificationPermissionRequest;

/** */
struct WebKitNotificationPermissionRequestClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Represents the dropdown menu of a `select` element in a #WebKitWebView.
    
    When a select element in a #WebKitWebView needs to display a dropdown menu, the signal
    #WebKitWebView::show-option-menu is emitted, providing a WebKitOptionMenu with the
    #WebKitOptionMenuItem<!-- -->s that should be displayed.
*/
struct WebKitOptionMenu;

/** */
struct WebKitOptionMenuClass
{
  /** */
  GObjectClass parentClass;
}

/**
    One item of a #WebKitOptionMenu.
    
    The #WebKitOptionMenu is composed of WebKitOptionMenuItem<!-- -->s.
    A WebKitOptionMenuItem always has a label and can contain a tooltip text.
    You can use the WebKitOptionMenuItem of a #WebKitOptionMenu to build your
    own menus.
*/
struct WebKitOptionMenuItem;

/**
    A permission request.
    
    There are situations where an embedder would need to ask the user
    for permission to do certain types of operations, such as switching
    to fullscreen mode or reporting the user's location through the
    standard Geolocation API. In those cases, WebKit will emit a
    #WebKitWebView::permission-request signal with a
    #WebKitPermissionRequest object attached to it.
*/
struct WebKitPermissionRequest;

/** */
struct WebKitPermissionRequestInterface
{
  /** */
  GTypeInterface parentInterface;

  /** */
  extern(C) void function(WebKitPermissionRequest* request) allow;

  /** */
  extern(C) void function(WebKitPermissionRequest* request) deny;
}

/**
    This query represents a user's choice to allow or deny access to "powerful features" of the
    platform, as specified in the [Permissions W3C
    Specification](https://w3c.github.io/permissions/).
    
    When signalled by the #WebKitWebView through the `query-permission-state` signal, the application
    has to eventually respond, via `[webkit.permission_state_query.PermissionStateQuery.finish]`, whether it grants,
    denies or requests a dedicated permission prompt for the given query.
    
    When a #WebKitPermissionStateQuery is not handled by the user, the user-agent is instructed to
    `prompt` the user for the given permission.
*/
struct WebKitPermissionStateQuery;

/**
    A permission request for locking the pointer.
    
    WebKitPointerLockPermissionRequest represents a request for
    permission to decide whether WebKit can lock the pointer device when
    requested by web content.
    
    When a WebKitPointerLockPermissionRequest is not handled by the user,
    it is allowed by default.
*/
struct WebKitPointerLockPermissionRequest;

/** */
struct WebKitPointerLockPermissionRequestClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A pending policy decision.
    
    Often WebKit allows the client to decide the policy for certain
    operations. For instance, a client may want to open a link in a new
    tab, block a navigation entirely, query the user or trigger a download
    instead of a navigation. In these cases WebKit will fire the
    #WebKitWebView::decide-policy signal with a #WebKitPolicyDecision
    object. If the signal handler does nothing, WebKit will act as if
    [webkit.policy_decision.PolicyDecision.use] was called as soon as signal handling
    completes. To make a policy decision asynchronously, simply increment
    the reference count of the #WebKitPolicyDecision object.
*/
struct WebKitPolicyDecision
{
  /** */
  GObject parentInstance;

  /** */
  WebKitPolicyDecisionPrivate* priv;
}

/** */
struct WebKitPolicyDecisionClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function() WebkitReserved0;

  /** */
  extern(C) void function() WebkitReserved1;

  /** */
  extern(C) void function() WebkitReserved2;

  /** */
  extern(C) void function() WebkitReserved3;

  /** */
  extern(C) void function() WebkitReserved4;

  /** */
  extern(C) void function() WebkitReserved5;

  /** */
  extern(C) void function() WebkitReserved6;

  /** */
  extern(C) void function() WebkitReserved7;
}

/** */
struct WebKitPolicyDecisionPrivate;

/**
    Controls a print operation.
    
    A #WebKitPrintOperation controls a print operation in WebKit. With
    a similar API to #GtkPrintOperation, it lets you set the print
    settings with [webkit.print_operation.PrintOperation.setPrintSettings] or
    display the print dialog with [webkit.print_operation.PrintOperation.runDialog].
*/
struct WebKitPrintOperation;

/** */
struct WebKitPrintOperationClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A policy decision for resource responses.
    
    WebKitResponsePolicyDecision represents a policy decision for a
    resource response, whether from the network or the local system.
    A very common use case for these types of decision is deciding
    whether or not to download a particular resource or to load it
    normally.
*/
struct WebKitResponsePolicyDecision;

/** */
struct WebKitResponsePolicyDecisionClass
{
  /** */
  WebKitPolicyDecisionClass parentClass;
}

/**
    Carries details to be shown in user-facing dialogs.
*/
struct WebKitScriptDialog;

/**
    A reply for a script message received.
    If no reply has been sent by the user, an automatically generated reply with
    undefined value with be sent.
*/
struct WebKitScriptMessageReply;

/**
    Controls security settings in a #WebKitWebContext.
    
    The #WebKitSecurityManager defines security settings for URI
    schemes in a #WebKitWebContext. Get it from the context with
    [webkit.web_context.WebContext.getSecurityManager], and use it to register a
    URI scheme with a certain security level, or to check if it already
    has it.
*/
struct WebKitSecurityManager;

/** */
struct WebKitSecurityManagerClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A security boundary for websites.
    
    #WebKitSecurityOrigin is a representation of a security domain
    defined by websites. A security origin consists of a protocol, a
    hostname, and an optional port number.
    
    Resources with the same security origin can generally access each
    other for client-side scripting or database access. When comparing
    origins, beware that if both protocol and host are null, the origins
    should not be treated as equal.
*/
struct WebKitSecurityOrigin;

/**
    Control the behaviour of a #WebKitWebView.
    
    #WebKitSettings can be applied to a #WebKitWebView to control text charset,
    color, font sizes, printing mode, script support, loading of images and various
    other things on a #WebKitWebView. After creation, a #WebKitSettings object
    contains default settings.
    
    ```c
    // Disable JavaScript
    WebKitSettings *settings = webkit_web_view_group_get_settings (my_view_group);
    webkit_settings_set_enable_javascript (settings, FALSE);
    ```
*/
struct WebKitSettings;

/** */
struct WebKitSettingsClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Represents a URI request.
    
    A #WebKitURIRequest can be created with a URI using the
    [webkitwebprocessextension.urirequest.URIRequest.new_] method, and you can get the URI of an
    existing request with the [webkitwebprocessextension.urirequest.URIRequest.getUri] one.
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
    Represents a URI scheme request.
    
    If you register a particular URI scheme in a #WebKitWebContext,
    using [webkit.web_context.WebContext.registerUriScheme], you have to provide
    a #WebKitURISchemeRequestCallback. After that, when a URI request
    is made with that particular scheme, your callback will be
    called. There you will be able to access properties such as the
    scheme, the URI and path, and the #WebKitWebView that initiated the
    request, and also finish the request with
    [webkit.urischeme_request.URISchemeRequest.finish].
*/
struct WebKitURISchemeRequest;

/** */
struct WebKitURISchemeRequestClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Represents a URI scheme response.
    
    If you register a particular URI scheme in a #WebKitWebContext,
    using [webkit.web_context.WebContext.registerUriScheme], you have to provide
    a #WebKitURISchemeRequestCallback. After that, when a URI response
    is made with that particular scheme, your callback will be
    called. There you will be able to provide more response parameters
    when the methods and properties of a #WebKitURISchemeRequest is not
    enough.
    
    When you finished setting up your #WebKitURISchemeResponse, call
    webkit_uri_request_finish_with_response() with it to return the response.
*/
struct WebKitURISchemeResponse;

/** */
struct WebKitURISchemeResponseClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A compiled set of rules which applied to resource loads.
*/
struct WebKitUserContentFilter;

/**
    Handles storage of user content filters on disk.
    
    The WebKitUserContentFilterStore provides the means to import and save
    [JSON rule sets](https://webkit.org/blog/3476/content-blockers-first-look/),
    which can be loaded later in an efficient manner. Once filters are stored,
    the #WebKitUserContentFilter objects which represent them can be added to
    a #WebKitUserContentManager with [webkit.user_content_manager.UserContentManager.addFilter].
    
    JSON rule sets are imported using [webkit.user_content_filter_store.UserContentFilterStore.save] and stored
    on disk in an implementation defined format. The contents of a filter store must be
    managed using the #WebKitUserContentFilterStore: a list of all the stored filters
    can be obtained with [webkit.user_content_filter_store.UserContentFilterStore.fetchIdentifiers],
    [webkit.user_content_filter_store.UserContentFilterStore.load] can be used to retrieve a previously saved
    filter, and removed from the store with [webkit.user_content_filter_store.UserContentFilterStore.remove].
*/
struct WebKitUserContentFilterStore;

/** */
struct WebKitUserContentFilterStoreClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Manages user-defined content which affects web pages.
    
    Using a #WebKitUserContentManager user CSS style sheets can be set to
    be injected in the web pages loaded by a #WebKitWebView, by
    [webkit.user_content_manager.UserContentManager.addStyleSheet].
    
    To use a #WebKitUserContentManager, it must be created using
    [webkit.user_content_manager.UserContentManager.new_], and then used to construct
    a #WebKitWebView. User style sheets can be created with
    [webkit.user_style_sheet.UserStyleSheet.new_].
    
    User style sheets can be added and removed at any time, but
    they will affect the web pages loaded afterwards.
*/
struct WebKitUserContentManager;

/** */
struct WebKitUserContentManagerClass
{
  /** */
  GObjectClass parentClass;
}

/**
    A permission request for accessing user's audio/video devices.
    
    WebKitUserMediaPermissionRequest represents a request for
    permission to decide whether WebKit should be allowed to access the user's
    audio and video source devices when requested through the getUserMedia API.
    
    When a WebKitUserMediaPermissionRequest is not handled by the user,
    it is denied by default.
*/
struct WebKitUserMediaPermissionRequest;

/** */
struct WebKitUserMediaPermissionRequestClass
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
    [webkitwebprocessextension.user_message.UserMessage.sendReply].
*/
struct WebKitUserMessage;

/** */
struct WebKitUserMessageClass
{
  /** */
  GInitiallyUnownedClass parentClass;
}

/**
    A JavaScript snippet which can be injected in loaded pages.
*/
struct WebKitUserScript;

/**
    A CSS style sheet which can be injected in loaded pages.
*/
struct WebKitUserStyleSheet;

/**
    Manages aspects common to all #WebKitWebView<!-- -->s
    
    The #WebKitWebContext manages all aspects common to all
    #WebKitWebView<!-- -->s.
    
    You can define the #WebKitCacheModel with
    [webkit.web_context.WebContext.setCacheModel], depending on the needs of
    your application. You can access the #WebKitSecurityManager to specify
    the behaviour of your application regarding security using
    [webkit.web_context.WebContext.getSecurityManager].
    
    It is also possible to change your preferred language or enable
    spell checking, using [webkit.web_context.WebContext.setPreferredLanguages],
    [webkit.web_context.WebContext.setSpellCheckingLanguages] and
    [webkit.web_context.WebContext.setSpellCheckingEnabled].
    
    You can use [webkit.web_context.WebContext.registerUriScheme] to register
    custom URI schemes, and manage several other settings.
    
    TLS certificate validation failure is now treated as a transport
    error by default. To handle TLS failures differently, you can
    connect to #WebKitWebView::load-failed-with-tls-errors.
    Alternatively, you can use webkit_web_context_set_tls_errors_policy()
    to set the policy [webkit.types.TLSErrorsPolicy.Ignore]; however, this is
    not appropriate for Internet applications.
*/
struct WebKitWebContext;

/** */
struct WebKitWebContextClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Represents a way to specify a group of URLs for use in WebExtensions.
    
    All match patterns are specified as strings. Apart from the special `<all_urls>` pattern, match patterns
    consist of three parts: scheme, host, and path.
    
    Generally, match patterns are returned from a #WebKitWebExtension.
*/
struct WebKitWebExtensionMatchPattern;

/**
    Access to the WebKit inspector.
    
    The WebKit Inspector is a graphical tool to inspect and change the
    content of a #WebKitWebView. It also includes an interactive
    JavaScript debugger. Using this class one can get a #GtkWidget
    which can be embedded into an application to show the inspector.
    
    The inspector is available when the #WebKitSettings of the
    #WebKitWebView has set the #WebKitSettings:enable-developer-extras
    to true, otherwise no inspector is available.
    
    ```c
    // Enable the developer extras
    WebKitSettings *settings = webkit_web_view_get_settings (WEBKIT_WEB_VIEW(my_webview));
    g_object_set (G_OBJECT(settings), "enable-developer-extras", TRUE, NULL);
    
    // Load some data or reload to be able to inspect the page
    webkit_web_view_load_uri (WEBKIT_WEB_VIEW(my_webview), "http://www.gnome.org");
    
    // Show the inspector
    WebKitWebInspector *inspector = webkit_web_view_get_inspector (WEBKIT_WEB_VIEW(my_webview));
    webkit_web_inspector_show (WEBKIT_WEB_INSPECTOR(inspector));
    ```
*/
struct WebKitWebInspector;

/** */
struct WebKitWebInspectorClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Represents a resource at the end of a URI.
    
    A #WebKitWebResource encapsulates content for each resource at the
    end of a particular URI. For example, one #WebKitWebResource will
    be created for each separate image and stylesheet when a page is
    loaded.
    
    You can access the response and the URI for a given
    #WebKitWebResource, using [webkit.web_resource.WebResource.getUri] and
    [webkit.web_resource.WebResource.getResponse], as well as the raw data, using
    [webkit.web_resource.WebResource.getData].
*/
struct WebKitWebResource;

/** */
struct WebKitWebResourceClass
{
  /** */
  GObjectClass parentClass;
}

/**
    The central class of the WPE WebKit and WebKitGTK APIs.
    
    #WebKitWebView is the central class of the WPE WebKit and WebKitGTK
    APIs. It is responsible for managing the drawing of the content and
    forwarding of events. You can load any URI into the #WebKitWebView or
    a data string. With #WebKitSettings you can control various aspects
    of the rendering and loading of the content.
    
    Note that in WebKitGTK, #WebKitWebView is scrollable by itself, so
    you don't need to embed it in a #GtkScrolledWindow.
*/
struct WebKitWebView
{
  /** */
  WebKitWebViewBase parentInstance;

  /** */
  WebKitWebViewPrivate* priv;
}

/** */
struct WebKitWebViewBase
{
  /** */
  GtkWidget parentInstance;

  /** */
  WebKitWebViewBasePrivate* priv;
}

/** */
struct WebKitWebViewBaseClass
{
  /** */
  GtkWidgetClass parentClass;

  /** */
  extern(C) void function() WebkitReserved0;

  /** */
  extern(C) void function() WebkitReserved1;

  /** */
  extern(C) void function() WebkitReserved2;

  /** */
  extern(C) void function() WebkitReserved3;
}

/** */
struct WebKitWebViewBasePrivate;

/** */
struct WebKitWebViewClass
{
  /** */
  WebKitWebViewBaseClass parent;

  /** */
  extern(C) void function(WebKitWebView* webView, WebKitLoadEvent loadEvent) loadChanged;

  /** */
  extern(C) gboolean function(WebKitWebView* webView, WebKitLoadEvent loadEvent, const(char)* failingUri, GError* error) loadFailed;

  /** */
  extern(C) GtkWidget* function(WebKitWebView* webView, WebKitNavigationAction* navigationAction) create;

  /** */
  extern(C) void function(WebKitWebView* webView) readyToShow;

  /** */
  extern(C) void function(WebKitWebView* webView) runAsModal;

  /** */
  extern(C) void function(WebKitWebView* webView) close;

  /** */
  extern(C) gboolean function(WebKitWebView* webView, WebKitScriptDialog* dialog) scriptDialog;

  /** */
  extern(C) gboolean function(WebKitWebView* webView, WebKitPolicyDecision* decision, WebKitPolicyDecisionType type) decidePolicy;

  /** */
  extern(C) gboolean function(WebKitWebView* webView, WebKitPermissionRequest* permissionRequest) permissionRequest;

  /** */
  extern(C) void function(WebKitWebView* webView, WebKitHitTestResult* hitTestResult, uint modifiers) mouseTargetChanged;

  /** */
  extern(C) gboolean function(WebKitWebView* webView, WebKitPrintOperation* printOperation) print;

  /** */
  extern(C) void function(WebKitWebView* webView, WebKitWebResource* resource, WebKitURIRequest* request) resourceLoadStarted;

  /** */
  extern(C) gboolean function(WebKitWebView* webView) enterFullscreen;

  /** */
  extern(C) gboolean function(WebKitWebView* webView) leaveFullscreen;

  /** */
  extern(C) gboolean function(WebKitWebView* webView, WebKitFileChooserRequest* request) runFileChooser;

  /** */
  extern(C) gboolean function(WebKitWebView* webView, WebKitContextMenu* contextMenu, WebKitHitTestResult* hitTestResult) contextMenu;

  /** */
  extern(C) void function(WebKitWebView* webView) contextMenuDismissed;

  /** */
  extern(C) void function(WebKitWebView* webView, WebKitFormSubmissionRequest* request) submitForm;

  /** */
  extern(C) void function(WebKitWebView* webView, WebKitInsecureContentEvent event) insecureContentDetected;

  /** */
  extern(C) gboolean function(WebKitWebView* webView) webProcessCrashed;

  /** */
  extern(C) gboolean function(WebKitWebView* webView, WebKitAuthenticationRequest* request) authenticate;

  /** */
  extern(C) gboolean function(WebKitWebView* webView, const(char)* failingUri, GTlsCertificate* certificate, GTlsCertificateFlags errors) loadFailedWithTlsErrors;

  /** */
  extern(C) gboolean function(WebKitWebView* webView, WebKitNotification* notification) showNotification;

  /** */
  extern(C) gboolean function(WebKitWebView* webView, WebKitColorChooserRequest* request) runColorChooser;

  /** */
  extern(C) gboolean function(WebKitWebView* webView, WebKitOptionMenu* menu, GdkRectangle* rectangle) showOptionMenu;

  /** */
  extern(C) void function(WebKitWebView* webView, WebKitWebProcessTerminationReason reason) webProcessTerminated;

  /** */
  extern(C) gboolean function(WebKitWebView* webView, WebKitUserMessage* message) userMessageReceived;

  /** */
  extern(C) gboolean function(WebKitWebView* webView, WebKitPermissionStateQuery* query) queryPermissionState;

  /** */
  extern(C) void function() WebkitReserved0;

  /** */
  extern(C) void function() WebkitReserved1;

  /** */
  extern(C) void function() WebkitReserved2;

  /** */
  extern(C) void function() WebkitReserved3;

  /** */
  extern(C) void function() WebkitReserved4;

  /** */
  extern(C) void function() WebkitReserved5;

  /** */
  extern(C) void function() WebkitReserved6;

  /** */
  extern(C) void function() WebkitReserved7;

  /** */
  extern(C) void function() WebkitReserved8;

  /** */
  extern(C) void function() WebkitReserved9;

  /** */
  extern(C) void function() WebkitReserved10;

  /** */
  extern(C) void function() WebkitReserved11;

  /** */
  extern(C) void function() WebkitReserved12;

  /** */
  extern(C) void function() WebkitReserved13;

  /** */
  extern(C) void function() WebkitReserved14;

  /** */
  extern(C) void function() WebkitReserved15;

  /** */
  extern(C) void function() WebkitReserved16;

  /** */
  extern(C) void function() WebkitReserved17;

  /** */
  extern(C) void function() WebkitReserved18;

  /** */
  extern(C) void function() WebkitReserved19;

  /** */
  extern(C) void function() WebkitReserved20;

  /** */
  extern(C) void function() WebkitReserved21;

  /** */
  extern(C) void function() WebkitReserved22;

  /** */
  extern(C) void function() WebkitReserved23;

  /** */
  extern(C) void function() WebkitReserved24;

  /** */
  extern(C) void function() WebkitReserved25;

  /** */
  extern(C) void function() WebkitReserved26;

  /** */
  extern(C) void function() WebkitReserved27;

  /** */
  extern(C) void function() WebkitReserved28;

  /** */
  extern(C) void function() WebkitReserved29;

  /** */
  extern(C) void function() WebkitReserved30;
}

/** */
struct WebKitWebViewPrivate;

/**
    Handles serialization of a web view's browsing state.
*/
struct WebKitWebViewSessionState;

/**
    Data stored locally by a web site.
    
    WebKitWebsiteData represents data stored in the client by a particular website.
    A website is normally a set of URLs grouped by domain name. You can get the website name,
    which is usually the domain, with [webkit.website_data.WebsiteData.getName].
    Documents loaded from the file system, like file:// URIs, are all grouped in the same WebKitWebsiteData
    with the name "Local files".
    
    A website can store different types of data in the client side. #WebKitWebsiteDataTypes is an enum containing
    all the possible data types; use [webkit.website_data.WebsiteData.getTypes] to get the bitmask of data types.
    It's also possible to know the size of the data stored for some of the #WebKitWebsiteDataTypes by using
    [webkit.website_data.WebsiteData.getSize].
    
    A list of WebKitWebsiteData can be retrieved with [webkit.website_data_manager.WebsiteDataManager.fetch]. See #WebKitWebsiteDataManager
    for more information.
*/
struct WebKitWebsiteData;

/**
    A permission request for accessing website data from third-party domains.
    
    WebKitWebsiteDataAccessPermissionRequest represents a request for
    permission to allow a third-party domain access its cookies.
    
    When a WebKitWebsiteDataAccessPermissionRequest is not handled by the user,
    it is denied by default.
*/
struct WebKitWebsiteDataAccessPermissionRequest;

/** */
struct WebKitWebsiteDataAccessPermissionRequestClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Manages data stored locally by web sites.
    
    You can use WebKitWebsiteDataManager to configure the local directories
    where website data will be stored. Use #WebKitWebsiteDataManager:base-data-directory
    and #WebKitWebsiteDataManager:base-cache-directory set a common base directory for all
    website data and caches.
    
    A WebKitWebsiteDataManager can be ephemeral, in which case all the directory configuration
    is not needed because website data will never persist. You can create an ephemeral WebKitWebsiteDataManager
    with webkit_website_data_manager_new_ephemeral().
    
    WebKitWebsiteDataManager can also be used to fetch website data, remove data
    stored by particular websites, or clear data for all websites modified since a given
    period of time.
*/
struct WebKitWebsiteDataManager;

/** */
struct WebKitWebsiteDataManagerClass
{
  /** */
  GObjectClass parentClass;
}

/**
    View specific website policies.
    
    WebKitWebsitePolicies allows you to configure per-page policies,
    currently only autoplay policies are supported.
*/
struct WebKitWebsitePolicies;

/** */
struct WebKitWebsitePoliciesClass
{
  /** */
  GObjectClass parentClass;
}

/**
    Window properties of a #WebKitWebView.
    
    The content of a #WebKitWebView can request to change certain
    properties of the window containing the view. This can include the x, y position
    of the window, the width and height but also if a toolbar,
    scrollbar, statusbar, locationbar should be visible to the user,
    and the request to show the #WebKitWebView fullscreen.
    
    The #WebKitWebView::ready-to-show signal handler is the proper place
    to apply the initial window properties. Then you can monitor the
    #WebKitWindowProperties by connecting to ::notify signal.
    
    ```c
    static void ready_to_show_cb (WebKitWebView *web_view, gpointer user_data)
    {
        GtkWidget *window;
        WebKitWindowProperties *window_properties;
        gboolean visible;
    
        // Create the window to contain the WebKitWebView.
        window = browser_window_new ();
        gtk_container_add (GTK_CONTAINER (window), GTK_WIDGET (web_view));
        gtk_widget_show (GTK_WIDGET (web_view));
    
        // Get the WebKitWindowProperties of the web view and monitor it.
        window_properties = webkit_web_view_get_window_properties (web_view);
        g_signal_connect (window_properties, "notify::geometry",
                          G_CALLBACK (window_geometry_changed), window);
        g_signal_connect (window_properties, "notify::toolbar-visible",
                          G_CALLBACK (window_toolbar_visibility_changed), window);
        g_signal_connect (window_properties, "notify::menubar-visible",
                          G_CALLBACK (window_menubar_visibility_changed), window);
    
        // Apply the window properties before showing the window.
        visible = webkit_window_properties_get_toolbar_visible (window_properties);
        browser_window_set_toolbar_visible (BROWSER_WINDOW (window), visible);
        visible = webkit_window_properties_get_menubar_visible (window_properties);
        browser_window_set_menubar_visible (BROWSER_WINDOW (window), visible);
    
        if (webkit_window_properties_get_fullscreen (window_properties)) {
            gtk_window_fullscreen (GTK_WINDOW (window));
        } else {
            GdkRectangle geometry;
    
            gtk_window_set_resizable (GTK_WINDOW (window),
                                      webkit_window_properties_get_resizable (window_properties));
            webkit_window_properties_get_geometry (window_properties, &geometry);
            gtk_window_move (GTK_WINDOW (window), geometry.x, geometry.y);
            gtk_window_resize (GTK_WINDOW (window), geometry.width, geometry.height);
        }
    
        gtk_widget_show (window);
    }
    ```
*/
struct WebKitWindowProperties;

/** */
struct WebKitWindowPropertiesClass
{
  /** */
  GObjectClass parentClass;
}

alias extern(C) void function(WebKitURISchemeRequest* request, void* userData) WebKitURISchemeRequestCallback;

