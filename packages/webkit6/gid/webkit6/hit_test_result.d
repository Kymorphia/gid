/// Module for [HitTestResult] class
module gid.webkit6.hit_test_result;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;

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
class HitTestResult : gid.gobject2.object.ObjectWrap
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
    return cast(void function())webkit_hit_test_result_get_type != &gidSymbolNotFound ? webkit_hit_test_result_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitHitTestResult";
  }

  /** Returns `this`, for use in `with` statements. */
  override HitTestResult self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkit6.hit_test_result.HitTestResult]
      Returns: New builder object
  */
  static HitTestResultGidBuilder builder() nothrow
  {
    return new HitTestResultGidBuilder;
  }

  /**
      Get `context` property.
      Returns: Bitmask of #WebKitHitTestResultContext flags representing
        the context of the #WebKitHitTestResult.
  */
  @property uint context() nothrow
  {
    return getContext();
  }

  /**
      Get `imageUri` property.
      Returns: The URI of the image if flag [gid.webkitwebprocessextension6.types.HitTestResultContext.Image]
        is present in #WebKitHitTestResult:context
  */
  @property string imageUri() nothrow
  {
    return getImageUri();
  }

  /**
      Get `linkLabel` property.
      Returns: The label of the link if flag [gid.webkitwebprocessextension6.types.HitTestResultContext.Link]
        is present in #WebKitHitTestResult:context
  */
  @property string linkLabel() nothrow
  {
    return getLinkLabel();
  }

  /**
      Get `linkTitle` property.
      Returns: The title of the link if flag [gid.webkitwebprocessextension6.types.HitTestResultContext.Link]
        is present in #WebKitHitTestResult:context
  */
  @property string linkTitle() nothrow
  {
    return getLinkTitle();
  }

  /**
      Get `linkUri` property.
      Returns: The URI of the link if flag [gid.webkitwebprocessextension6.types.HitTestResultContext.Link]
        is present in #WebKitHitTestResult:context
  */
  @property string linkUri() nothrow
  {
    return getLinkUri();
  }

  /**
      Get `mediaUri` property.
      Returns: The URI of the media if flag [gid.webkitwebprocessextension6.types.HitTestResultContext.Media]
        is present in #WebKitHitTestResult:context
  */
  @property string mediaUri() nothrow
  {
    return getMediaUri();
  }

  /**
      Gets whether [gid.webkitwebprocessextension6.types.HitTestResultContext.Editable] flag is present in
      #WebKitHitTestResult:context.
      Returns: true if there's an editable element at the coordinates of the hit_test_result,
           or false otherwise
  */
  bool contextIsEditable() nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_hit_test_result_context_is_editable(cast(WebKitHitTestResult*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether [gid.webkitwebprocessextension6.types.HitTestResultContext.Image] flag is present in
      #WebKitHitTestResult:context.
      Returns: true if there's an image element in the coordinates of the Hit Test,
           or false otherwise
  */
  bool contextIsImage() nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_hit_test_result_context_is_image(cast(WebKitHitTestResult*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether [gid.webkitwebprocessextension6.types.HitTestResultContext.Link] flag is present in
      #WebKitHitTestResult:context.
      Returns: true if there's a link element in the coordinates of the Hit Test,
           or false otherwise
  */
  bool contextIsLink() nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_hit_test_result_context_is_link(cast(WebKitHitTestResult*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether [gid.webkitwebprocessextension6.types.HitTestResultContext.Media] flag is present in
      #WebKitHitTestResult:context.
      Returns: true if there's a media element in the coordinates of the Hit Test,
           or false otherwise
  */
  bool contextIsMedia() nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_hit_test_result_context_is_media(cast(WebKitHitTestResult*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether [gid.webkitwebprocessextension6.types.HitTestResultContext.Scrollbar] flag is present in
      #WebKitHitTestResult:context.
      Returns: true if there's a scrollbar element at the coordinates of the hit_test_result,
           or false otherwise
  */
  bool contextIsScrollbar() nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_hit_test_result_context_is_scrollbar(cast(WebKitHitTestResult*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether [gid.webkitwebprocessextension6.types.HitTestResultContext.Selection] flag is present in
      #WebKitHitTestResult:context.
      Returns: true if there's a selected element at the coordinates of the hit_test_result,
           or false otherwise
  */
  bool contextIsSelection() nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_hit_test_result_context_is_selection(cast(WebKitHitTestResult*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of the #WebKitHitTestResult:context property.
      Returns: a bitmask of #WebKitHitTestResultContext flags
  */
  uint getContext() nothrow
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
  string getImageUri() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_hit_test_result_get_image_uri(cast(WebKitHitTestResult*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the value of the #WebKitHitTestResult:link-label property.
      Returns: the label of the link element in the coordinates of the Hit Test,
           or null if there isn't a link element in hit_test_result context or the
           link element doesn't have a label
  */
  string getLinkLabel() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_hit_test_result_get_link_label(cast(WebKitHitTestResult*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the value of the #WebKitHitTestResult:link-title property.
      Returns: the title of the link element in the coordinates of the Hit Test,
           or null if there isn't a link element in hit_test_result context or the
           link element doesn't have a title
  */
  string getLinkTitle() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_hit_test_result_get_link_title(cast(WebKitHitTestResult*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the value of the #WebKitHitTestResult:link-uri property.
      Returns: the URI of the link element in the coordinates of the Hit Test,
           or null if there isn't a link element in hit_test_result context
  */
  string getLinkUri() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_hit_test_result_get_link_uri(cast(WebKitHitTestResult*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the value of the #WebKitHitTestResult:media-uri property.
      Returns: the URI of the media element in the coordinates of the Hit Test,
           or null if there isn't a media element in hit_test_result context
  */
  string getMediaUri() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_hit_test_result_get_media_uri(cast(WebKitHitTestResult*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.webkit6.hit_test_result.HitTestResult]
class HitTestResultGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `context` property.
      Params:
        propval = Bitmask of #WebKitHitTestResultContext flags representing
          the context of the #WebKitHitTestResult.
      Returns: Builder instance for fluent chaining
  */
  T context(uint propval) nothrow
  {
    return setProperty("context", propval);
  }

  /**
      Set `imageUri` property.
      Params:
        propval = The URI of the image if flag [gid.webkitwebprocessextension6.types.HitTestResultContext.Image]
          is present in #WebKitHitTestResult:context
      Returns: Builder instance for fluent chaining
  */
  T imageUri(string propval) nothrow
  {
    return setProperty("image-uri", propval);
  }

  /**
      Set `linkLabel` property.
      Params:
        propval = The label of the link if flag [gid.webkitwebprocessextension6.types.HitTestResultContext.Link]
          is present in #WebKitHitTestResult:context
      Returns: Builder instance for fluent chaining
  */
  T linkLabel(string propval) nothrow
  {
    return setProperty("link-label", propval);
  }

  /**
      Set `linkTitle` property.
      Params:
        propval = The title of the link if flag [gid.webkitwebprocessextension6.types.HitTestResultContext.Link]
          is present in #WebKitHitTestResult:context
      Returns: Builder instance for fluent chaining
  */
  T linkTitle(string propval) nothrow
  {
    return setProperty("link-title", propval);
  }

  /**
      Set `linkUri` property.
      Params:
        propval = The URI of the link if flag [gid.webkitwebprocessextension6.types.HitTestResultContext.Link]
          is present in #WebKitHitTestResult:context
      Returns: Builder instance for fluent chaining
  */
  T linkUri(string propval) nothrow
  {
    return setProperty("link-uri", propval);
  }

  /**
      Set `mediaUri` property.
      Params:
        propval = The URI of the media if flag [gid.webkitwebprocessextension6.types.HitTestResultContext.Media]
          is present in #WebKitHitTestResult:context
      Returns: Builder instance for fluent chaining
  */
  T mediaUri(string propval) nothrow
  {
    return setProperty("media-uri", propval);
  }
}

/// Fluent builder for [gid.webkit6.hit_test_result.HitTestResult]
final class HitTestResultGidBuilder : HitTestResultGidBuilderImpl!HitTestResultGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  HitTestResult build() nothrow
  {
    return new HitTestResult(cast(void*)createGObject(HitTestResult._getGType), Yes.Take);
  }
}
