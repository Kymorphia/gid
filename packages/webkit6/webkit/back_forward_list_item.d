/// Module for [BackForwardListItem] class
module webkit.back_forward_list_item;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gobject.initially_unowned;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    One item of the #WebKitBackForwardList.
    
    A history item is part of the #WebKitBackForwardList and consists
    out of a title and a URI.
*/
class BackForwardListItem : gobject.initially_unowned.InitiallyUnowned
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_back_forward_list_item_get_type != &gidSymbolNotFound ? webkit_back_forward_list_item_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BackForwardListItem self() nothrow
  {
    return this;
  }

  /**
      Get builder for [webkit.back_forward_list_item.BackForwardListItem]
      Returns: New builder object
  */
  static BackForwardListItemGidBuilder builder() nothrow
  {
    return new BackForwardListItemGidBuilder;
  }

  /**
      Obtain the original URI of the item.
      
      See also [webkit.back_forward_list_item.BackForwardListItem.getUri].
      Returns: the original URI of list_item or null
           when the original URI is empty.
  */
  string getOriginalUri() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_back_forward_list_item_get_original_uri(cast(WebKitBackForwardListItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Obtain the title of the item.
      Returns: the page title of list_item or null
           when the title is empty.
  */
  string getTitle() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_back_forward_list_item_get_title(cast(WebKitBackForwardListItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Obtain the URI of the item.
      
      This URI may differ from the original URI if the page was,
      for example, redirected to a new location.
      See also [webkit.back_forward_list_item.BackForwardListItem.getOriginalUri].
      Returns: the URI of list_item or null
           when the URI is empty.
  */
  string getUri() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_back_forward_list_item_get_uri(cast(WebKitBackForwardListItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [webkit.back_forward_list_item.BackForwardListItem]
class BackForwardListItemGidBuilderImpl(T) : gobject.initially_unowned.InitiallyUnownedGidBuilderImpl!T
{
}

/// Fluent builder for [webkit.back_forward_list_item.BackForwardListItem]
final class BackForwardListItemGidBuilder : BackForwardListItemGidBuilderImpl!BackForwardListItemGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BackForwardListItem build() nothrow
  {
    return new BackForwardListItem(cast(void*)createGObject(BackForwardListItem._getGType), No.Take);
  }
}
