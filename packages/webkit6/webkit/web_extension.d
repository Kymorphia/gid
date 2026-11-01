/// Module for [WebExtension] class
module webkit.web_extension;

public import gid.basictypes;
import gid.gid;
import gio.icon;
import gio.initable;
import gio.initable_mixin;
import glib.error;
import gobject.gid_builder;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;
import webkit.web_extension_match_pattern;

/**
    Represents a [WebExtension](https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions).
    
    A #WebKitWebExtension object encapsulates a web extension’s
    resources that are defined by a [`manifest.json` file](https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/manifest.json).
    
    This class handles the reading and parsing of the manifest file
    along with the supporting resources like icons and localizations.
*/
class WebExtension : gobject.object.ObjectWrap, gio.initable.Initable
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_web_extension_get_type != &gidSymbolNotFound ? webkit_web_extension_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WebExtension self() nothrow
  {
    return this;
  }

  /**
      Get builder for [webkit.web_extension.WebExtension]
      Returns: New builder object
  */
  static WebExtensionGidBuilder builder() nothrow
  {
    return new WebExtensionGidBuilder;
  }

  /**
      Get `defaultLocale` property.
      Returns: The default locale for the #WebKitWebExtension.
        See [webkit.web_extension.WebExtension.getDefaultLocale] for more details.
  */
  @property string defaultLocale() nothrow
  {
    return getDefaultLocale();
  }

  /**
      Get `displayActionLabel` property.
      Returns: The localized extension action label of the #WebKitWebExtension.
        See [webkit.web_extension.WebExtension.getDisplayActionLabel] for more details.
  */
  @property string displayActionLabel() nothrow
  {
    return getDisplayActionLabel();
  }

  /**
      Get `displayDescription` property.
      Returns: The localized description of the #WebKitWebExtension.
        See [webkit.web_extension.WebExtension.getDisplayDescription] for more details.
  */
  @property string displayDescription() nothrow
  {
    return getDisplayDescription();
  }

  /**
      Get `displayName` property.
      Returns: The localized name of the #WebKitWebExtension.
        See [webkit.web_extension.WebExtension.getDisplayName] for more details.
  */
  @property string displayName() nothrow
  {
    return getDisplayName();
  }

  /**
      Get `displayShortName` property.
      Returns: The localized short name of the #WebKitWebExtension.
        See [webkit.web_extension.WebExtension.getDisplayShortName] for more details.
  */
  @property string displayShortName() nothrow
  {
    return getDisplayShortName();
  }

  /**
      Get `displayVersion` property.
      Returns: The localized display version of the #WebKitWebExtension.
        See [webkit.web_extension.WebExtension.getDisplayVersion] for more details.
  */
  @property string displayVersion() nothrow
  {
    return getDisplayVersion();
  }

  /**
      Get `hasBackgroundContent` property.
      Returns: Whether the #WebKitWebExtension has background content that can run when needed.
        See [webkit.web_extension.WebExtension.getHasBackgroundContent] for more details.
  */
  @property bool hasBackgroundContent() nothrow
  {
    return getHasBackgroundContent();
  }

  /**
      Get `hasCommands` property.
      Returns: Whether the #WebKitWebExtension includes commands that users can invoke.
        See [webkit.web_extension.WebExtension.getHasCommands] for more details.
  */
  @property bool hasCommands() nothrow
  {
    return getHasCommands();
  }

  /**
      Get `hasContentModificationRules` property.
      Returns: Whether the #WebKitWebExtension includes rules used for content modification or blocking.
        See webkit_web_extension_get_content_modification_rules() for more details.
  */
  @property bool hasContentModificationRules() nothrow
  {
    return getHasContentModificationRules();
  }

  /**
      Get `hasInjectedContent` property.
      Returns: Whether the #WebKitWebExtension has script or stylesheet content that can be injected into webpages.
        See [webkit.web_extension.WebExtension.getHasInjectedContent] for more details.
  */
  @property bool hasInjectedContent() nothrow
  {
    return getHasInjectedContent();
  }

  /**
      Get `hasOptionsPage` property.
      Returns: Whether the #WebKitWebExtension has an options page.
        See [webkit.web_extension.WebExtension.getHasOptionsPage] for more details.
  */
  @property bool hasOptionsPage() nothrow
  {
    return getHasOptionsPage();
  }

  /**
      Get `hasOverrideNewTabPage` property.
      Returns: Whether the #WebKitWebExtension provides an alternative to the default new tab page.
        See [webkit.web_extension.WebExtension.getHasOverrideNewTabPage] for more details.
  */
  @property bool hasOverrideNewTabPage() nothrow
  {
    return getHasOverrideNewTabPage();
  }

  /**
      Get `hasPersistentBackgroundContent` property.
      Returns: Whether the #WebKitWebExtension has background content that stays in memory as long as the extension is loaded.
        See [webkit.web_extension.WebExtension.getHasPersistentBackgroundContent] for more details.
  */
  @property bool hasPersistentBackgroundContent() nothrow
  {
    return getHasPersistentBackgroundContent();
  }

  /**
      Get `manifestVersion` property.
      Returns: The parsed manifest version of the #WebKitWebExtension.
        See [webkit.web_extension.WebExtension.getManifestVersion] for more details.
  */
  @property string manifestVersion() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("manifest-version");
  }

  /**
      Get `optionalPermissions` property.
      Returns: The set of permissions that the #WebKitWebExtension may need for optional functionality.
        See [webkit.web_extension.WebExtension.getOptionalPermissions] for more details.
  */
  @property string[] optionalPermissions() nothrow
  {
    return getOptionalPermissions();
  }

  /**
      Get `path` property.
      Returns: A string pointing to the folder containing the extension manifest and resources.
        See [webkit.web_extension.WebExtension.getPath] for more details.
  */
  @property string path() nothrow
  {
    return getPath();
  }

  /**
      Get `requestedPermissions` property.
      Returns: The set of permissions that the #WebKitWebExtension requires for its base functionality.
        See [webkit.web_extension.WebExtension.getRequestedPermissions] for more details.
  */
  @property string[] requestedPermissions() nothrow
  {
    return getRequestedPermissions();
  }

  /**
      Get `version_` property.
      Returns: The version of the #WebKitWebExtension.
        See [webkit.web_extension.WebExtension.getVersion] for more details.
  */
  @property string version_() nothrow
  {
    return getVersion();
  }

  mixin InitableT!();

  /**
      Creates a new WebKitWebExtension from a folder containing the extension contents. The folder must
      contain a `manifest.json` file. If the manifest is invalid or missing, an error will be returned.
  
      Params:
        extensionPath = A string pointing to the folder containing the extension manifest and resources
      Returns: the new #WebKitWebExtension, or null if the extension failed to be created
      Throws: [ErrorWrap]
  */
  this(string extensionPath)
  {
    WebKitWebExtension* _cretval;
    const(char)* _extensionPath = extensionPath.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = webkit_web_extension_new(_extensionPath, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    this(_cretval, Yes.Take);
  }

  /**
      Returns the extension's default action icon image for the specified size.
      This icon serves as a default and should be used to represent the extension in contexts like action sheets or toolbars prior to
      the extension being loaded into an extension context. Once the extension is loaded, use the
      ``actionForTab:`` API to get the tab-specific icon.
      The returned image will be the best match for the specified size that is available in the extension's action icon set. If no matching icon is available,
      the method will fall back to the extension's icon.
  
      Params:
        width = The width to use when looking up the icon.
        height = The height to use when looking up the icon.
      Returns: the icon image, or null if no icon could be loaded.
  */
  gio.icon.Icon getActionIcon(double width, double height) nothrow
  {
    GIcon* _cretval;
    _cretval = webkit_web_extension_get_action_icon(cast(WebKitWebExtension*)this._cPtr, width, height);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the set of websites that the extension requires access to for injected content
      and for receiving messages from websites.
      Returns: a
           null-terminated array of match patterns matching all requested websites.
  */
  webkit.web_extension_match_pattern.WebExtensionMatchPattern[] getAllRequestedMatchPatterns() nothrow
  {
    WebKitWebExtensionMatchPattern** _cretval;
    _cretval = webkit_web_extension_get_all_requested_match_patterns(cast(WebKitWebExtension*)this._cPtr);
    webkit.web_extension_match_pattern.WebExtensionMatchPattern[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new webkit.web_extension_match_pattern.WebExtensionMatchPattern[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = new webkit.web_extension_match_pattern.WebExtensionMatchPattern(cast(void*)_cretval[i], Yes.Take);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Get the default locale for the extension.
      Returns: the default locale, or null if there was no default
        locale specified.
  */
  string getDefaultLocale() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_web_extension_get_default_locale(cast(WebKitWebExtension*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the localized display action label for the extension.
      
      This label serves as a default and should be used to represent the extension in contexts like action sheets or toolbars prior to
      the extension being loaded into an extension context.
      Once the extension is loaded, use the ``actionForTab:`` API to get the tab-specific label.
      Returns: the localized display action label, or null if there
        was no display action label specified.
  */
  string getDisplayActionLabel() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_web_extension_get_display_action_label(cast(WebKitWebExtension*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the localized display description for the extension.
      Returns: the localized display description, or null if there
        was no display description specified.
  */
  string getDisplayDescription() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_web_extension_get_display_description(cast(WebKitWebExtension*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the localized name for the extension.
      Returns: the localized name, or null if there was no
        name specified.
  */
  string getDisplayName() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_web_extension_get_display_name(cast(WebKitWebExtension*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the localized short name for the extension.
      Returns: the localized name, or null if there was no
        short name specified.
  */
  string getDisplayShortName() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_web_extension_get_display_short_name(cast(WebKitWebExtension*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the localized display version for the extension.
      Returns: the localized display version, or null if there was no
        display version specified.
  */
  string getDisplayVersion() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_web_extension_get_display_version(cast(WebKitWebExtension*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get whether the extension has background content that can run when needed.
      Returns: `TRUE` if the extension can run in the background even when no
        webpages are open.
  */
  bool getHasBackgroundContent() nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_web_extension_get_has_background_content(cast(WebKitWebExtension*)this._cPtr);
    return _retval;
  }

  /**
      Get whether the extension includes commands that users can invoke.
      
      These commands should be accessible via keyboard shortcuts,
      menu items, or other user interface elements provided
      by the app. The list of commands can be accessed
      via ``commands`` on an extension context, and
      invoked via ``performCommand:``.
      Returns: `TRUE` if the extension contains one or more commands
        that can be performed by the user.
  */
  bool getHasCommands() nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_web_extension_get_has_commands(cast(WebKitWebExtension*)this._cPtr);
    return _retval;
  }

  /**
      Get whether the extension includes rules used for
      content modification or blocking.
      Returns: `TRUE` if the extension contains one or more rules
        for content modification.
  */
  bool getHasContentModificationRules() nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_web_extension_get_has_content_modification_rules(cast(WebKitWebExtension*)this._cPtr);
    return _retval;
  }

  /**
      Get whether the extension has script or stylesheet content
      that can be injected into webpages.
      
      Once the extension is loaded, use the ``hasInjectedContent``
      property on an extension context, as the injectable content
      can change after the extension is loaded.
      Returns: `TRUE` if the extension has content that can be
        injected by matching against the extension's
        requested match patterns.
  */
  bool getHasInjectedContent() nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_web_extension_get_has_injected_content(cast(WebKitWebExtension*)this._cPtr);
    return _retval;
  }

  /**
      Get whether the extension has an options page.
      
      The app should provide access to this page through a
      user interface element, which can be accessed via
      ``optionsPageURL`` on an extension context.
      Returns: `TRUE` if the extension includes a dedicated options
        page where users can customize settings.
  */
  bool getHasOptionsPage() nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_web_extension_get_has_options_page(cast(WebKitWebExtension*)this._cPtr);
    return _retval;
  }

  /**
      Get whether the extension provides an alternative to
      the default new tab page.
      
      The app should prompt the user for permission to use
      the extension's new tab page as the default, which can
      be accessed via ``overrideNewTabPageURL``
      on an extension context.
      Returns: `TRUE` if the extension can specify a custom page
        that can be displayed when a new tab is opened in the app,
        instead of the default new tab page.
  */
  bool getHasOverrideNewTabPage() nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_web_extension_get_has_override_new_tab_page(cast(WebKitWebExtension*)this._cPtr);
    return _retval;
  }

  /**
      Get whether the extension has background content that stays in memory as long
      as the extension is loaded.
      Returns: `TRUE` if the extension can run in the background.
  */
  bool getHasPersistentBackgroundContent() nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_web_extension_get_has_persistent_background_content(cast(WebKitWebExtension*)this._cPtr);
    return _retval;
  }

  /**
      Returns the extension's icon image for the specified size.
      This icon should represent the extension in settings or other areas that show the extension.
      The returned image will be the best match for the specified size that is available in the extension's
      icon set. If no matching icon can be found, the method will return null.
  
      Params:
        width = The width to use when looking up the icon.
        height = The height to use when looking up the icon.
      Returns: the icon image, or null if no icon could be loaded.
  */
  gio.icon.Icon getIcon(double width, double height) nothrow
  {
    GIcon* _cretval;
    _cretval = webkit_web_extension_get_icon(cast(WebKitWebExtension*)this._cPtr, width, height);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the parsed manifest version, or `0` if there is no
      version specified in the manifest.
      
      A `errorWebKit.WebExtensionError.UNSUPPORTED_MANIFEST_VERSION` error will be
      reported if the manifest version isn't specified.
      Returns: the parsed manifest version.
  */
  double getManifestVersion() nothrow
  {
    double _retval;
    _retval = webkit_web_extension_get_manifest_version(cast(WebKitWebExtension*)this._cPtr);
    return _retval;
  }

  /**
      Get the set of websites that the extension may need access to for optional functionality.
      These match patterns can be requested by the extension at a later time.
      Returns: a
           null-terminated array of match patterns matching the optional websites.
  */
  webkit.web_extension_match_pattern.WebExtensionMatchPattern[] getOptionalPermissionMatchPatterns() nothrow
  {
    WebKitWebExtensionMatchPattern** _cretval;
    _cretval = webkit_web_extension_get_optional_permission_match_patterns(cast(WebKitWebExtension*)this._cPtr);
    webkit.web_extension_match_pattern.WebExtensionMatchPattern[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new webkit.web_extension_match_pattern.WebExtensionMatchPattern[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = new webkit.web_extension_match_pattern.WebExtensionMatchPattern(cast(void*)_cretval[i], Yes.Take);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Get the set of permissions that the extension may need for
      optional functionality. These permissions can be requested
      by the extension at a later time.
      Returns: a
        null-terminated array of strings containing permission names,
        or null otherwise. This array and its contents are owned by
        WebKit and should not be modified or freed.
  */
  string[] getOptionalPermissions() nothrow
  {
    const(char*)* _cretval;
    _cretval = webkit_web_extension_get_optional_permissions(cast(WebKitWebExtension*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(No.Free);
    }
    return _retval;
  }

  /**
      Get the path pointing to the folder containing the extension manifest and resources
      Returns: the path of the extension folder
  */
  string getPath() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_web_extension_get_path(cast(WebKitWebExtension*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the set of websites that the extension requires access to for its base functionality.
      Returns: a
           null-terminated array of match patterns matching the required websites.
  */
  webkit.web_extension_match_pattern.WebExtensionMatchPattern[] getRequestedPermissionMatchPatterns() nothrow
  {
    WebKitWebExtensionMatchPattern** _cretval;
    _cretval = webkit_web_extension_get_requested_permission_match_patterns(cast(WebKitWebExtension*)this._cPtr);
    webkit.web_extension_match_pattern.WebExtensionMatchPattern[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new webkit.web_extension_match_pattern.WebExtensionMatchPattern[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = new webkit.web_extension_match_pattern.WebExtensionMatchPattern(cast(void*)_cretval[i], Yes.Take);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Get the set of permissions that the extension requires
      for its base functionality.
      Returns: a
        null-terminated array of strings containing permission names,
        or null otherwise. This array and its contents are owned by
        WebKit and should not be modified or freed.
  */
  string[] getRequestedPermissions() nothrow
  {
    const(char*)* _cretval;
    _cretval = webkit_web_extension_get_requested_permissions(cast(WebKitWebExtension*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(No.Free);
    }
    return _retval;
  }

  /**
      Get the version for the extension.
      Returns: the version, or null if there was no
        version specified.
  */
  string getVersion() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_web_extension_get_version(cast(WebKitWebExtension*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Checks if a manifest version is supported by the extension.
  
      Params:
        manifestVersion = the version number to check
      Returns: `TRUE` if the extension specified a manifest version
        that is greater than or equal to manifest_version.
  */
  bool supportsManifestVersion(double manifestVersion) nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_web_extension_supports_manifest_version(cast(WebKitWebExtension*)this._cPtr, manifestVersion);
    return _retval;
  }
}

/// Fluent builder implementation template for [webkit.web_extension.WebExtension]
class WebExtensionGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gio.initable.InitableGidBuilderImpl!T
{

  mixin InitableGidBuilderT!();

  /**
      Set `path` property.
      Params:
        propval = A string pointing to the folder containing the extension manifest and resources.
          See [webkit.web_extension.WebExtension.getPath] for more details.
      Returns: Builder instance for fluent chaining
  */
  T path(string propval) nothrow
  {
    return setProperty("path", propval);
  }
}

/// Fluent builder for [webkit.web_extension.WebExtension]
final class WebExtensionGidBuilder : WebExtensionGidBuilderImpl!WebExtensionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  WebExtension build() nothrow
  {
    return new WebExtension(cast(void*)createGObject(WebExtension._getGType), Yes.Take);
  }
}
