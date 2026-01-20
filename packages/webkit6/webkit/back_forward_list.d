/// Module for [BackForwardList] class
module webkit.back_forward_list;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import webkit.back_forward_list_item;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

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
class BackForwardList : gobject.object.ObjectWrap
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
    return cast(void function())webkit_back_forward_list_get_type != &gidSymbolNotFound ? webkit_back_forward_list_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BackForwardList self()
  {
    return this;
  }

  /**
      Returns the item that precedes the current item.
      Returns: the #WebKitBackForwardListItem
           preceding the current item or null.
  */
  webkit.back_forward_list_item.BackForwardListItem getBackItem()
  {
    WebKitBackForwardListItem* _cretval;
    _cretval = webkit_back_forward_list_get_back_item(cast(WebKitBackForwardList*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.back_forward_list_item.BackForwardListItem)(cast(WebKitBackForwardListItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtain the list of items preceding the current one.
      Returns: a #GList of
           items preceding the current item.
  */
  webkit.back_forward_list_item.BackForwardListItem[] getBackList()
  {
    GList* _cretval;
    _cretval = webkit_back_forward_list_get_back_list(cast(WebKitBackForwardList*)this._cPtr);
    auto _retval = gListToD!(webkit.back_forward_list_item.BackForwardListItem, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Obtain a list up to some number of items preceding the current one.
  
      Params:
        limit = the number of items to retrieve
      Returns: a #GList of
           items preceding the current item limited by limit.
  */
  webkit.back_forward_list_item.BackForwardListItem[] getBackListWithLimit(uint limit)
  {
    GList* _cretval;
    _cretval = webkit_back_forward_list_get_back_list_with_limit(cast(WebKitBackForwardList*)this._cPtr, limit);
    auto _retval = gListToD!(webkit.back_forward_list_item.BackForwardListItem, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Returns the current item in back_forward_list.
      Returns: a #WebKitBackForwardListItem
           or null if back_forward_list is empty.
  */
  webkit.back_forward_list_item.BackForwardListItem getCurrentItem()
  {
    WebKitBackForwardListItem* _cretval;
    _cretval = webkit_back_forward_list_get_current_item(cast(WebKitBackForwardList*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.back_forward_list_item.BackForwardListItem)(cast(WebKitBackForwardListItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the item that follows the current item.
      Returns: the #WebKitBackForwardListItem
           following the current item or null.
  */
  webkit.back_forward_list_item.BackForwardListItem getForwardItem()
  {
    WebKitBackForwardListItem* _cretval;
    _cretval = webkit_back_forward_list_get_forward_item(cast(WebKitBackForwardList*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.back_forward_list_item.BackForwardListItem)(cast(WebKitBackForwardListItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtain the list of items following the current one.
      Returns: a #GList of
           items following the current item.
  */
  webkit.back_forward_list_item.BackForwardListItem[] getForwardList()
  {
    GList* _cretval;
    _cretval = webkit_back_forward_list_get_forward_list(cast(WebKitBackForwardList*)this._cPtr);
    auto _retval = gListToD!(webkit.back_forward_list_item.BackForwardListItem, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Obtain a list up to some number of items following the current one.
  
      Params:
        limit = the number of items to retrieve
      Returns: a #GList of
           items following the current item limited by limit.
  */
  webkit.back_forward_list_item.BackForwardListItem[] getForwardListWithLimit(uint limit)
  {
    GList* _cretval;
    _cretval = webkit_back_forward_list_get_forward_list_with_limit(cast(WebKitBackForwardList*)this._cPtr, limit);
    auto _retval = gListToD!(webkit.back_forward_list_item.BackForwardListItem, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Obtain the amount of items in the list.
      Returns: the length of back_forward_list.
  */
  uint getLength()
  {
    uint _retval;
    _retval = webkit_back_forward_list_get_length(cast(WebKitBackForwardList*)this._cPtr);
    return _retval;
  }

  /**
      Returns the item at a given index relative to the current item.
  
      Params:
        index = the index of the item
      Returns: the #WebKitBackForwardListItem
           located at the specified index relative to the current item or null.
  */
  webkit.back_forward_list_item.BackForwardListItem getNthItem(int index)
  {
    WebKitBackForwardListItem* _cretval;
    _cretval = webkit_back_forward_list_get_nth_item(cast(WebKitBackForwardList*)this._cPtr, index);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.back_forward_list_item.BackForwardListItem)(cast(WebKitBackForwardListItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Connect to `Changed` signal.
  
      This signal is emitted when back_forward_list changes. This happens
        when the current item is updated, a new item is added or one or more
        items are removed. Note that both item_added and items_removed can
        null when only the current item is updated. Items are only removed
        when the list is cleared or the maximum items limit is reached.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.back_forward_list_item.BackForwardListItem itemAdded, void* itemsRemoved, webkit.back_forward_list.BackForwardList backForwardList))
  
          `itemAdded` the #WebKitBackForwardListItem added or null (optional)
  
          `itemsRemoved` a #GList of #WebKitBackForwardListItem<!-- -->s (optional)
  
          `backForwardList` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.back_forward_list_item.BackForwardListItem)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == void*)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : webkit.back_forward_list.BackForwardList)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }
}
