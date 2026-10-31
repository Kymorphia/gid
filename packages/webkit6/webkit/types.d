/// D types for webkit6 library
module webkit.types;

import gid.gid;
import webkit.c.functions;
import webkit.c.types;
import webkit.urischeme_request;


// Enums

/** */
alias AuthenticationScheme = WebKitAuthenticationScheme;

/** */
alias AutomationBrowsingContextPresentation = WebKitAutomationBrowsingContextPresentation;

/** */
alias AutoplayPolicy = WebKitAutoplayPolicy;

/** */
alias CacheModel = WebKitCacheModel;

/** */
alias ContextMenuAction = WebKitContextMenuAction;

/** */
alias CookieAcceptPolicy = WebKitCookieAcceptPolicy;

/** */
alias CookiePersistentStorage = WebKitCookiePersistentStorage;

/** */
alias CredentialPersistence = WebKitCredentialPersistence;

/** */
alias DownloadError = WebKitDownloadError;

/** */
alias EditorTypingAttributes = WebKitEditorTypingAttributes;

/** */
alias FaviconDatabaseError = WebKitFaviconDatabaseError;

/** */
alias FeatureStatus = WebKitFeatureStatus;

/** */
alias FindOptions = WebKitFindOptions;

/** */
alias HardwareAccelerationPolicy = WebKitHardwareAccelerationPolicy;

/** */
alias HitTestResultContext = WebKitHitTestResultContext;

/** */
alias InputHints = WebKitInputHints;

/** */
alias InputPurpose = WebKitInputPurpose;

/** */
alias InsecureContentEvent = WebKitInsecureContentEvent;

/** */
alias JavascriptError = WebKitJavascriptError;

/** */
alias LoadEvent = WebKitLoadEvent;

/** */
alias MediaCaptureState = WebKitMediaCaptureState;

/** */
alias MediaError = WebKitMediaError;

/** */
alias NavigationType = WebKitNavigationType;

/** */
alias NetworkError = WebKitNetworkError;

/** */
alias NetworkProxyMode = WebKitNetworkProxyMode;

/** */
alias PermissionState = WebKitPermissionState;

/** */
alias PolicyDecisionType = WebKitPolicyDecisionType;

/** */
alias PolicyError = WebKitPolicyError;

/** */
alias PrintError = WebKitPrintError;

/** */
alias PrintOperationResponse = WebKitPrintOperationResponse;

/** */
alias SaveMode = WebKitSaveMode;

/** */
alias ScriptDialogType = WebKitScriptDialogType;

/** */
alias SnapshotError = WebKitSnapshotError;

/** */
alias SnapshotOptions = WebKitSnapshotOptions;

/** */
alias SnapshotRegion = WebKitSnapshotRegion;

/** */
alias TLSErrorsPolicy = WebKitTLSErrorsPolicy;

/** */
alias UserContentFilterError = WebKitUserContentFilterError;

/** */
alias UserContentInjectedFrames = WebKitUserContentInjectedFrames;

/** */
alias UserMessageError = WebKitUserMessageError;

/** */
alias UserScriptInjectionTime = WebKitUserScriptInjectionTime;

/** */
alias UserStyleLevel = WebKitUserStyleLevel;

/** */
alias WebExtensionError = WebKitWebExtensionError;

/** */
alias WebExtensionMatchPatternError = WebKitWebExtensionMatchPatternError;

/** */
alias WebExtensionMatchPatternOptions = WebKitWebExtensionMatchPatternOptions;

/** */
alias WebExtensionMode = WebKitWebExtensionMode;

/** */
alias WebProcessTerminationReason = WebKitWebProcessTerminationReason;

/** */
alias WebsiteDataTypes = WebKitWebsiteDataTypes;

/** */
alias XRSessionFeatures = WebKitXRSessionFeatures;

/** */
alias XRSessionMode = WebKitXRSessionMode;

// Callbacks

