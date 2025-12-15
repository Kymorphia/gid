/// Module for [HitTestResult] class
module webkitwebprocessextension.hit_test_result;

import gid.gid;
import gobject.object;
import webkitwebprocessextension.c.functions;
import webkitwebprocessextension.c.types;
import webkitwebprocessextension.types;

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
class HitTestResult : gobject.object.ObjectWrap
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
    return cast(void function())webkit_hit_test_result_get_type != &gidSymbolNotFound ? webkit_hit_test_result_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override HitTestResult self()
  {
    return this;
  }

  /**
      Gets whether [webkit.types.HitTestResultContext.Editable] flag is present in
      #WebKitHitTestResult:context.
      Returns: true if there's an editable element at the coordinates of the hit_test_result,
           or false otherwise
  */
  bool contextIsEditable()
  {
    bool _retval;
    _retval = cast(bool)webkit_hit_test_result_context_is_editable(cast(WebKitHitTestResult*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether [webkit.types.HitTestResultContext.Image] flag is present in
      #WebKitHitTestResult:context.
      Returns: true if there's an image element in the coordinates of the Hit Test,
           or false otherwise
  */
  bool contextIsImage()
  {
    bool _retval;
    _retval = cast(bool)webkit_hit_test_result_context_is_image(cast(WebKitHitTestResult*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether [webkit.types.HitTestResultContext.Link] flag is present in
      #WebKitHitTestResult:context.
      Returns: true if there's a link element in the coordinates of the Hit Test,
           or false otherwise
  */
  bool contextIsLink()
  {
    bool _retval;
    _retval = cast(bool)webkit_hit_test_result_context_is_link(cast(WebKitHitTestResult*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether [webkit.types.HitTestResultContext.Media] flag is present in
      #WebKitHitTestResult:context.
      Returns: true if there's a media element in the coordinates of the Hit Test,
           or false otherwise
  */
  bool contextIsMedia()
  {
    bool _retval;
    _retval = cast(bool)webkit_hit_test_result_context_is_media(cast(WebKitHitTestResult*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether [webkit.types.HitTestResultContext.Scrollbar] flag is present in
      #WebKitHitTestResult:context.
      Returns: true if there's a scrollbar element at the coordinates of the hit_test_result,
           or false otherwise
  */
  bool contextIsScrollbar()
  {
    bool _retval;
    _retval = cast(bool)webkit_hit_test_result_context_is_scrollbar(cast(WebKitHitTestResult*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether [webkit.types.HitTestResultContext.Selection] flag is present in
      #WebKitHitTestResult:context.
      Returns: true if there's a selected element at the coordinates of the hit_test_result,
           or false otherwise
  */
  bool contextIsSelection()
  {
    bool _retval;
    _retval = cast(bool)webkit_hit_test_result_context_is_selection(cast(WebKitHitTestResult*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of the #WebKitHitTestResult:context property.
      Returns: a bitmask of #WebKitHitTestResultContext flags
  */
  uint getContext()
  {
    uint _retval;
    _retval = webkit_hit_test_result_get_context(cast(WebKitHitTestResult*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of the #WebKitHitTestResult:image-uri property.
      Returns: the URI of the image element in the coordinates of the Hit Test,
           or null if there isn't an image element in hit_test_result context
  */
  string getImageUri()
  {
    const(char)* _cretval;
    _cretval = webkit_hit_test_result_get_image_uri(cast(WebKitHitTestResult*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the value of the #WebKitHitTestResult:link-label property.
      Returns: the label of the link element in the coordinates of the Hit Test,
           or null if there isn't a link element in hit_test_result context or the
           link element doesn't have a label
  */
  string getLinkLabel()
  {
    const(char)* _cretval;
    _cretval = webkit_hit_test_result_get_link_label(cast(WebKitHitTestResult*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the value of the #WebKitHitTestResult:link-title property.
      Returns: the title of the link element in the coordinates of the Hit Test,
           or null if there isn't a link element in hit_test_result context or the
           link element doesn't have a title
  */
  string getLinkTitle()
  {
    const(char)* _cretval;
    _cretval = webkit_hit_test_result_get_link_title(cast(WebKitHitTestResult*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the value of the #WebKitHitTestResult:link-uri property.
      Returns: the URI of the link element in the coordinates of the Hit Test,
           or null if there isn't a link element in hit_test_result context
  */
  string getLinkUri()
  {
    const(char)* _cretval;
    _cretval = webkit_hit_test_result_get_link_uri(cast(WebKitHitTestResult*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the value of the #WebKitHitTestResult:media-uri property.
      Returns: the URI of the media element in the coordinates of the Hit Test,
           or null if there isn't a media element in hit_test_result context
  */
  string getMediaUri()
  {
    const(char)* _cretval;
    _cretval = webkit_hit_test_result_get_media_uri(cast(WebKitHitTestResult*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
