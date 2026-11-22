/// Module for [Iterator] class
module gid.gst1.iterator;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.types;
import gid.gobject2.boxed;
import gid.gobject2.types;
import gid.gobject2.value;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.types;

/**
    A GstIterator is used to retrieve multiple objects from another object in
    a threadsafe way.
    
    Various GStreamer objects provide access to their internal structures using
    an iterator.
    
    Note that if calling a GstIterator function results in your code receiving
    a refcounted object (with, say, [gid.gobject2.value.Value.getObject]), the refcount for that
    object will not be increased. Your code is responsible for taking a reference
    if it wants to continue using it later.
    
    The basic use pattern of an iterator is as follows:
    ```c
      GstIterator *it = _get_iterator(object);
      GValue item = G_VALUE_INIT;
      done = FALSE;
      while (!done) {
        switch (gst_iterator_next (it, &item)) {
          case GST_ITERATOR_OK:
            ...get/use/change item here...
            g_value_reset (&item);
            break;
          case GST_ITERATOR_RESYNC:
            ...rollback changes to items...
            gst_iterator_resync (it);
            break;
          case GST_ITERATOR_ERROR:
            ...wrong parameters were given...
            done = TRUE;
            break;
          case GST_ITERATOR_DONE:
            done = TRUE;
            break;
        }
      }
      g_value_unset (&item);
      gst_iterator_free (it);
    ```
*/
class Iterator : gid.gobject2.boxed.BoxedWrap!(gst_iterator_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Iterator self() nothrow
  {
    return this;
  }

  /**
      This #GstIterator is a convenient iterator for the common
      case where a #GstIterator needs to be returned but only
      a single object has to be considered. This happens often
      for the #GstPadIterIntLinkFunction.
  
      Params:
        type = #GType of the passed object
        object = object that this iterator should return
      Returns: the new #GstIterator for object.
  */
  static gid.gst1.iterator.Iterator newSingle(gid.gobject2.types.GType type, gid.gobject2.value.Value object) nothrow
  {
    GstIterator* _cretval;
    _cretval = gst_iterator_new_single(type, object ? cast(const(GValue)*)object._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.iterator.Iterator(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Copy the iterator and its state.
      Returns: a new copy of it.
  */
  gid.gst1.iterator.Iterator copy() nothrow
  {
    GstIterator* _cretval;
    _cretval = gst_iterator_copy(cast(const(GstIterator)*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.iterator.Iterator(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new iterator from an existing iterator. The new iterator
      will only return those elements that match the given compare function func.
      The first parameter that is passed to func is the #GValue of the current
      iterator element and the second parameter is user_data. func should
      return 0 for elements that should be included in the filtered iterator.
      
      When this iterator is freed, it will also be freed.
  
      Params:
        func = the compare function to select elements
        userData = user data passed to the compare function
      Returns: a new #GstIterator.
        
        MT safe.
  */
  gid.gst1.iterator.Iterator filter(gid.glib2.types.CompareFunc func, gid.gobject2.value.Value userData) nothrow
  {
    static gid.glib2.types.CompareFunc _static_func;

    extern(C) int _funcCallback(const(void)* a, const(void)* b) nothrow
    {
      int _retval;

      try
      {
        _retval = _static_func(a, b);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.glib2.types.CompareFunc");
      }
      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    _static_func = func;
    GstIterator* _cretval;
    _cretval = gst_iterator_filter(cast(GstIterator*)this._cPtr, _funcCB, userData ? cast(const(GValue)*)userData._cPtr(No.Dup) : null);
    _static_func = null;
    auto _retval = _cretval ? new gid.gst1.iterator.Iterator(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Folds func over the elements of iter. That is to say, func will be called
      as func (object, ret, user_data) for each object in it. The normal use
      of this procedure is to accumulate the results of operating on the objects in
      ret.
      
      This procedure can be used (and is used internally) to implement the
      [gid.gst1.iterator.Iterator.foreach_] and [gid.gst1.iterator.Iterator.findCustom] operations.
      
      The fold will proceed as long as func returns true. When the iterator has no
      more arguments, [gid.gst1.types.IteratorResult.Done] will be returned. If func returns false,
      the fold will stop, and [gid.gst1.types.IteratorResult.Ok] will be returned. Errors or resyncs
      will cause fold to return [gid.gst1.types.IteratorResult.Error] or [gid.gst1.types.IteratorResult.Resync] as
      appropriate.
      
      The iterator will not be freed.
  
      Params:
        func = the fold function
        ret = the seed value passed to the fold function
      Returns: A #GstIteratorResult, as described above.
        
        MT safe.
  */
  gid.gst1.types.IteratorResult fold(gid.gst1.types.IteratorFoldFunction func, gid.gobject2.value.Value ret) nothrow
  {
    extern(C) gboolean _funcCallback(const(GValue)* item, GValue* ret, void* userData) nothrow
    {
      bool _dretval;
      auto _dlg = cast(gid.gst1.types.IteratorFoldFunction*)userData;
      auto _ret = ret ? new gid.gobject2.value.Value(cast(void*)ret, Yes.Take)._cBorrow : null;

      try
      {
        _dretval = (*_dlg)(item ? new gid.gobject2.value.Value(cast(void*)item, No.Take) : null, _ret);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.types.IteratorFoldFunction");
      }
      auto _retval = cast(gboolean)_dretval;
      if (_ret)
        _ret._cUnborrow;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    GstIteratorResult _cretval;
    auto _func = func ? cast(void*)&(func) : null;
    _cretval = gst_iterator_fold(cast(GstIterator*)this._cPtr, _funcCB, ret ? cast(GValue*)ret._cPtr(No.Dup) : null, _func);
    gid.gst1.types.IteratorResult _retval = cast(gid.gst1.types.IteratorResult)_cretval;
    return _retval;
  }

  /**
      Iterate over all element of it and call the given function func for
      each element.
  
      Params:
        func = the function to call for each element.
      Returns: the result call to [gid.gst1.iterator.Iterator.fold]. The iterator will not be
        freed.
        
        MT safe.
  */
  gid.gst1.types.IteratorResult foreach_(gid.gst1.types.IteratorForeachFunction func) nothrow
  {
    extern(C) void _funcCallback(const(GValue)* item, void* userData) nothrow
    {
      auto _dlg = cast(gid.gst1.types.IteratorForeachFunction*)userData;

      try
      {
        (*_dlg)(item ? new gid.gobject2.value.Value(cast(void*)item, No.Take) : null);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.types.IteratorForeachFunction");
      }
    }
    auto _funcCB = func ? &_funcCallback : null;
    GstIteratorResult _cretval;
    auto _func = func ? cast(void*)&(func) : null;
    _cretval = gst_iterator_foreach(cast(GstIterator*)this._cPtr, _funcCB, _func);
    gid.gst1.types.IteratorResult _retval = cast(gid.gst1.types.IteratorResult)_cretval;
    return _retval;
  }

  /**
      Get the next item from the iterator in elem.
      
      Only when this function returns [gid.gst1.types.IteratorResult.Ok], elem will contain a valid
      value. elem must have been initialized to the type of the iterator or
      initialized to zeroes with [gid.gobject2.value.Value.unset]. The caller is responsible for
      unsetting or resetting elem with [gid.gobject2.value.Value.unset] or [gid.gobject2.value.Value.reset]
      after usage.
      
      When this function returns [gid.gst1.types.IteratorResult.Done], no more elements can be
      retrieved from it.
      
      A return value of [gid.gst1.types.IteratorResult.Resync] indicates that the element list was
      concurrently updated. The user of it should call [gid.gst1.iterator.Iterator.resync] to
      get the newly updated list.
      
      A return value of [gid.gst1.types.IteratorResult.Error] indicates an unrecoverable fatal error.
  
      Params:
        elem = pointer to hold next element
      Returns: The result of the iteration. Unset elem after usage.
        
        MT safe.
  */
  gid.gst1.types.IteratorResult next(out gid.gobject2.value.Value elem) nothrow
  {
    GstIteratorResult _cretval;
    auto _elem = boxedNew!GValue(gid.gobject2.value.Value._getGType);
    _cretval = gst_iterator_next(cast(GstIterator*)this._cPtr, _elem);
    gid.gst1.types.IteratorResult _retval = cast(gid.gst1.types.IteratorResult)_cretval;
    elem = new gid.gobject2.value.Value(cast(void*)_elem, Yes.Take);
    return _retval;
  }

  /**
      Pushes other iterator onto it. All calls performed on it are
      forwarded to other. If other returns [gid.gst1.types.IteratorResult.Done], it is
      popped again and calls are handled by it again.
      
      This function is mainly used by objects implementing the iterator
      next function to recurse into substructures.
      
      When [gid.gst1.iterator.Iterator.resync] is called on it, other will automatically be
      popped.
      
      MT safe.
  
      Params:
        other = The #GstIterator to push
  */
  void push(gid.gst1.iterator.Iterator other) nothrow
  {
    gst_iterator_push(cast(GstIterator*)this._cPtr, other ? cast(GstIterator*)other._cPtr(No.Dup) : null);
  }

  /**
      Resync the iterator. this function is mostly called
      after [gid.gst1.iterator.Iterator.next] returned [gid.gst1.types.IteratorResult.Resync].
      
      When an iterator was pushed on it, it will automatically be popped again
      with this function.
      
      MT safe.
  */
  void resync() nothrow
  {
    gst_iterator_resync(cast(GstIterator*)this._cPtr);
  }
}