/**
    Type definition for a function that will be called back when an URI request is
    made for a user registered URI scheme.

    Params:
      request = the #WebKitURISchemeRequest
*/
alias URISchemeRequestCallback = void delegate(webkit.urischeme_request.URISchemeRequest request);

/**
    The copy clipboard command. Copies the current selection inside
    a #WebKitWebView to the clipboard.
    You can check whether it's possible to execute the command with
    [webkit.web_view.WebView.canExecuteEditingCommand]. In general it's
    possible to copy to the clipboard when there is an active selection
    inside the #WebKitWebView.
*/
enum EDITING_COMMAND_COPY = "Copy";

/**
    The create link command. Creates a link element that is inserted at
    the current cursor position. If there's a selection, the selected text
    will be used as the link text, otherwise the URL itself will be used.
    It receives the link URL as argument. This command should be executed
    with [webkit.web_view.WebView.executeEditingCommandWithArgument]
*/
enum EDITING_COMMAND_CREATE_LINK = "CreateLink";

/**
    The cut clipboard command. Copies the current selection inside
    a #WebKitWebView to the clipboard and deletes the selected content.
    You can check whether it's possible to execute the command with
    [webkit.web_view.WebView.canExecuteEditingCommand]. In general it's
    possible to cut to the clipboard when the #WebKitWebView content is
    editable and there is an active selection.
*/
enum EDITING_COMMAND_CUT = "Cut";

/**
    The insert image command. Creates an image element that is inserted at
    the current cursor position. It receives an URI as argument,
    that is used as the image source. This command should be executed with
    [webkit.web_view.WebView.executeEditingCommandWithArgument].
*/
enum EDITING_COMMAND_INSERT_IMAGE = "InsertImage";

/**
    The paste clipboard command. Pastes the contents of the clipboard to
    a #WebKitWebView.
    You can check whether it's possible to execute the command with
    [webkit.web_view.WebView.canExecuteEditingCommand]. In general it's possible
    to paste from the clipboard when the #WebKitWebView content is editable
    and clipboard is not empty.
*/
enum EDITING_COMMAND_PASTE = "Paste";

/**
    The paste as plaintext clipboard command. Pastes the contents of the
    clipboard to a #WebKitWebView, with formatting removed.
    You can check whether it's possible to execute the command with
    [webkit.web_view.WebView.canExecuteEditingCommand]. In general it's possible
    to paste from the clipboard when the #WebKitWebView content is editable
    and clipboard is not empty.
*/
enum EDITING_COMMAND_PASTE_AS_PLAIN_TEXT = "PasteAsPlainText";

/**
    The redo command. Redoes a previously undone editing command in
    a #WebKitWebView.
    You can check whether it's possible to execute the command with
    [webkit.web_view.WebView.canExecuteEditingCommand]. It's only possible
    to redo a command when it has been previously undone.
*/
enum EDITING_COMMAND_REDO = "Redo";

/**
    The select all command. Selects all the content of the current text field in
    a #WebKitWebView.
    It is always possible to select all text, no matter whether the
    #WebKitWebView content is editable or not. You can still check it
    with [webkit.web_view.WebView.canExecuteEditingCommand].
*/
enum EDITING_COMMAND_SELECT_ALL = "SelectAll";

/**
    The undo command. Undoes the last editing command in a #WebKitWebView.
    You can check whether it's possible to execute the command with
    [webkit.web_view.WebView.canExecuteEditingCommand]. It's only possible
    to undo a command after a previously executed editing operation.
*/
enum EDITING_COMMAND_UNDO = "Undo";

/**
    Like [webkit.global.getMajorVersion], but from the headers used at
    application compile time, rather than from the library linked
    against at application run time.
*/
enum MAJOR_VERSION = 2;

/**
    Like [webkit.global.getMicroVersion], but from the headers used at
    application compile time, rather than from the library linked
    against at application run time.
*/
enum MICRO_VERSION = 6;

/**
    Like [webkit.global.getMinorVersion], but from the headers used at
    application compile time, rather than from the library linked
    against at application run time.
*/
enum MINOR_VERSION = 52;
