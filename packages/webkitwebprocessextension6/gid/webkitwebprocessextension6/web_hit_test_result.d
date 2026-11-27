/// Module for [WebHitTestResult] class
module gid.webkitwebprocessextension6.web_hit_test_result;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.javascriptcore6.value;
import gid.webkitwebprocessextension6.c.functions;
import gid.webkitwebprocessextension6.c.types;
import gid.webkitwebprocessextension6.script_world;
import gid.webkitwebprocessextension6.types;

/**
    Result of a Hit Test (Web Process Extensions).
    
    WebKitWebHitTestResult extends #WebKitHitTestResult to provide information
    about the #WebKitDOMNode in the coordinates of the Hit Test.
*/
@gidGir("WebHitTestResult", "WebHitTestResultClass")
class WebHitTestResult : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())webkit_web_hit_test_result_get_type != &gidSymbolNotFound ? webkit_web_hit_test_result_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitWebHitTestResult";
  }

  /** Returns `this`, for use in `with` statements. */
  override WebHitTestResult self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkitwebprocessextension6.web_hit_test_result.WebHitTestResult]
      Returns: New builder object
  */
  static WebHitTestResultGidBuilder builder() nothrow
  {
    return new WebHitTestResultGidBuilder;
  }

  /**
      Check whether there is an editable element at the hit test position.
      
      Checks whether [gid.webkitwebprocessextension6.types.HitTestResultContext.Editable] flag is present in
      the context flags.
      Returns: true if the hit test covers an editable element or false otherwise.
  */
  bool contextIsEditable() nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_web_hit_test_result_context_is_editable(cast(WebKitWebHitTestResult*)this._cPtr);
    return _retval;
  }

  /**
      Check whether there is an image element at the hit test position.
      
      Checks whether [gid.webkitwebprocessextension6.types.HitTestResultContext.Image] flag is present in
      the context flags.
      Returns: true if the hit test covers an image element or false otherwise.
  */
  bool contextIsImage() nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_web_hit_test_result_context_is_image(cast(WebKitWebHitTestResult*)this._cPtr);
    return _retval;
  }

  /**
      Check whether there is a link element at the hit test position.
      
      Checks whether [gid.webkitwebprocessextension6.types.HitTestResultContext.Link] flag is present in
      the context flags.
      Returns: true if the hit test covers a link element or false otherwise.
  */
  bool contextIsLink() nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_web_hit_test_result_context_is_link(cast(WebKitWebHitTestResult*)this._cPtr);
    return _retval;
  }

  /**
      Check whether there is a media element at the hit test position.
      
      Checks whether [gid.webkitwebprocessextension6.types.HitTestResultContext.Media] flag is present in
      the context flags.
      Returns: true if the hit test covers a media element or false otherwise.
  */
  bool contextIsMedia() nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_web_hit_test_result_context_is_media(cast(WebKitWebHitTestResult*)this._cPtr);
    return _retval;
  }

  /**
      Check whether there is a scrollbar at the hit test position.
      
      Checks whether [gid.webkitwebprocessextension6.types.HitTestResultContext.Scrollbar] flag is present in
      the context flags.
      Returns: true if the hit test covers a scrollbar or false otherwise.
  */
  bool contextIsScrollbar() nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_web_hit_test_result_context_is_scrollbar(cast(WebKitWebHitTestResult*)this._cPtr);
    return _retval;
  }

  /**
      Check whether there is a selected element at the hit test position.
      
      Checks whether [gid.webkitwebprocessextension6.types.HitTestResultContext.Selection] flag is present in
      the context flags.
      Returns: true if the hit test covers a selected element or false otherwise.
  */
  bool contextIsSelection() nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_web_hit_test_result_context_is_selection(cast(WebKitWebHitTestResult*)this._cPtr);
    return _retval;
  }

  /**
      Gets the the context flags for the hit test result.
      Returns: a bitmask of #WebKitHitTestResultContext flags
  */
  uint getContext() nothrow
  {
    uint _retval;
    _retval = webkit_web_hit_test_result_get_context(cast(WebKitWebHitTestResult*)this._cPtr);
    return _retval;
  }

  /**
      Obtains the URI associated with the image element at the hit test position.
      Returns: the URI of the image element, or null if the hit test does not cover an image element.
  */
  string getImageUri() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_web_hit_test_result_get_image_uri(cast(WebKitWebHitTestResult*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the #JSCValue for the DOM node in world at the coordinates of the Hit Test.
  
      Params:
        world = a #WebKitScriptWorld, or null to use the default
      Returns: a #JSCValue for the DOM node, or null
  */
  gid.javascriptcore6.value.Value getJsNode(gid.webkitwebprocessextension6.script_world.ScriptWorld world = null) nothrow
  {
    JSCValue* _cretval;
    _cretval = webkit_web_hit_test_result_get_js_node(cast(WebKitWebHitTestResult*)this._cPtr, world ? cast(WebKitScriptWorld*)world._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.javascriptcore6.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Obtains the label associated with the link element at the hit test position.
      Returns: the label of the link element, or null if the hit test does not cover a link element
           or the link element does not have a label.
  */
  string getLinkLabel() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_web_hit_test_result_get_link_label(cast(WebKitWebHitTestResult*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Obtains the title associated with the link element at the hit test position.
      Returns: the title of the link element, or null if the hit test does not cover a link element
           or the link element does not have a title.
  */
  string getLinkTitle() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_web_hit_test_result_get_link_title(cast(WebKitWebHitTestResult*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Obtains the URI associated with the link element at the hit test position.
      Returns: the URI of the link element, or null if the hit test does not cover a link element.
  */
  string getLinkUri() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_web_hit_test_result_get_link_uri(cast(WebKitWebHitTestResult*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Obtains the URI associated with the media element at the hit test position.
      Returns: the URI of the media element, or null if the hit test does not cover a media element.
  */
  string getMediaUri() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_web_hit_test_result_get_media_uri(cast(WebKitWebHitTestResult*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.webkitwebprocessextension6.web_hit_test_result.WebHitTestResult]
class WebHitTestResultGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.webkitwebprocessextension6.web_hit_test_result.WebHitTestResult]
final class WebHitTestResultGidBuilder : WebHitTestResultGidBuilderImpl!WebHitTestResultGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  WebHitTestResult build() nothrow
  {
    return new WebHitTestResult(cast(void*)createGObject(WebHitTestResult._getGType), Yes.Take);
  }
}
