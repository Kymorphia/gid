/// Module for [WebHitTestResult] class
module webkitwebprocessextension.web_hit_test_result;

import gid.gid;
import gobject.object;
import javascriptcore.value;
import webkitwebprocessextension.c.functions;
import webkitwebprocessextension.c.types;
import webkitwebprocessextension.script_world;
import webkitwebprocessextension.types;

/**
    Result of a Hit Test (Web Process Extensions).
    
    WebKitWebHitTestResult extends #WebKitHitTestResult to provide information
    about the #WebKitDOMNode in the coordinates of the Hit Test.
*/
class WebHitTestResult : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_web_hit_test_result_get_type != &gidSymbolNotFound ? webkit_web_hit_test_result_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WebHitTestResult self()
  {
    return this;
  }

  /**
      Check whether there is an editable element at the hit test position.
      
      Checks whether [webkit.types.HitTestResultContext.Editable] flag is present in
      the context flags.
      Returns: true if the hit test covers an editable element or false otherwise.
  */
  bool contextIsEditable()
  {
    bool _retval;
    _retval = cast(bool)webkit_web_hit_test_result_context_is_editable(cast(WebKitWebHitTestResult*)this._cPtr);
    return _retval;
  }

  /**
      Check whether there is an image element at the hit test position.
      
      Checks whether [webkit.types.HitTestResultContext.Image] flag is present in
      the context flags.
      Returns: true if the hit test covers an image element or false otherwise.
  */
  bool contextIsImage()
  {
    bool _retval;
    _retval = cast(bool)webkit_web_hit_test_result_context_is_image(cast(WebKitWebHitTestResult*)this._cPtr);
    return _retval;
  }

  /**
      Check whether there is a link element at the hit test position.
      
      Checks whether [webkit.types.HitTestResultContext.Link] flag is present in
      the context flags.
      Returns: true if the hit test covers a link element or false otherwise.
  */
  bool contextIsLink()
  {
    bool _retval;
    _retval = cast(bool)webkit_web_hit_test_result_context_is_link(cast(WebKitWebHitTestResult*)this._cPtr);
    return _retval;
  }

  /**
      Check whether there is a media element at the hit test position.
      
      Checks whether [webkit.types.HitTestResultContext.Media] flag is present in
      the context flags.
      Returns: true if the hit test covers a media element or false otherwise.
  */
  bool contextIsMedia()
  {
    bool _retval;
    _retval = cast(bool)webkit_web_hit_test_result_context_is_media(cast(WebKitWebHitTestResult*)this._cPtr);
    return _retval;
  }

  /**
      Check whether there is a scrollbar at the hit test position.
      
      Checks whether [webkit.types.HitTestResultContext.Scrollbar] flag is present in
      the context flags.
      Returns: true if the hit test covers a scrollbar or false otherwise.
  */
  bool contextIsScrollbar()
  {
    bool _retval;
    _retval = cast(bool)webkit_web_hit_test_result_context_is_scrollbar(cast(WebKitWebHitTestResult*)this._cPtr);
    return _retval;
  }

  /**
      Check whether there is a selected element at the hit test position.
      
      Checks whether [webkit.types.HitTestResultContext.Selection] flag is present in
      the context flags.
      Returns: true if the hit test covers a selected element or false otherwise.
  */
  bool contextIsSelection()
  {
    bool _retval;
    _retval = cast(bool)webkit_web_hit_test_result_context_is_selection(cast(WebKitWebHitTestResult*)this._cPtr);
    return _retval;
  }

  /**
      Gets the the context flags for the hit test result.
      Returns: a bitmask of #WebKitHitTestResultContext flags
  */
  uint getContext()
  {
    uint _retval;
    _retval = webkit_web_hit_test_result_get_context(cast(WebKitWebHitTestResult*)this._cPtr);
    return _retval;
  }

  /**
      Obtains the URI associated with the image element at the hit test position.
      Returns: the URI of the image element, or null if the hit test does not cover an image element.
  */
  string getImageUri()
  {
    const(char)* _cretval;
    _cretval = webkit_web_hit_test_result_get_image_uri(cast(WebKitWebHitTestResult*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the #JSCValue for the DOM node in world at the coordinates of the Hit Test.
  
      Params:
        world = a #WebKitScriptWorld, or null to use the default
      Returns: a #JSCValue for the DOM node, or null
  */
  javascriptcore.value.Value getJsNode(webkitwebprocessextension.script_world.ScriptWorld world = null)
  {
    JSCValue* _cretval;
    _cretval = webkit_web_hit_test_result_get_js_node(cast(WebKitWebHitTestResult*)this._cPtr, world ? cast(WebKitScriptWorld*)world._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Obtains the label associated with the link element at the hit test position.
      Returns: the label of the link element, or null if the hit test does not cover a link element
           or the link element does not have a label.
  */
  string getLinkLabel()
  {
    const(char)* _cretval;
    _cretval = webkit_web_hit_test_result_get_link_label(cast(WebKitWebHitTestResult*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Obtains the title associated with the link element at the hit test position.
      Returns: the title of the link element, or null if the hit test does not cover a link element
           or the link element does not have a title.
  */
  string getLinkTitle()
  {
    const(char)* _cretval;
    _cretval = webkit_web_hit_test_result_get_link_title(cast(WebKitWebHitTestResult*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Obtains the URI associated with the link element at the hit test position.
      Returns: the URI of the link element, or null if the hit test does not cover a link element.
  */
  string getLinkUri()
  {
    const(char)* _cretval;
    _cretval = webkit_web_hit_test_result_get_link_uri(cast(WebKitWebHitTestResult*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Obtains the URI associated with the media element at the hit test position.
      Returns: the URI of the media element, or null if the hit test does not cover a media element.
  */
  string getMediaUri()
  {
    const(char)* _cretval;
    _cretval = webkit_web_hit_test_result_get_media_uri(cast(WebKitWebHitTestResult*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
