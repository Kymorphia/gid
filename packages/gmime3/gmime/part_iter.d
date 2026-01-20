/// Module for [PartIter] class
module gmime.part_iter;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.object;
import gmime.types;
import gobject.boxed;
import gobject.object;

/**
    A MIME part iterator.
*/
class PartIter : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_mime_part_iter_get_type != &gidSymbolNotFound ? g_mime_part_iter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PartIter self()
  {
    return this;
  }

  /**
      Creates a new #GMimePartIter for iterating over toplevel's subparts.
  
      Params:
        toplevel = a #GMimeObject to use as the toplevel
      Returns: a newly allocated #GMimePartIter which should be freed
        using [gmime.part_iter.PartIter.free] when finished with it.
  */
  this(gmime.object.ObjectWrap toplevel)
  {
    GMimePartIter* _cretval;
    _cretval = g_mime_part_iter_new(toplevel ? cast(GMimeObject*)toplevel._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Clones the iter, including its current state.
      Returns: a new #GMimePartIter that is identical to iter.
  */
  gmime.part_iter.PartIter clone()
  {
    GMimePartIter* _cretval;
    _cretval = g_mime_part_iter_clone(cast(GMimePartIter*)this._cPtr);
    auto _retval = _cretval ? new gmime.part_iter.PartIter(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the #GMimeObject at the current #GMimePartIter position.
      Returns: the current #GMimeObject or null if the
        state of iter is invalid.
  */
  gmime.object.ObjectWrap getCurrent()
  {
    GMimeObject* _cretval;
    _cretval = g_mime_part_iter_get_current(cast(GMimePartIter*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.object.ObjectWrap)(cast(GMimeObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the parent of the #GMimeObject at the current #GMimePartIter
      position.
      Returns: the parent #GMimeObject or null if the
        state of iter is invalid.
  */
  gmime.object.ObjectWrap getParent()
  {
    GMimeObject* _cretval;
    _cretval = g_mime_part_iter_get_parent(cast(GMimePartIter*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.object.ObjectWrap)(cast(GMimeObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the path of the current #GMimeObject in the MIME structure
      used to initialize iter.
      Returns: a newly allocated string representation of the path to the
        #GMimeObject at the current #GMimePartIter position.
  */
  string getPath()
  {
    char* _cretval;
    _cretval = g_mime_part_iter_get_path(cast(GMimePartIter*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the toplevel #GMimeObject used to initialize iter.
      Returns: the toplevel #GMimeObject.
  */
  gmime.object.ObjectWrap getToplevel()
  {
    GMimeObject* _cretval;
    _cretval = g_mime_part_iter_get_toplevel(cast(GMimePartIter*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.object.ObjectWrap)(cast(GMimeObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks that the current state of iter is valid.
      Returns: true if iter is valid or false otherwise.
  */
  bool isValid()
  {
    bool _retval;
    _retval = cast(bool)g_mime_part_iter_is_valid(cast(GMimePartIter*)this._cPtr);
    return _retval;
  }

  /**
      Updates the state of iter to point to the #GMimeObject specified
      by path.
  
      Params:
        path = a string representing the path to jump to
      Returns: true if the #GMimeObject specified by path exists or
        false otherwise.
  */
  bool jumpTo(string path)
  {
    bool _retval;
    const(char)* _path = path.toCString(No.Alloc);
    _retval = cast(bool)g_mime_part_iter_jump_to(cast(GMimePartIter*)this._cPtr, _path);
    return _retval;
  }

  /**
      Advances to the next part in the MIME structure used to initialize
      iter.
      Returns: true if successful or false otherwise.
  */
  bool next()
  {
    bool _retval;
    _retval = cast(bool)g_mime_part_iter_next(cast(GMimePartIter*)this._cPtr);
    return _retval;
  }

  /**
      Rewinds to the previous part in the MIME structure used to
      initialize iter.
      Returns: true if successful or false otherwise.
  */
  bool prev()
  {
    bool _retval;
    _retval = cast(bool)g_mime_part_iter_prev(cast(GMimePartIter*)this._cPtr);
    return _retval;
  }

  /**
      Removes the #GMimeObject at the current position from its
      parent. If successful, iter is advanced to the next position
      (since the current position will become invalid).
      Returns: true if the part at the current position was removed or
        false otherwise.
  */
  bool remove()
  {
    bool _retval;
    _retval = cast(bool)g_mime_part_iter_remove(cast(GMimePartIter*)this._cPtr);
    return _retval;
  }

  /**
      Replaces the #GMimeObject at the current position with replacement.
  
      Params:
        replacement = a #GMimeObject
      Returns: true if the part at the current position was replaced or
        false otherwise.
  */
  bool replace(gmime.object.ObjectWrap replacement)
  {
    bool _retval;
    _retval = cast(bool)g_mime_part_iter_replace(cast(GMimePartIter*)this._cPtr, replacement ? cast(GMimeObject*)replacement._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Resets the state of iter to its initial state.
  */
  void reset()
  {
    g_mime_part_iter_reset(cast(GMimePartIter*)this._cPtr);
  }
}
