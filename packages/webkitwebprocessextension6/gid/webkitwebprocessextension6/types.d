/// D types for webkitwebprocessextension6 library
module gid.webkitwebprocessextension6.types;

import gid.core.utils;
import gid.glib2.variant;
import gid.webkitwebprocessextension6.c.functions;
import gid.webkitwebprocessextension6.c.types;
import gid.webkitwebprocessextension6.web_process_extension;


// Enums

/** */
alias ConsoleMessageLevel = WebKitConsoleMessageLevel;

/** */
alias ConsoleMessageSource = WebKitConsoleMessageSource;

/** */
alias ContextMenuAction = WebKitContextMenuAction;

/** */
alias HitTestResultContext = WebKitHitTestResultContext;

/** */
alias UserMessageError = WebKitUserMessageError;

// Callbacks

/**
    Type definition for a function that will be called to initialize
    the web extension when the web process starts.

    Params:
      extension = a #WebKitWebProcessExtension
*/
alias WebProcessExtensionInitializeFunction = void delegate(gid.webkitwebprocessextension6.web_process_extension.WebProcessExtension extension);

/**
    Type definition for a function that will be called to initialize
    the web extensions when the web process starts, and which receives
    as additional argument the user data set with
    [gid.webkit6.web_context.WebContext.setWebProcessExtensionsInitializationUserData].

    Params:
      extension = a #WebKitWebProcessExtension
      userData = a #GVariant
*/
alias WebProcessExtensionInitializeWithUserDataFunction = void delegate(gid.webkitwebprocessextension6.web_process_extension.WebProcessExtension extension, gid.glib2.variant.Variant userData);
