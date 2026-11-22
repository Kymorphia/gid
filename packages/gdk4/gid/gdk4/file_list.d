/// Module for [FileList] class
module gid.gdk4.file_list;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.types;
import gid.gio2.file;
import gid.gobject2.boxed;
import gid.gobject2.object;

/**
    An opaque type representing a list of files.
*/
class FileList : gid.gobject2.boxed.BoxedWrap!(gdk_file_list_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override FileList self() nothrow
  {
    return this;
  }

  /**
      Creates a new [gid.gdk4.file_list.FileList] for the given array of files.
      
      This function is meant to be used by language bindings.
  
      Params:
        files = the files to add to the list
      Returns: the newly create files list
  */
  static gid.gdk4.file_list.FileList newFromArray(gid.gio2.file.File[] files) nothrow
  {
    GdkFileList* _cretval;
    size_t _nFiles;
    if (files)
      _nFiles = cast(size_t)files.length;

    auto _files_arr = new GFile*[](files.length);
    auto _files = _files_arr.ptr;
    foreach (i, obj; files) _files[i] = obj ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)obj)._cPtr(No.Dup): null;
    _cretval = gdk_file_list_new_from_array(_files, _nFiles);
    auto _retval = _cretval ? new gid.gdk4.file_list.FileList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new files list container from a singly linked list of
      [gid.gio2.file.File] instances.
      
      This function is meant to be used by language bindings
  
      Params:
        files = a list of files
      Returns: the newly created files list
  */
  static gid.gdk4.file_list.FileList newFromList(gid.gio2.file.File[] files) nothrow
  {
    GdkFileList* _cretval;
    auto _files = gSListFromD!(gid.gio2.file.File)(files);
    scope(exit) containerFree!(GSList*, gid.gio2.file.File, GidOwnership.None)(_files);
    _cretval = gdk_file_list_new_from_list(_files);
    auto _retval = _cretval ? new gid.gdk4.file_list.FileList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Retrieves the list of files inside a [gid.gdk4.file_list.FileList].
      
      This function is meant for language bindings.
      Returns: the files inside the list
  */
  gid.gio2.file.File[] getFiles() nothrow
  {
    GSList* _cretval;
    _cretval = gdk_file_list_get_files(cast(GdkFileList*)this._cPtr);
    auto _retval = gSListToD!(gid.gio2.file.File, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }
}
