/// Module for [FileList] class
module gdk.file_list;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;
import gio.file;
import gobject.boxed;
import gobject.object;

/**
    An opaque type representing a list of files.
*/
class FileList : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_file_list_get_type != &gidSymbolNotFound ? gdk_file_list_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileList self()
  {
    return this;
  }

  /**
      Creates a new [gdk.file_list.FileList] for the given array of files.
      
      This function is meant to be used by language bindings.
  
      Params:
        files = the files to add to the list
      Returns: the newly create files list
  */
  static gdk.file_list.FileList newFromArray(gio.file.File[] files)
  {
    GdkFileList* _cretval;
    size_t _nFiles;
    if (files)
      _nFiles = cast(size_t)files.length;

    GFile*[] _tmpfiles;
    foreach (obj; files)
      _tmpfiles ~= obj ? cast(GFile*)(cast(gobject.object.ObjectWrap)obj)._cPtr : null;
    GFile** _files = _tmpfiles.ptr;

    _cretval = gdk_file_list_new_from_array(_files, _nFiles);
    auto _retval = _cretval ? new gdk.file_list.FileList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new files list container from a singly linked list of
      [gio.file.File] instances.
      
      This function is meant to be used by language bindings
  
      Params:
        files = a list of files
      Returns: the newly created files list
  */
  static gdk.file_list.FileList newFromList(gio.file.File[] files)
  {
    GdkFileList* _cretval;
    auto _files = gSListFromD!(gio.file.File)(files);
    scope(exit) containerFree!(GSList*, gio.file.File, GidOwnership.None)(_files);
    _cretval = gdk_file_list_new_from_list(_files);
    auto _retval = _cretval ? new gdk.file_list.FileList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Retrieves the list of files inside a [gdk.file_list.FileList].
      
      This function is meant for language bindings.
      Returns: the files inside the list
  */
  gio.file.File[] getFiles()
  {
    GSList* _cretval;
    _cretval = gdk_file_list_get_files(cast(GdkFileList*)this._cPtr);
    auto _retval = gSListToD!(gio.file.File, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }
}
